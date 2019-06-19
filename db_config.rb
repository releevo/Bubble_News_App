require 'pg'
require 'active_record'

options = {
    adapter: 'postgresql',
    database: 'bubbles'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)

# config.action_mailer.default_url_options = { host: 'example.com' }