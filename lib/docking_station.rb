require_relative 'bike'

class DockingStation

  attr_reader :bike

  def release_bike #nb methods can release other objects...like a new instance of bike
    fail 'No bikes available' unless @bike #guard condition
    @bike
  end

  def dock(bike)
    @bike = bike
  end

end
