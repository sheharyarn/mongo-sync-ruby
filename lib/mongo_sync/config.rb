module MongoSync
	module Configuration
		@config = {}

		def self.parse(config_file)
			config_file ||= Rails.root if defined? Rails

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

		class FileNotFound < StandardError
		end
	end
end
