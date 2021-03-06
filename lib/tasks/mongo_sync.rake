namespace :mongo_sync do

    desc "Push DB to Remote from Local"
    task :push, [:config] => :environment do |t, args|
        if user_accepts("This will overwrite your remote database.")       
            MongoSync.push args[:config]
        end
    end

    desc "Pull DB to Local from Remote"
    task :pull, [:config] => :environment do |t, args|
        if user_accepts("This will overwrite your local database.")
            MongoSync.pull args[:config]
        end
    end

    # ---
    
    def user_accepts(message)
        print "#{message} Enter 'yes' to continue: "
        input = STDIN.gets.chomp.downcase

        if input == 'yes' or input == 'y'
            return true
        else
            puts "Wrong Input, aborting..."
            return false
        end
    end
end
