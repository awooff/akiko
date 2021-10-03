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

(defn init [self & arg]
  (format "this is cojira.enginerunner"))

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

(let [result
  (run-shell-cmd "ls -al")]
    (newline)
    (println :ls-cmd)
    (println result))
