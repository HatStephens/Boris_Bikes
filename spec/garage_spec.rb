require 'garage'

describe Garage do

	it 'should receive bikes from van' do
		van = double :van
		garage = Garage.new
		bike = double :bike, is_a?: true
		allow(van).to receive(:release).and_return(bike)
		garage.dock(van.release(bike))
		expect(garage.bike_count).to eq(1)
	end

	it 'should fix the broken english bikes' do
		bike = double :bike, is_a?: true
		garage = Garage.new
		garage.dock(bike)

		expect(bike).to receive(:fix!)
		garage.fix_broken_bikes
	end

	it 'should fix the broken american bikes' do
		bike = Bike.new
		garage = Garage.new
		bike.break!
		garage.dock(bike)
		expect{garage.fix_broken_bikes}.to change{garage.available_bikes}.to([bike])
	end
	
end