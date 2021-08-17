require "byebug"

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  attr_accessor  :guess_word , :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted? (char)
    if @attempted_chars.include?(char)
      return true
    end

    false
  end

  def get_matching_indices (char)
    if !@secret_word.include? (char)
      return []
    end

    indices = []

    (0...@secret_word.length).each do |i|
      if @secret_word[i]==char
        indices<<i 
      end
    end

    indices
  end
  
  def fill_indices(char, arr)
    arr.each do |i|
      @guess_word [i] = char
    end
  end

  #---------------Part 2--------------
  def try_guess (char)
  
    indeces = self.get_matching_indices(char)
    self.fill_indices(char, indeces )

    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -=1
    end

    if self.already_attempted? (char)
      p 'that has already been attempted'
      return false
    end
    @attempted_chars << char
    return true

  end
    
  def ask_user_for_guess
    p 'Enter a char:'
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    #debugger
    if @guess_word.join('') ==  @secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    end

    false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end
    


end # end hangman class
