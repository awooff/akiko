(ns cojira.core
  (:require [clj-http.client :as http]
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

(defn lichessbotrequest [target token]
  "tell lichess that this is a bot account"
  (let [response
        (http/get target {:headers {"Authorization: Bearer" token}})]
    ;; if it's successful, print the response
    (fn [res]
      (format "accepted, got: " res))
    ;; otherwise, throw the exception we got
    (fn [exception]
      (format "negative, got: " (.getMessage exception)))))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (def token "hi")
  (println (lichessbotrequest "https://lichess.org/api/account" token))

  (println "Hello, World!"))

