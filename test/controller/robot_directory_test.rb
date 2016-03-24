require_relative '../test_helper'

class RobotDirectoryTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    create_robots(1)

    robot = robot_directory.find(1)
    assert_equal "Name 1", robot.name
    assert_equal "City 1", robot.city
  end

  def test_it_returns_all_robots
    create_robots(3)
    robots = robot_directory.all

    assert_equal 3, robots.count
    assert_kind_of Robot, robots[0]
    assert_equal 1, robots[0].id.first
    assert_equal "Name 1", robots[0].name
    assert_equal "City 3", robots[2].city
  end

  def test_it_finds_a_task_by_number
    create_robots(4)
    robot = robot_directory.find(2)

    assert_equal 2, robot.id.first
    assert_equal "Name 2", robot.name
    assert_equal "Department 2", robot.department
  end

  def test_it_can_update_a_task
    create_robots(5)
    robot_directory.update(3, updated_robot_input)
    robot = robot_directory.find(3)

    assert_equal 3, robot.id.first
    assert_equal "Updated Name", robot.name
    assert_equal "Updated Date Hired", robot.date_hired
  end

  def test_it_can_destroy_a_task
    create_robots(6)
    robot_directory.destroy(4)
    robots = robot_directory.all

    assert_equal 5, robots.length
    assert_equal 5, robots[3].id.first
    assert_equal "Name 6", robots[4].name
    assert_equal "Name 3", robots[2].name
  end
end
