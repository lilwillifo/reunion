class Activity
attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = []
  end

  def add_participant(data)
    @participants << data
  end

end
