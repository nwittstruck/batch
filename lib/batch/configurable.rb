# Based on https://github.com/sethvargo/chef-api/blob/master/lib/chef-api/configurable.rb
module Batch
  #
  # Use this class to configure the Client
  #
  module Configurable
    class << self

      def keys
        @keys = [
            :endpoint,
            :api_key,
            :rest_api_key
        ]
      end
    end

    Batch::Configurable.keys.each do |key|
      attr_accessor key
    end

    #
    # Configure the client like this:
    #
    # Batch.configure do |config|
    #   config.endpoint = "https://api.batch.com/1.0/"
    # end
    #
    def configure
      yield self
    end
  end
end
