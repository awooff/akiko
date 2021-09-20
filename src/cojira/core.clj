(ns cojira.core
  (:require [clj-http.client :as client])
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

(defn request
  "make an api request to some place"
  [target]
  (client/get target))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println (request "https://lichess.org/api"))
  (println "Hello, World!"))
