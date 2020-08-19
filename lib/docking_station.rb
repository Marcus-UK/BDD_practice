require_relative 'bike'

class DockingStation
    attr_reader :bikes, :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity = DEFAULT_CAPACITY)
        @bikes = []
        @capacity = capacity
    end


    def release_bike
        fail 'no bikes available' if dock_empty?
        released_bike = @bikes.pop
        fail 'Cannot release broken bike' if bike_is_broken?(released_bike)
        released_bike
    end

    def dock(bike)
        fail 'Docking station is full' if dock_full?
        @bikes << bike
    end

    private

    def dock_full?
        @bikes.count >= DEFAULT_CAPACITY
    end
    
    def dock_empty?
        @bikes.empty?
    end

    def bike_is_broken?(bike)
        bike.broken?
    end

end
