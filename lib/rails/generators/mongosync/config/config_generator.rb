module MongoSync
    module Generators
        class ConfigGenerator < Rails::Generators::Base
            desc 'Creates a MongoSync Gem configuration file at config/mongosync.yml'

            source_root File.expand_path("../templates", __FILE__)

            def create_config_file
                template 'mongosync.yml', File.join('config', 'mongosync.yml')
            end
        end
    end
end