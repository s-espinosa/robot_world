require_relative '../test_helper'

class UserCanCreateANewRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_it_can_creat_a_robot_with_valid_attributes
    new_capybara_robot
    assert_equal '/robots', current_path

    within '.list-group-item:last-of-type' do
      assert page.has_content? 'Robot Name'
    end
  end


end
