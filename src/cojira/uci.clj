(ns cojira.uci
  (:require [clojure.string :as string]
            [clj-http.client :as http]
            [clojura.java.io :as io])
  (:use [clojure.java.shell :only [sh]])
  (:gen-class))

(defn readuci [cmd & arg]
  "read from the engine's UCI output and post it to lichess"
  (macroexpand '(with-timeout 1000 (fn []
  		(let response (sh "curl" cmd))
  		(println response)))))

