(defproject cojira "0.1.0-SNAPSHOT"
  :description "Lichess Bot API Bridge"
  :url "https://gitlab.com/harlycxss/cojira"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.1"]
                 [clj-http "3.12.3"]
                 [babashka/babashka.curl "0.0.2"]
                 [cheshire "5.10.0"]]
  :plugins [[cider/cider-nrepl "0.24.0"]]
  :main ^:skip-aot cojira.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all
                       :jvm-opts ["-Dclojure.compiler.direct-linking=true"]}})
