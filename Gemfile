source 'https://rubygems.org'

gem 'rails', '4.0.4'

gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'devise'
gem 'font-awesome-sass'
gem 'paperclip', github: 'thoughtbot/paperclip'
gem 'aws-sdk', '~> 1.20.0'
gem 'easypost'
gem 'cancan'
gem 'newrelic_rpm'
gem 'country_select'
gem 'analytics-ruby', '~>1.0'

group :development, :test do
     gem 'sqlite3'
     # I'd always run at least your test env on the same type of database
     # as production
     gem 'better_errors'
     gem 'binding_of_caller'
end

group :production do
     gem 'pg'
     gem 'rails_12factor'
end


group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
