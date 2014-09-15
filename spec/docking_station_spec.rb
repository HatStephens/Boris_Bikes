require './lib/docking_station.rb'
require './lib/bike.rb'

describe DockingStation do
	let (:the_bike) {Bike.new}
	let (:the_station) {DockingStation.new}

	it 'should accept a bike' do
		#the_bike = Bike.new
		#the_second_bike = Bike.new
		#the_station = DockingStation.new
		expect(the_station.bike_count).to eq(0)
		the_station.dock(the_bike)
		expect(the_station.bike_count).to eq(1)
		#the_station.dock(the_second_bike)
		#expect(the_station.bike_count).to eq(2)
	end

	it 'should release a bike' do
		#the_bike = Bike.new
		#the_station = DockingStation.new
		the_station.dock(the_bike)
		the_station.release(the_bike)
		expect(the_station.bike_count).to eq(0)
	end
end