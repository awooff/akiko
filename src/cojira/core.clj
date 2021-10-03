(ns cojira.core
  (:require [clj-http.client :as http]
            [babashka.curl :as curl]
            [cheshire.core :refer :all :as json]
            [clojure.string :as str])
  (:gen-class))

(comment"
  # Cojira
  steps we need to take rn
  ----------------------
  - start by making requests to the lichess API
    - these requests need to change depending on
      the UCI state, sending it the main commands:
      - game status (playing or awaiting)
      - position
      - moves

  - then we need to think about how cojira will handle
    the state of these games, caching them, displaying
    them in a webapp (maybe)? and saving data of all games
    played through it
    (this will probably mean implementing some kind of redis cache
    just to optimise for speed as well as a larger relational db
    (postgres preferred because cass likes it)

  *oh god this is going to be fun to organise as a project*")

(defn requestforbot [target token]
  "upgrade the current account to a bot account"
  (def auth (format "Bearer %s" token))
  (http/get target {:headers {"Authorization" auth}}
    ;; if it's valid, then return the body as a parsed json string
    (fn [resp]
      (format "niceu! you got: %s" (json/parse-string (:body resp))))
    ;; otherwise, throw the exception we get.
    (fn [exception]
      (format "got an exception: %s" (.getMessage exception)))))

(requestforbot "https://lichess.org/api/account" "lip_3s8d3QczxcaCZYxGkh3T")

(defn -main [& args]
  "I don't do a whole lot ... yet."
  (def token "lip_3s8d3QczxcaCZYxGkh3T")
  (def url "https://lichess.org/api/account")
  (requestforbot url token))

(-main)

