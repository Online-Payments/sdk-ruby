#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Integer] color_depth
      # @attr [true/false] java_enabled
      # @attr [true/false] java_script_enabled
      # @attr [String] screen_height
      # @attr [String] screen_width
      class BrowserData < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :color_depth

        attr_accessor :java_enabled

        attr_accessor :java_script_enabled

        attr_accessor :screen_height

        attr_accessor :screen_width

        # @return (Hash)
        def to_h
          hash = super
          hash['colorDepth'] = @color_depth unless @color_depth.nil?
          hash['javaEnabled'] = @java_enabled unless @java_enabled.nil?
          hash['javaScriptEnabled'] = @java_script_enabled unless @java_script_enabled.nil?
          hash['screenHeight'] = @screen_height unless @screen_height.nil?
          hash['screenWidth'] = @screen_width unless @screen_width.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'colorDepth'
            @color_depth = hash['colorDepth']
          end
          if hash.has_key? 'javaEnabled'
            @java_enabled = hash['javaEnabled']
          end
          if hash.has_key? 'javaScriptEnabled'
            @java_script_enabled = hash['javaScriptEnabled']
          end
          if hash.has_key? 'screenHeight'
            @screen_height = hash['screenHeight']
          end
          if hash.has_key? 'screenWidth'
            @screen_width = hash['screenWidth']
          end
        end
      end
    end
  end
end
