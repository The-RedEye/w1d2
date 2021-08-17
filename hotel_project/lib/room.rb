class Room

attr_accessor :capacity , :occupants

  def initialize(num)
    @capacity = num
    @occupants = []
  end

  def full?
    if @occupants.length < @capacity
      return false
    end
    true
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant (str)
    if self.full?
      return false
    end

    @occupants << str
    true
  end

end # end Room Class


