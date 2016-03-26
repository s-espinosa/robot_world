require_relative '../test_helper'

class UserCanDeleteAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_task_is_deleted_successfully
    create_robots(1)

    visit '/robots'
    assert page.has_content? 'Name '

    click_button 'delete'

    refute page.has_content? 'Name 1'
  end
end
