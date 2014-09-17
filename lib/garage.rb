require_relative 'bike_container'
require_relative 'bike'

class Garage
	include BikeContainer

	def initialize(options = {})
		 self.capacity = options.fetch(:capacity, capacity)
	end

	def fix_broken_bikes
		bike_list.each { |bike| bike.fix! }
	end

end