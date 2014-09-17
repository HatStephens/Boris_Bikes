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

	def dock(the_bike = nil)
		raise "Container is full." if full?
		raise "No item to dock." if the_bike.nil?
		raise "This is not a bike." if !the_bike.is_a? Bike
		bike_list << the_bike	
	end

	def release(the_bike = nil)
		raise "Container is empty." if bike_list.empty?
		raise "You have not requested to release anything." if the_bike.nil?
		raise "You have requested to release a non-bike." if !the_bike.is_a? Bike
		bike_list.delete(the_bike)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bike_list.reject {|bike| bike.broken?}
	end

	def broken_bikes
		bike_list.select {|bike| bike.broken?}
	end

end