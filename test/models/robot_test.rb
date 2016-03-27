require_relative '../test_helper'
require 'date'

class RobotTest < Minitest::Test
  include TestHelpers

  def test_assigns_attributes_correctly
    today = Date.today
    create_robots(1)

    robot = robot_directory.all.last

    assert_equal "Name 1", robot.name
    assert_equal "City 1", robot.city
    assert_equal "State 1", robot.state
    assert_equal "Avatar 1", robot.avatar
    assert_equal Date.today, robot.birthdate
    assert_equal Date.today, robot.date_hired
    assert_equal "Department 1", robot.department
  end
end
