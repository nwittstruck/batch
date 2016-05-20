require 'json'
require 'faraday'

module BatchPushNotification
  class Client
    attr_accessor :api_key, :endpoint, :rest_api_key, :sandbox

    def initialize(options)
      self.api_key = BatchPushNotification.api_key
      self.endpoint = BatchPushNotification.endpoint
      self.rest_api_key = BatchPushNotification.rest_api_key
      self.sandbox = BatchPushNotification.sandbox

      # overwrite settings:
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      # fail if the required params are not set:
      raise(StandardError, 'Configuration is missing') unless self.api_key && self.endpoint&& self.rest_api_key && !self.sandbox.nil?
    end

    def send_notification(notification, &on_complete)
      BatchPushNotification.logger.debug("Sending Notification")
      send_asynchronously(notification) do |response|
        on_complete.call(response)
      end
    end

    def send_asynchronously(notification, &on_complete)
      Thread.new do
        BatchPushNotification.logger.debug("Started new thread")
        response = connection.post send_url, notification.payload(self.sandbox)
        BatchPushNotification.logger.debug("Post successful, handling body next")
        on_complete.call(JSON.parse(response.body))
      end
    end


    def connection
      return Faraday.new(:url => self.endpoint) do |faraday|
        faraday.response :logger # log requests to STDOUT
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['X-Authorization'] = self.rest_api_key

        faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
      end
    end

    def send_url
      self.api_key + '/transactional/send'
    end
  end
end