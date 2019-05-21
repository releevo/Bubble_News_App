require 'pg'
require 'active_record'

options = {
    adapter: 'postgresql',
    database: 'bubble_news_app'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)