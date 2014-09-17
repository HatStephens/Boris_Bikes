require_relative 'bike_container'

class Van
	include BikeContainer

	def initialize(options = {})
		 self.capacity = options.fetch(:capacity, capacity)
	end

	def collect_broken_bikes(station)
		raise "You can't remove bikes from Garage until they're fixed" if station.is_a? Garage
		station.broken_bikes.each do |bike|
		dock(bike)	
		station.release(bike)
		end
	end

	def collect_working_bikes(station)
		raise "You can't remove working bikes from Docking Station" if station.is_a? DockingStation
		station.available_bikes.each do |bike|
			dock(bike)
			station.release(bike)
		end
	end

	def release_all_bikes(station)
		bike_list.each do |bike|
			station.dock(bike)
			release(bike)
		end
	end
end

