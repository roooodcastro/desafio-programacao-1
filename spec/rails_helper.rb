# frozen_string_literal: true

require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

abort('Rails is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require 'paperclip/matchers'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include RSpecHtmlMatchers
  config.include UserSteps, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Paperclip::Shoulda::Matchers
  config.include ActionDispatch::TestProcess

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
