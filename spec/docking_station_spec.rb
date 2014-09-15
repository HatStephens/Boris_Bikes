require './lib/docking_station.rb'
require './lib/bike.rb'

describe DockingStation do
	let (:the_bike) {Bike.new}
	let (:the_station) {DockingStation.new(:capacity => 20)}

	def fill_station(station)
		20.times { station.dock(the_bike)}
	end


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

	it 'should know when it is full' do
		expect(the_station).to_not be_full
		fill_station(the_station)
		expect(the_station).to be_full
	end

	it "should not accept if it's full" do
		fill_station(the_station)
		expect( lambda { the_station.dock(the_bike) } ).to raise_error(RuntimeError)
	end

	it 'should provide the list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		the_station.dock(broken_bike)
		the_station.dock(working_bike)
		expect(the_station.bike_count).to eq(1) 
	end

end