MongoSync
=========

> Sync Remote and Local MongoDB Databases in Ruby! Works with MongoHQ/Compose, MongoLab and other Heroku-hosted MongoDBs too!

Based on my [mongo-sync](https://github.com/sheharyarn/mongo-sync) shell script.


## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
    gem 'mongo_sync'
end
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install mongo_sync
```


## Usage

### Rails

In Rails, run this generator to set up a `mongo_sync.yml` configuration template:

```bash
rails g mongo_sync:config
```

Now edit the newly created `config/mongo_sync.yml`, putting in details of your remote and local DBs:

```yaml
local:
  db: 'local_db_name'

remote:
  db: 'remote_db_name'
  host:
    url: 'some.remoteurl.com'
    port: 27017
  access:
    username: 'remote_mongo_user'
    password: 'remote_mongo_pass'

# For Heroku MongoDB URLs, here's the legend:
# mongodb://username:password@hosturl.com:port/db_name

# All fields are required
```

Now, to start syncing, use these rake tasks:

```sh
rake mongo_sync:push       # Push DB to Remote
rake mongo_sync:pull       # Pull DB to Local
```

### Non-Rails

1. Create a `mongo_sync.yml` in your project.
2. In your project, add this:

    ```ruby
    require 'rake'
    require 'mongo_sync'
    load 'tasks/mongo_sync.rake'
    ```

3. Pass the path of your config file in the tasks:

    ```sh
    rake mongo_sync:push['path/to/mongo_sync.yml']
    ```

### Console / Command-line

```ruby
require 'mongo_sync'

# Looks for config/mongo_sync.yml - Rails only
MongoSync.pull

# You can pass path of your config file as well
MongoSync.push "path/to/mongo_sync.yml"
```


## Notes 

 - Pushing/Pulling overwrites the Target DB
 - It's a good idea to keep your `mongo_sync.yml` in `.gitignore` or load the values from the `ENV`


## TODO

 - Add more options and ways to enter DB details in `mongo_sync.yml`
 - Add a backup command/task
 - Write Tests
 - Add a `no-overwrite` feature, so that it doesn't drop the target DB before restoring it, and _actually_ tries to sync it


## Contributing

1. [Fork it](https://github.com/sheharyarn/mongo-sync-ruby/fork)
2. Create your feature/fix branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Create a new Pull Request


## License

Copyright (c) 2015 Sheharyar Naseer

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


