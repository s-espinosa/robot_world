require 'faker'
require 'sequel'
require 'date'
require_relative 'app/models/robot_directory'

database = Sequel.sqlite('db/robot_directory_development.sqlite')
fake_directory = RobotDirectory.new(database)

100.times do
  robot = {:name       => Faker::Name.name,
           :city       => Faker::Address.city,
           :state      => Faker::Address.state,
           :avatar     => Faker::Avatar.image,
           :birthdate  => Faker::Date.between(Date.new(1980, 1, 1), Date.today),
           :date_hired => Faker::Date.between(Date.new(2002, 1, 1), Date.today),
           :department => Faker::Hacker.ingverb.capitalize

  }
  fake_directory.create(robot)
end
