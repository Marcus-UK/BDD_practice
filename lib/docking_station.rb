require_relative 'bike'

class DockingStation
    attr_reader :bikes, :capacity

    def initialize()
        @bikes = []
    end


    def release_bike
        fail 'no bikes available' if dock_empty?
        @bikes.pop
    end

    def dock(bike)
        fail 'Docking station is full' if dock_full?
        @bikes << bike
    end

    private

    def dock_full?
        @bikes.count >= 20
    end
    
    def dock_empty?
        @bikes.empty?
    end    

end
