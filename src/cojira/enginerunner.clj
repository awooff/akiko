(ns cojira.enginerunner
  (:require [clj-http.client :as http]
            [clojure.java.io :as io]
            [clojurewerkz.propertied.properties :as prop])
  (:use [clojure.java.shell :only [sh]])
  (:gen-class))

(comment"
  # cojira.enginerunner
  runs the engine so UCI can start reading from the engine output stream.

  ## shellcmd
  executes any command given as a string.")

(defn shellcmd [cmd-str]
  "run any command from the java shell.
  example :: ->
  (let [result  (run-shell-cmd \"ls -la\")]
    (newline)
    (println :ls-cmd)
    (println result))"
  (let [result (sh "-c" cmd-str)]
    (if (= 0 (.waitFor result))
      result
      (throw (RuntimeException.
        (str "shell-cmd: clojure.java.shell/sh failed. \n"
          "cmd-str:"     cmd-str        "\n"
          "exit status:" (:exit result) "\n"
          "stderr:"      (:err  result) "\n"
          "result:"      (:out  result) "\n"
        ))))))

(defmacro with-timeout [millis & body]
		"let's not keep processes hanging too long by setting a maximum timeout for them.
		for example, if a connection request is getting stuck, or there's an error in the bot's code,
		we can just have it stop automatically and throw an error as to what process it was stuck on."
		(def body (agent 0))	;; give the body an agent
		(send-off body) ;; send it off?
		(await-for millis body) ;; wait for a number of milis to return the result of the body
		(shutdown-agents)) ;; then just shut down the worker thread.

(defn get-properties [& filepath]
		"we'll need to retrieve the config.properites so ppl can just put in the path
		to their engines instead of screwing around with source code."
		(println "hewoo"))

;; => TODO: add support for multiple engines being executed on different threads
(defn startengine [& args]
  "start the user's chosen engine"
  (def config (prop/load-from (io/resource "config.properties")))
   (.isDirectory (io/file "/engines/"))
   	(macroexpand with-timeout 1000, (fn []
   		(def config get-properties)
   		(shellcmd "echo hewwo"))))
