ENV['RACK_ENV'] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'
require 'date'

Capybara.app = RobotWorldApp

module TestHelpers
  def teardown
    robot_directory.destroy_all
    super
  end

  def robot_directory
    database = Sequel.sqlite('db/robot_directory_test.sqlite')
    @robot_directory ||= RobotDirectory.new(database)
  end

  def create_robots(num = 2)
    today = Date.today
    num.times do |current_num|
      robot_directory.create({
        :name       => "Name #{current_num + 1}",
        :city       => "City #{current_num + 1}",
        :state      => "State #{current_num + 1}",
        :avatar     => "Avatar #{current_num + 1}",
        :birthdate  => "#{today.year - current_num * 2}/#{today.mon}/#{today.mday}",
        :date_hired => "#{today.year - current_num}/#{today.mon}/#{today.mday}",
        :department => "Department #{current_num + 1}"
      })
    end
  end

  def updated_robot_input
    {:name       => "Updated Name",
     :city       => "Updated City",
     :state      => "Updated State",
     :avatar     => "Updated Avatar",
     :birthdate  => "80/1/10",
     :date_hired => "02/1/10",
     :department => "Updated Department"
    }
  end

  def new_capybara_robot
    visit '/robots/new'

    fill_in 'robot[name]', with: 'Robot Name'
    fill_in 'robot[city]', with: 'Robot City'
    fill_in 'robot[state]', with: 'Robot State'
    fill_in 'robot[avatar]', with: 'Robot Avatar'
    fill_in 'robot[birthdate]', with: '82/6/6'
    fill_in 'robot[date_hired]', with: '04/6/6'
    fill_in 'robot[department]', with: 'Robot Department'
    click_button 'Submit'
  end
end
