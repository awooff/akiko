require "log"

module Akiko
  class Lichess
    def initialize(token, url, version, logging_level, max_retries : Int8)
    end

    def api_get(endpoint, *template_args : String, params : Hash(_, _ -> String), **kwargs)
      Log.info &.emit { "hi" }
    end
  end
end
