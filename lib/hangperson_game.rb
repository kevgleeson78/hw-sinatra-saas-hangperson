class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word, :guesses, :wrong_guesses
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  #Take a char as input to method
  def guess(guessed)
    
    
    # Check if the guessed char is in the word string
    #And the character is not already in the guesses list
    if @word.include? guessed and !@guesses.include? guessed 
     
      # Add the guessed char to the guesses list 
      @guesses += guessed
      return true
      #check if the the letter already exists in the guessed ar guessed string
      elsif @guesses.include? guessed or @wrong_guesses.include? guessed
        return false
        
      elsif !@wrong_guesses.include? guessed
       
        #If guessed char is not in string add to @wrong_guesses list
        @wrong_guesses += guessed
        return true
    
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
