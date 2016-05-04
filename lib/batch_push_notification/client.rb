require 'json'
require 'faraday'

module BatchPushNotification
  class Client
    def initialize
      # fail if the required params are not set:
      raise(StandardError, 'Configuration is missing') unless BatchPushNotification.endpoint && BatchPushNotification.api_key && BatchPushNotification.rest_api_key && !BatchPushNotification.sandbox.nil?
    end

    def send_notification(notification, &on_complete)
      send_asynchronously(notification) do |response|
        on_complete.call(response)
      end
    end

    def send_asynchronously(notification, &on_complete)
      Thread.new do
        response = connection.post send_url, notification.payload
        on_complete.call(JSON.parse(response.body))
      end
    end


    def connection
      return Faraday.new(:url => BatchPushNotification.endpoint) do |faraday|
        faraday.response :logger # log requests to STDOUT
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['X-Authorization'] = BatchPushNotification.rest_api_key

        faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
      end
    end

    def send_url
      BatchPushNotification.api_key + '/transactional/send'
    end
  end
end