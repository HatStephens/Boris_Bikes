require 'van'

describe Van do

	it 'should collect broken bikes from docking station' do
	station = DockingStation.new
	van = Van.new
	bike_broken = Bike.new.break!
	bike_working = Bike.new
	station.dock(bike_broken)
	station.dock(bike_working)

	expect{van.collect_broken_bikes(station)}.to change{van.bike_count}.by(1)

	
	end
	
end