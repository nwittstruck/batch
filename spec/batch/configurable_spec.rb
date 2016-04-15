require 'spec_helper'

RSpec.describe Batch do

  let(:endpoint) {"https://api.batch.com/1.0/"}
  let(:api_key) {""}
  let(:rest_api_key) {""}


  it "can be configured using a block" do

    Batch.configure do |config|
      config.endpoint = endpoint
      config.api_key = api_key
      config.rest_api_key = rest_api_key
    end

    expect(Batch.endpoint).to eq(endpoint)
    expect(Batch.api_key).to eq(api_key)
    expect(Batch.rest_api_key).to eq(rest_api_key)
  end
end