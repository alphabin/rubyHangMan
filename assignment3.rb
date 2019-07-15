class Hangman

  attr_reader :word, :count

  def initialize(word, count)
    @word = word
    @count = count
    @win = false

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
 
  end 
  
  # return one of the letters in the word 
  # that has not been guessed 
  def hint()
  
  end 
  
  # return a string 
  # if a letter has not been guessed, return _ (underscore)
  # the string should contain a space between letters and 
  # underscores for readability.
  # Example:  if the word is cookie, and o and e have been guessed
  #   return the string "_ o o _ _ e"
  def display()
  
  end
 
end


