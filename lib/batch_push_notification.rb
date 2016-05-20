module BatchPushNotification
  autoload :Configurable, 'batch_push_notification/configurable'
  autoload :Client, 'batch_push_notification/client'
  autoload :Notification, 'batch_push_notification/notification'

  class << self
    include BatchPushNotification::Configurable

    attr_accessor :logger

    def new(options = {})
      BatchPushNotification::Client.new(options)
    end

    def logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = self.name
      end
    end
  end
end
