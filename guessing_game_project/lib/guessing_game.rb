class GuessingGame 
 attr_reader :min , :max
 #attr_accessor :secret_num, :num_attempts, :game_over 

 def initialize (min, max)
  @num_attempts = 0
  @game_over = false
  @min = min
  @max = max
  @secret_num = rand(@min..@max)
 end

 def num_attempts 
  @num_attempts
 end

 def game_over?
  @game_over
 end

 def check_num (num)
  @num_attempts +=1
  if num == @secret_num
    @game_over = true
    p 'you win'
  elsif num > @secret_num
    p 'too big'
  else
    p 'too small'
  end

end #end game_over?

def ask_user
  p 'enter a number'
  num = gets.chomp.to_i
  self.check_num(num)
end


  


end # end of class
