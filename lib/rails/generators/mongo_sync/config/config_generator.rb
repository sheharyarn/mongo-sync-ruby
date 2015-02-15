module MongoSync
    module Generators
        class ConfigGenerator < Rails::Generators::Base
            desc 'Creates a MongoSync Gem configuration file at config/mongo_sync.yml'

            source_root File.expand_path("../templates", __FILE__)

            def create_config_file
                template 'mongo_sync.yml', File.join('config', 'mongo_sync.yml')
            end
        end
    end
end