require 'garage'

describe Garage do

	it 'should receive bikes from van' do
		van = double :van
		garage = Garage.new
		allow(van).to receive(:release).and_return([:bike])
		garage.dock(van.release(:bike))
		expect(garage.bike_count).to eq(1)
	end

	it 'should fix the broken bikes' do
		bike = double :bike
		garage = Garage.new
		allow(bike).to receive(:fix!).and_return(:bike)
		
		garage.dock(bike)
		garage.fix_broken_bikes(garage.bike_list)
		expect(garage.available_bikes).to eq(bike) 
	end
	
end