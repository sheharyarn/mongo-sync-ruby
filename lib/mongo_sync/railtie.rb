require 'mongo_sync'
require 'rails'

module MongoSync
  class Railtie < Rails::Railtie
    railtie_name :mongo_sync

    rake_tasks do
      load "tasks/mongo_sync.rake"
    end
  end
end