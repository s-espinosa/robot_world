require 'date'

class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department

  def initialize(args)
    @id         = args[:id]
    @name       = args[:name]
    @city       = args[:city]
    @state      = args[:state]
    @avatar     = args[:avatar]
    @birthdate  = Date.parse(args[:birthdate])
    @date_hired = Date.parse(args[:date_hired])
    @department = args[:department]
  end

  def age

  end
end
