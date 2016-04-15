require 'Faraday'
require 'json'

module Batch
  class Client
    def send(notification)
      response = connection.post send_url, notification.payload
      return JSON.parse(response.body)
    end

    def connection
      return Faraday.new(:url => Batch.endpoint) do |faraday|
        faraday.response :logger                  # log requests to STDOUT
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['X-Authorization'] = Batch.rest_api_key

        faraday.adapter Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def send_url
      Batch.api_key + '/transactional/send'
    end
  end
end