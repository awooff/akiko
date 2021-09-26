(ns cojira.uci
  (:require [clojure.string :as string ]
            [clj-http.client :as http])
  (:use [clojure.java.shell :only [sh]])
  (:gen-class))

(defmacro with-timeout [millis & body]
  "await a certain amount of time before stopping execution of a function.
  example :: ->
  (with-timeout 1000 fn []
    (println \"hewwo\"))"

  `(let [future# (future ~@body)]
    (try
      (.get future# ~millis java.util.concurrent.TimeUnit/MILLISECONDS)
      (catch java.util.concurrent.TimeoutException x#
        (do
          (future-cancel future#)
          nil)))))

(defn readuci [cmd & arg]
  "read from the engine's UCI output and post it to lichess"
  (def response (sh "curl" cmd))
  (println response))

