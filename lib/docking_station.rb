require_relative 'bike'

class DockingStation
    attr_reader :bikes, :capacity

    def initialize()
        @bikes = []
    end


    def release_bike
        fail 'no bikes available' if @bikes.empty?
        @bikes.pop
    end

    def dock(bike)
        fail 'Docking station is full' if @bikes.count >= 20
        @bikes << bike
    end

end
