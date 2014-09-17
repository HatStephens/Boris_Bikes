require './lib/bike_container'
require './lib/van'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it 'should list the bikes' do
		expect{holder.dock(bike)}.to change{holder.bike_list}.from([]).to([bike])
	end

	it 'should set a default capacity of 10 when no argument passed' do
		expect(holder.capacity).to eq(10)
	end

	it 'should accept a default capacity' do
		expect(holder.capacity=(40)).to eq(40)
	end

	it 'should be able to count the number of bikes' do
		expect(holder.bike_count).to eq(0)
	end

	it 'should accept a bike' do
		expect{holder.dock(bike)}.to change{holder.bike_count}.by(1)
	end

	it 'should release a bike' do
		holder.dock(bike)
		expect{holder.release(bike)}.to change{holder.bike_count}.by(-1)
	end

	it 'should know when it is full' do
		10.times{holder.dock(bike)}
		expect{holder.dock(bike)}.to raise_error(RuntimeError)
	end

	it 'should return a list of available bikes' do
		available_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(available_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([available_bike])
	end	

	it 'should know when it is empty' do
		expect{holder.release(bike)}.to raise_error(RuntimeError, "Container is empty.")		
	end

	it 'should not allow you to dock nothing' do
		expect{holder.dock()}.to raise_error(RuntimeError, "No item to dock.")
	end

	it 'should not allow you to dock a non-bike' do
		van = Van.new
		expect{holder.dock(van)}.to raise_error(RuntimeError, "This is not a bike.")
	end

	it 'should not allow you to release nothing' do
		holder.dock(bike)  
		expect{holder.release()}.to raise_error(RuntimeError, "You have not requested to release anything.")
	end

	it 'should not allow you to release a non-bike' do
		holder.dock(bike)
		van = Van.new
		expect{holder.release(van)}.to raise_error(RuntimeError, "You have requested to release a non-bike.")
	end
end





