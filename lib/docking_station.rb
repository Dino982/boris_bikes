require_relative 'bike'

class DockingStation

  attr_reader :bike

  def initialize
    @bikes = []
  end

  def release_bike #nb methods can release other objects...like a new instance of bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end


  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= 20
  end

end
