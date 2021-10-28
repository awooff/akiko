(defproject cojira "0.1.0-SNAPSHOT"
  :description "Lichess Bot API Bridge"
  :url "https://gitlab.com/harlycxss/cojira"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.1"]						;; yes i would like clojure in my clojure project please
                 [clj-http "3.12.3"]																	;; useful networking lib
                 [cheshire "5.10.0"]																	;; lets us decode json & put it into usable format
                 [clojurewerkz/propertied "1.3.0"]]		;; useful smol lib for working with .properties files, need this for user config
  :main ^:skip-aot cojira.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all
                       :jvm-opts ["-Dclojure.compiler.direct-linking=true"]}})
