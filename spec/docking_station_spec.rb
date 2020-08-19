require './lib/docking_station.rb'

describe DockingStation do
    it { is_expected.to respond_to :bike }
    
    describe '#release_bike' do
        it 'releases working bikes' do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end
    end

    it 'can dock returned bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bike).to eq bike
    end

    it 'will not release a bike if none are available'do
        expect {subject.release_bike}.to raise_error 'no bikes available'
    end
end
	
