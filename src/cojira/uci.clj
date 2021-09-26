(ns cojira.uci
  (:require [clojure.string :as string ]
            [clj-http.client :as http])
            [clojure.java.io :as io]
  (:use [clojure.java.shell :only [sh]])
  (:gen-class))

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

(defstruct Engine {
  :name string
  :path string
  :isbot false
  })

;; => TODO: add support for multiple engines being executed on different threads
(defn startengine [engine_name engine_path]
  "start the user's chosen engine"
  (struct Engine engine_name engine_path isbot)
  (.exists (io/file (format "%s/%s" engine_path engine_name))))

(defn readuci [cmd & arg]
  "read from the engine's UCI output and post it to lichess"
  (macroexpand '(with-timeout 1000 (fn []
  		(let response (sh "curl" cmd))
  		(println response)))))

