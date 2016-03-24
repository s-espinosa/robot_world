require_relative '../test_helper'

class RobotTest < Minitest::Test
  include TestHelpers

  def test_assigns_attributes_correctly
    create_robots(1)
    robot = robot_directory.find(1)

    assert_equal "Name 1", robot.name
    assert_equal "City 1", robot.city
    assert_equal "State 1", robot.state
    assert_equal "Avatar 1", robot.avatar
    assert_equal "Birthdate 1", robot.birthdate
    assert_equal "Date Hired 1", robot.date_hired
    assert_equal "Department 1", robot.department
  end
end
