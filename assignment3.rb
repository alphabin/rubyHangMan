class Hangman

  attr_reader :word, :count, :guessedTrue,:guessedFalse

  def initialize(word, count)
    @word = word
    #this is used for presentation, so the original word is not modified
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
          #maybe for debugging purposes
          @guessedFalse << letter
        else
          #maybe for debugging purposes
          @guessedTrue << letter
          #get all index of a matching letter
          arryOfMatchesIndexs = (0 ... @word.length).find_all { |i| @word[i,1] == letter }
          #iterate through the matches and replace the shadow word
          arryOfMatchesIndexs.each { |x| 
            @shadowWord[x] = letter 
          }
          
          #if the shadowWord array does not have any underscroes then we win 
          if (@shadowWord.index("_")).nil? 
            @win = true
          end
      end
        #return the value of found
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
      #final presenter as a string spaced out
      presentWord = ""
      #iterate the shadow word
      @shadowWord.each { |x| 
        #add a space in the letters
        presentWord += x + " "
      }
      #remove the trailing spaces as spec
      presentWord.rstrip
  end
 
end


