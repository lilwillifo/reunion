require 'pry'
class Activity
attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(data)
    @participants[data[:name]] = data[:paid]
  end

  def total_cost
    @participants.values.inject(:+)
  end

  def split_cost
    total_cost / @participants.length.to_f
  end
end
