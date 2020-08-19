require './lib/docking_station.rb'

describe DockingStation do
    it { is_expected.to respond_to :bikes }
     
    describe '#release_bike' do
        it 'releases working bikes' do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end

        it 'will not release a bike if none are available' do
            expect { subject.release_bike }.to raise_error 'no bikes available'
        end
    end

    describe '#dock' do
        it 'can dock returned bikes' do
            bike = Bike.new
            subject.dock(bike)
            expect(subject.bikes).to eq [bike]
        end

        it 'raises an error if the docking station is full' do
            DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
            expect { subject.dock(Bike.new) }.to raise_error 'Docking station is full'
        end    
    end
end
	
