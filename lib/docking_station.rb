
class DockingStation
	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		 @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		 @bike_list = []
		 @broken_list = []
	end

	def bike_count
		@bike_list.length
	end

	def dock(the_bike)
		raise "Station is full." if full?
		the_bike.broken? ? @broken_list << the_bike : @bike_list << the_bike
		
	end

	def release(the_bike)
		@bike_list.delete(the_bike)
	end

	def full?
		bike_count + @broken_list.count == @capacity
	end


end
