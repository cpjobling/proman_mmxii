source 'http://rubygems.org'

gem 'rails', '>= 3.0.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'haml', '>= 3.0.25'
gem 'sass'
gem 'rails3-generators'
gem 'devise', '>=1.3.3' # Devise must be required before RailsAdmin
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'
gem 'rspec-rails', '>= 2.5.0', :group => [:development, :test]
gem 'jquery-rails', '>= 0.2.7'
#gem 'tabs_on_rails'
gem "compass", ">= 0.11.0"
gem 'html5-boilerplate'
gem 'routing-filter'
gem 'syntax'
gem 'redis'
gem 'formtastic'
gem 'hpricot'
gem 'ruby_parser'


group :development do
  gem 'nifty-generators'
  gem 'annotate-models'
end

group :test do
  gem 'factory_girl_rails', ">= 1.1.beta1"
  gem 'cucumber-rails', ">= 0.4.1"
  gem 'capybara', ">= 0.4.1.2"
  gem 'database_cleaner', '>= 0.6.7'
  gem 'spork', '0.9.0.rc4'
  gem 'mocha'
  gem 'launchy'
  gem 'email_spec'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-spork'
  gem 'guard-livereload'
  gem 'growl'
end

group :development, :test do
  gem 'app-themer'
end
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
gem "mocha", :group => :test
