require 'spec_helper'

RSpec.describe BatchPushNotification do

  let(:endpoint) {"https://api.batch.com/1.0/"}
  let(:api_key) {""}
  let(:rest_api_key) {""}


  it "can be configured using a block" do

    BatchPushNotification.configure do |config|
      config.endpoint = endpoint
      config.api_key = api_key
      config.rest_api_key = rest_api_key
    end

    expect(BatchPushNotification.endpoint).to eq(endpoint)
    expect(BatchPushNotification.api_key).to eq(api_key)
    expect(BatchPushNotification.rest_api_key).to eq(rest_api_key)
  end
end