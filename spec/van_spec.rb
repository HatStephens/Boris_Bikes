require 'van'

describe Van do
	
	let(:van) { Van.new }

	it 'should collect broken bikes from docking station' do
	station = DockingStation.new
	bike_broken = Bike.new.break!
	bike_working = Bike.new
	station.dock(bike_broken)
	station.dock(bike_working)
	expect{van.collect_broken_bikes(station)}.to change{van.bike_count}.by(1)
	end

	it 'should collect broken bikes from a london docking station' do
	station = double :station, release: nil
	bike = double :bike, is_a?: true
	allow(station).to receive(:broken_bikes).and_return([bike])

	van.collect_broken_bikes(station)
	expect(van.bike_count).to eq(1)	
	end
	
	it 'should release all bikes' do
	station = double :station
	allow(station).to receive(:dock)
	van.release_all_bikes(station)
	expect(van.bike_count).to eq(0)
	end

	it 'should collect available bikes from a garage' do
	garage = double :garage, release: nil
	bike = double :bike, is_a?: true
	allow(garage).to receive(:available_bikes).and_return([bike])
	van.collect_working_bikes(garage)
	expect(van.bike_count).to eq(1)
	end

	it 'should not let broken bikes be collected from garage' do
	slow_garage = Garage.new	
	expect{van.collect_broken_bikes(slow_garage)}.to raise_error(RuntimeError)
	end

	it 'should not let working bikes be collected from a docking station' do
	working_dock = DockingStation.new	
	expect{van.collect_working_bikes(working_dock)}.to raise_error(RuntimeError)
	end

end

