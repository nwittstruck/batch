module Batch
  autoload :Configurable, 'batch/configurable'
  autoload :Client,  'batch/client'
  autoload :Notification,  'batch/notification'

  class << self
    include Batch::Configurable
  end
end
