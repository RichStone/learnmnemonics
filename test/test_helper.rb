ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def visit_basic_auth(url)
    uri = URI.parse(url)
    # Getting from credentials/test.yml.enc.
    uri.user = "test_username"
    uri.password = "test_password"
    visit uri
  end

  def basic_auth_header_value
    ActionController::HttpAuthentication::Basic
      .encode_credentials("test_username", "test_password")
  end
end
