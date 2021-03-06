require 'pry'
class Activity
  attr_reader :name, :participants, :total_cost
  def initialize(name, total_cost)
    @name = name
    @total_cost = total_cost
    @participants = {}
  end

  def add_participant(data)
    @participants[data[:name]] = data[:paid]
  end

  def split_cost
    @total_cost / @participants.length.to_f
  end

  def amount_owed(name)
    split_cost - @participants[name]
  end
end
