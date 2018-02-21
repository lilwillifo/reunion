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

  def total_cost
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end
end
