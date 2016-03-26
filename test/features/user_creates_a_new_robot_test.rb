require_relative '../test_helper'

class UserCanCreateANewRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_it_can_creat_a_robot_with_valid_attributes
    visit '/robots/new'

    fill_in 'robot[name]', with: 'Robot Name'
    fill_in 'robot[city]', with: 'Robot City'
    fill_in 'robot[state]', with: 'Robot State'
    fill_in 'robot[avatar]', with: 'Robot Avatar'
    fill_in 'robot[birthdate]', with: 'Robot Birthdate'
    fill_in 'robot[date_hired]', with: 'Robot Date Hired'
    fill_in 'robot[department]', with: 'Robot Department'
    click_button 'Submit'

    assert_equal '/robots', current_path

    within '.list-group-item:last-of-type' do
      assert page.has_content? 'Robot Name'
    end
  end


end
