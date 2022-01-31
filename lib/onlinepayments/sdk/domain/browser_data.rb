#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'

module OnlinePayments::SDK
  module Domain

    # @attr [Integer] color_depth
    # @attr [true/false] java_enabled
    # @attr [true/false] java_script_enabled
    # @attr [String] screen_height
    # @attr [String] screen_width
    class BrowserData < OnlinePayments::SDK::DataObject
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
        @color_depth = hash['colorDepth'] if hash.key? 'colorDepth'
        @java_enabled = hash['javaEnabled'] if hash.key? 'javaEnabled'
        @java_script_enabled = hash['javaScriptEnabled'] if hash.key? 'javaScriptEnabled'
        @screen_height = hash['screenHeight'] if hash.key? 'screenHeight'
        @screen_width = hash['screenWidth'] if hash.key? 'screenWidth'
      end
    end
  end
end
