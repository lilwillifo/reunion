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
    @activities.map(&:total_cost).sum
  end

  def split_cost
    number_of_participants = @activities[0].participants.length
    total_cost / number_of_participants
  end

  def amount_owed(name)
    @activities.map do |activity|
      activity.amount_owed(name)
    end.sum
  end

  def print_summary
    names = @activities[0].participants.keys
    names.map do |name|
      if amount_owed(name) > 0
      "#{name}, you owe $#{'%.2f' % amount_owed(name)}."
      elsif amount_owed(name) < 0
        "#{name}, you are owed $#{'%.2f' % (amount_owed(name) * -1)}."
      else
        "#{name}, you are all set! Way to be."
      end
    end.join(' ')
  end
end
