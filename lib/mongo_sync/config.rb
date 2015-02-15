require 'yaml'

module MongoSync
	module Configuration
		def self.parse(config_file)
			config_file ||= File.join(Rails.root, 'config', 'mongo_sync.yml') if defined? Rails

			if config_file
				begin
					return YAML::load(IO.read(config_file))
				rescue Errno::ENOENT
					raise FileNotFound
				end
			else
				raise FileNotFound
			end
		end

		class FileNotFound < StandardError; end
	end
end
