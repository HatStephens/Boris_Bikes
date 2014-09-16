module BikeContainer

	DEFAULT_CAPACITY = 10
	# attr_writer :capacity

	def bike_list
		@bike_list ||= []
	end

	def capacity
		@capacity  ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bike_list.count
	end

	def dock(the_bike)
		raise "Station is full." if full?
		bike_list << the_bike
		return bike_list	
	end

	def release(the_bike)
		bike_list.delete(the_bike)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bike_list.reject {|bike| bike.broken?}
	end
end