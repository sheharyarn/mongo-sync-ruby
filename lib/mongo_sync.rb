require 'mongo_sync/version'
require 'mongo_sync/config'
require 'mongo_sync/rails/railtie' if defined? Rails

module MongoSync
    def self.pull(config = nil)
        configs  = MongoSync::Configuration.parse(config)
        tmpdir   = new_tmp_dir

        puts        "Dumping Remote DB to #{tmpdir}..." 
        system_run  "mongodump \
                        -h #{configs['remote']['host']['url']}:#{configs['remote']['host']['port']} \
                        -d #{configs['remote']['db']} \
                        -u #{configs['remote']['access']['username']} \
                        -p #{configs['remote']['access']['password']} \
                        -o #{tmpdir} > /dev/null"

        puts        "Overwriting Local DB..."
        system_run  "mongorestore \
                        -d #{configs['local']['db']} \
                        #{tmpdir}/#{configs['remote']['db']} \
                        --drop > /dev/null"

        clean_up(tmpdir)
        done_msg
    end
    
    def self.push(config = nil)
        configs = MongoSync::Configuration.parse(config)
        tmpdir  = new_tmp_dir

        puts        "Dumping Local DB to #{tmpdir}..."
        system_run  "mongodump \
                        -d #{configs['local']['db']} \
                        -o #{tmpdir} > /dev/null"

        puts        "Overwriting Remote DB with Dump..."
        system_run  "mongorestore \
                        -h #{configs['remote']['host']['url']}:#{configs['remote']['host']['port']} \
                        -d #{configs['remote']['db']} \
                        -u #{configs['remote']['access']['username']} \
                        -p #{configs['remote']['access']['password']} \
                        #{tmpdir}/#{configs['remote']['db']} \
                        --drop > /dev/null"

        clean_up(tmpdir)
        done_msg
    end

    
    private
    
    def self.new_tmp_dir
        "/tmp/mongo_sync/#{Time.now.to_i}"
    end

    def self.success_msg
        puts 'Success!', ''
    end

    def self.done_msg
        puts 'Done!', ''
    end

    def self.clean_up(dir)
        puts        "Cleaning Up..."
        system_run  "rm -rf #{dir}"
    end

    def self.system_run(command)
        raise SystemCommandFailure.new("\n'#{command.strip.gsub(/\s+/, ' ')}' \n") if not system(command)
        success_msg
    end

    class SystemCommandFailure < StandardError; end
end
