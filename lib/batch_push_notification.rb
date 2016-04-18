module BatchPushNotification
  autoload :Configurable, 'batch_push_notification/configurable'
  autoload :Client,  'batch_push_notification/client'
  autoload :Notification,  'batch_push_notification/notification'

  class << self
    include BatchPushNotification::Configurable
  end
end
