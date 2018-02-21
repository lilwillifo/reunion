require './lib/activity'

class Reunion
  attr_reader :location, :activities
  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(name, price)
    @activities << Activity.new(name, price)
  end
end
