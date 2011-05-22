require 'rubygems'
require 'spork'

module I18n
  def just_taise_that_exception(*args)
    raise args.first
  end
end

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you' ll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'email_spec'
  
  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    # config.mock_with :rspec
    config.include(EmailSpec::Helpers)
    config.include(EmailSpec::Matchers)
    # config.include Devise::TestHelpers, :type => :controller # see support/devise.rb

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    ### Part of a Spork hack. See http://bit. ly/arY19y
    # Emulate initializer set_clear_dependencies_hook in
    # railties/lib/rails/application/bootstrap. rb
    ActiveSupport::Dependencies.clear
    
    # Raise exception for translation missing errors
    I18n.exception_handler = :just_raise_that_exception
  end
end

Spork.each_run do
end



