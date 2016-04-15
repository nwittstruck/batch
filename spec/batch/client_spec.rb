require 'spec_helper'

RSpec.describe Batch::Client do

  let(:endpoint) {"https://api.batch.com/1.0/"}
  let(:api_key) {""}
  let(:rest_api_key) {""}

  # notification
  let(:group_id) {'test'}
  let(:tokens) { ["123"] }

  let(:title) { 'Title' }
  let(:body) { 'Body2' }
  let(:sandbox) { false }

  let(:custom_payload) { {:poll_id => 1} }
  let(:notification) { Batch::Notification.new({group_id: group_id, tokens: tokens, title: title, body: body, custom_payload: custom_payload, sandbox: sandbox}) }

  #def initialize(group_id, tokens = [], custom_ids = [], title, body, custom_payload)

  before {
    Batch.configure do |config|
      config.endpoint = endpoint
      config.api_key = api_key
      config.rest_api_key = rest_api_key
    end
  }


  it "can send a notification" do
    client = Batch::Client.new
    response = client.send(notification)

    expect(response['token']).to_not be_nil
  end
end