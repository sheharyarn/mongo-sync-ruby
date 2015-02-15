require 'yaml'

require 'mongo_sync/version'
require 'mongo_sync/config'

module MongoSync
    def self.pull(config = nil)
    	configs = MongoSync::Configuration.parse(config)
	end
    
    def self.push(config = nil)
    	configs = MongoSync::Configuration.parse(config)
	end
end
