require 'spec_helper'

RSpec.describe BatchPushNotification::Client do

  let(:endpoint) {"https://api.batch.com/1.0/"}
  let(:api_key) {""}
  let(:rest_api_key) {""}

  # notification
  let(:group_id) {'test'}
  let(:tokens) { [""] }

  let(:title) { 'Title' }
  let(:body) { 'Body2' }
  let(:sandbox) { false }

  let(:custom_payload) { {:poll_id => 1} }
  let(:notification) { BatchPushNotification::Notification.new({group_id: group_id, tokens: tokens, title: title, body: body, custom_payload: custom_payload}) }


  before {
    BatchPushNotification.configure do |config|
      config.endpoint = endpoint
      config.api_key = api_key
      config.rest_api_key = rest_api_key
      config.sandbox = sandbox
    end
  }


  it "can send a notification" do
    client = BatchPushNotification::Client.new

    client.send_notification(notification)  do |response|
      expect(response['token']).to_not be_nil
    end
  end
end