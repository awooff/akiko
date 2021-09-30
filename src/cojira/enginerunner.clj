(ns cojira.enginerunner
  (:require [clojure.string :as str]
            [babashka.curl :as curl]
            [clj-http.client :as http])
            [clojure.java.io :as io]
  (:use [clojure.java.shell :only [sh]]
  (:gen-class))

(comment"
  # cojira.enginerunner
  runs the engine so UCI can start reading from the engine output stream.

  ## shellcmd
  executes any command given as a string.
  ")

(defn shellcmd [cmd-str]
  "run any command from the java shell.
  example :: ->
  (let [result  (run-shell-cmd \"ls -la\")]
    (newline)
    (println :ls-cmd)
    (println result))"
  (let [result (sh *os-shell* "-c" cmd-str)]
    (if (= 0 (t/safe-> :exit result))
      result
      (throw (RuntimeException.
        (str "shell-cmd: clojure.java.shell/sh failed. \n"
          "cmd-str:"     cmd-str        "\n"
          "exit status:" (:exit result) "\n"
          "stderr:"      (:err  result) "\n"
          "result:"      (:out  result) "\n"
        ))))))

(defmacro with-timeout [millis & body]
  "await a certain amount of time before stopping execution of a function.
  example :: ->
  (macroexpand '(with-timeout 1000 (fn []
    (println \"hewwo\"))))"
  `(let [future# (future ~@body)]
    (try
      (.get future# ~millis java.util.concurrent.TimeUnit/MILLISECONDS)
      (catch java.util.concurrent.TimeoutException x#
        (do
          (future-cancel future#)
          nil)))))

;; => TODO: add support for multiple engines being executed on different threads
(defn startengine [engine_name engine_path]
  "start the user's chosen engine"
  (struct Engine engine_name engine_path isbot)
  ((.exists (io/file (format "%s/%s" engine_path engine_name)))
    (.isDirectory (io/file "/engines/"))
      (macroexpand ('with-timeout (* 1 1000) fn []
        (let [result
          (run-shell-cmd (format "./engines/%s/%s" engine_path engine_name))]
            (newline)
            (println :ls-cmd)
            (println result))))))


