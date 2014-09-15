
class DockingStation

	def initialize
		@bike_list = [] 
		
	end

	def bike_count
		@bike_list.length
	end

	def dock(the_bike)
		@bike_list << the_bike
	end

	def release(the_bike)
		@bike_list.delete(the_bike)
	end
end
