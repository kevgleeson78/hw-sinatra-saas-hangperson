class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word, :guesses, :wrong_guesses, :win
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  #Take a char as input to method
  def guess(guessed)
     # Convert gussed to case insensitve
   
    #Check for invalid input 
    # of empty string using '' for comparison
    # Count the characters from the input of a-z and A-Z
    # The result is 0 if there are non alphabet characters in the input.
    # guessed.nil? to check for nill value.
    if   guessed == '' or  guessed.nil? or guessed.count("a-zA-Z") <= 0 
      #return error
      raise ArgumentError
    end
    
    guessed.downcase!
    # Check if the guessed char is in the word string
    #And the character is not already in the guesses list
    if @word.include? guessed and !@guesses.include? guessed 
     
      # Add the guessed char to the guesses list 
      @guesses += guessed
      return true
      #check if the the letter already exists in the guessed ar guessed string
      elsif @guesses.include? guessed or @wrong_guesses.include? guessed
        return false
      # condition to check if the char is not in the wrong_guesses list
      elsif !@wrong_guesses.include? guessed
       
        #If guessed char is not in string add to @wrong_guesses list
        @wrong_guesses += guessed
        return true
    
    end
  
  end
  
  ## Word with guesses method
  # Regex used to capture the guesses string and place the guessed letters 
  # into the new string from teh secret word using gsub. The '-' symblo
  # is then placed where the characters have not been guessed.
  def word_with_guesses()
	   @word.gsub(/[^ #{@guesses}]/, '-')
  end
  
  # Method to check if the game is over with winning or
  # loosing conditions
  def check_win_or_lose()
    #  Get the result from the word_with_guesses method to campare with the
    # secret word.
    # Returns the win symbol if true.
    if word_with_guesses() == @word
      
     return  :win
    end
  end
  
  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.new('watchout4snakes.com').start { |http|
      return http.post(uri, "").body
    }
  end

end
