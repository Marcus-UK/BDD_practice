require './lib/docking_station.rb'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
        bike = subject.release_bike
        expect(bike).to be_working
    end

    it 'can dock returned bikes' do
        bike = subject.release_bike
        subject.dock(bike)
        expect(subject.docked_bikes).to eq [bike]
    end
end
	
