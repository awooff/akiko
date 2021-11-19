module Akiko
  class Variants
    def initialize(info)
      @variant : String = info.variant
    end

    def supported_variant?(supported)
      @variant.each do
        @variant if supported
      end
    end
  end
end
