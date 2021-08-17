require_relative "room"
require "byebug"

class Hotel

  attr_accessor :rooms
  
  def initialize (name, hsh)

    @name = name
    @rooms = {}
    hsh.each do |k, v| 
      @rooms[k] = Room.new(v)
    end
  end

  def name
    words=@name.split(" ")
    words.map {|word| word[0]=word[0].upcase}
    
    words.join(" ")
  end

  def room_exists? (str)
    @rooms.include?(str)
  end

  def check_in (str, roomName)
    if !room_exists? (roomName)
      puts 'sorry, room does not exist'
    else 
      if @rooms[roomName].add_occupant(roomName)
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    end
  end

  def has_vacancy?
    if @rooms.any? {|k, v| !v.full?}
      return true
    end

    if @rooms.none? {|k, v| v.full?}
      return false
    end
    false

  end

  def list_rooms
    @rooms.keys.each do |rName|
      puts rName + @rooms[rName].available_space.to_s
    end
  end


end # end Hotel Class
