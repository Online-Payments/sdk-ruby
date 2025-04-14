#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/capture'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::Capture>] captures
      class CapturesResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :captures

        # @return (Hash)
        def to_h
          hash = super
          hash['captures'] = @captures.collect{|val| val.to_h} unless @captures.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'captures'
            raise TypeError, "value '%s' is not an Array" % [hash['captures']] unless hash['captures'].is_a? Array
            @captures = []
            hash['captures'].each do |e|
              @captures << OnlinePayments::SDK::Domain::Capture.new_from_hash(e)
            end
          end
        end
      end
    end
  end
end
