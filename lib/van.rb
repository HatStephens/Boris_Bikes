require_relative 'bike_container'

class Van
	include BikeContainer

	def initialize(options = {})
		 self.capacity = options.fetch(:capacity, capacity)
	end

	def collect_broken_bikes(station)
		station.broken_bikes.each do |bike|
		dock(bike)	
		station.release(bike)
	end

	end
end