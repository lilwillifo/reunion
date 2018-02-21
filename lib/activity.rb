class Activity
attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = []
  end

  def add_participant(data)
    @participants << data
  end

  def total_cost
    @participants.map do |participant|
      participant[:paid]
    end.sum
  end
end
