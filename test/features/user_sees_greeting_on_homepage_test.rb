require_relative '../test_helper'

class UserSeesGreetingOnHomepage < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_is_welcomed
    visit '/'

    within("h1") do
      assert page.has_content?("Dashboard")
    end
  end

end
