ENV['RACK_ENV'] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = RobotDirectory

module TestHelpers
  def teardown
    robot_directory.destroy_all
    super
  end

  def robot_directory
    database = YAML::Store.new('db/task_manager_test')
    @robot_directory ||= RobotDirectory.new(database)
  end

  def create_robots(num = 2)
    num.times do |current_num|
      robot_directory.create({
        :id         => "#{current_num + 1}",
        :name       => "Name #{current_num + 1}",
        :city       => "City #{current_num + 1}",
        :state      => "State #{current_num + 1}",
        :avatar     => "Avatar #{current_num + 1}",
        :birthdate  => "Birthdate #{current_num + 1}",
        :date_hired => "Date Hired #{current_num + 1}",
        :department => "Department #{current_num + 1}"
      })
    end
  end

  def updated_robot_input
    {:name       => "Updated Name",
     :city       => "Updated City",
     :state      => "Updated State",
     :avatar     => "Updated Avatar",
     :birthdate  => "Updated Birthdate",
     :date_hired => "Updated Date Hired",
     :department => "Updated Department"
    }
  end
end
