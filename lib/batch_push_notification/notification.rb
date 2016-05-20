module BatchPushNotification
  class Notification
    def initialize(args = {})
      @group_id = args[:group_id]
      @tokens = args[:tokens]
      @custom_ids = args[:custom_ids]
      @title = args[:title]
      @body = args[:body]
      @custom_payload = args[:custom_payload]
    end

    def payload(sandbox)
      {
          "group_id": @group_id,
          "recipients": {
              "tokens": @tokens,
              "custom_ids": @custom_ids
          },
          "message": {
              "title": @title,
              "body": @body
          },
          "custom_payload": @custom_payload.to_json.to_s, # the API expects a string instead of a JSON object
          sandbox: sandbox
      }.to_json
    end
  end
end