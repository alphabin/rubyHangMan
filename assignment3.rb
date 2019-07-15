class Hangman

  attr_reader :word, :count, :guessedTrue,:guessedFalse

  def initialize(word, count)
    @word = word
    @shadowWord =  Array.new(@word.length, "_")
    @count = count
    @win = false
    @guessedTrue = []
    @guessedFalse = []
  end 
  
  def gameOver?
     @win || @count == 0
  end
  
  
  def gameWon?
     @win
  end 
  
  # return 0 if letter is not in word
  # otherwise, return the number of times the letter 
  # appears in the word
  def guess(letter)
      #find the guess
      returnValue = @word.count(letter) 
      case returnValue
        when 0
          #Meaning this was an invalid guess
          @count-=1
          @guessedFalse << letter
        else
          @guessedTrue << letter
          arryOfMatchesIndexs = (0 ... @word.length).find_all { |i| @word[i,1] == letter }
          arryOfMatchesIndexs.each { |x| 
            @shadowWord[x] = letter 
          }
          
          if (@shadowWord.index("_")).nil? 
            @win = true
          end
          
          
      end
        returnValue
  end 
  
  # return one of the letters in the word 
  # that has not been guessed 
  def hint()
      hintIndex =  @shadowWord.index("_");
      @count-=1
      @word[hintIndex]
  end 
  
  # return a string 
  # if a letter has not been guessed, return _ (underscore)
  # the string should contain a space between letters and 
  # underscores for readability.
  # Example:  if the word is cookie, and o and e have been guessed
  #   return the string "_ o o _ _ e"
  def display()
      presentWord = ""
      @shadowWord.each { |x| 
        presentWord += x + " "
      }
      presentWord.rstrip
  end
 
end


