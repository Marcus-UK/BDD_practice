require './lib/docking_station.rb'

describe DockingStation do
    let(:bike) { double(:bike, report_broken: true, broken?: true) }

    it { is_expected.to respond_to :bikes }

    it 'has a default capacity if the user does not provide their own' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'allows users to set their own capacity' do
        custom_capacity = 20
        docking_station = DockingStation.new(capacity: custom_capacity)
        expect(subject.capacity).to eq custom_capacity
    end
     
    describe '#release_bike' do
        it 'releases working bikes' do
            bike = double(:bike, broken?: false)
            subject.dock(bike)
            expect(subject.release_bike).to eq bike
        end

        it 'will not release a bike if none are available' do
            expect { subject.release_bike }.to raise_error 'no bikes available'
        end

        it 'will not release a bike if it is broken' do
            bike.report_broken
            subject.dock(bike)
            expect { subject.release_bike }.to raise_error 'Cannot release broken bike'
        end
    end

    describe '#dock' do
        it 'can dock returned bikes' do
            subject.dock(bike)
            expect(subject.bikes).to eq [bike]
        end

        it 'can accept broken bikes as well as working bikes' do
            subject.dock(bike)
            expect(subject.bikes.count).to eq 1
        end

        it 'raises an error if the docking station is full' do
            DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
            expect { subject.dock(bike) }.to raise_error 'Docking station is full'
        end    
    end
end
	
