require_relative '../test_helper'

class UserCanEditAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_task_is_updated_with_new_information
    new_capybara_robot
    assert_equal '/robots', current_path

    click_link('Edit')

    fill_in 'robot[name]', with: 'New Name'
    fill_in 'robot[city]', with: 'New City'
    fill_in 'robot[state]', with: 'New State'
    fill_in 'robot[avatar]', with: 'New Avatar'
    fill_in 'robot[birthdate]', with: 'New Birthdate'
    fill_in 'robot[date_hired]', with: 'New Date Hired'
    fill_in 'robot[department]', with: 'New Department'
    click_button 'submit'

    within 'h1' do
      assert page.has_content? 'New Name'
    end

    assert_equal "New Avatar", page.find('img')['src']
  end
end
