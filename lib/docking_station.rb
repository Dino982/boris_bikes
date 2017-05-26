require_relative 'bike'

class DockingStation

  attr_reader :bike
  DEFAULT_CAPACITY = 20

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
    @bikes.count >= DEFAULT_CAPACITY
  end

end
