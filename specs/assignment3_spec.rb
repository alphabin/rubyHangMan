require_relative '../assignment3.rb'


RSpec.describe Hangman do 

  it 'check for required methods' do
    g = Hangman.new('cookie', 3)
    expect(g).to respond_to(:gameOver?)
    expect(g).to respond_to(:gameWon?)
    expect(g).to respond_to(:guess)
    expect(g).to respond_to(:hint)
    expect(g).to respond_to(:display)
  end 
  
   it 'new game' do
    g = Hangman.new('cookie', 3)
    expect(g.gameOver?).to be false
    expect(g.gameWon?).to be false
    expect(g.word).to eq 'cookie'
    expect(g.count).to eq 3
    
    g = Hangman.new('tomcat', 5)
    expect(g.gameOver?).to be false
    expect(g.gameWon?).to be false
    expect(g.word).to eq 'tomcat'
    expect(g.count).to eq 5
    expect(g.display).to eq '_ _ _ _ _ _'
  end 
  
  it 'check game capital letters' do
    g = Hangman.new('Picture', 6)
    expect(g.gameOver?).to be false
    expect(g.gameWon?).to be false
    expect(g.word).to eq 'picture'
    g.guess('p')
    g.guess('i')
    g.guess('C')
    expect(g.display).to eq 'p i c _ _ _ _'
    g.guess('T')
    g.guess('u')
    g.guess('r')
    g.guess('e')
    expect(g.display).to eq 'p i c t u r e'
    expect(g.gameOver?).to be true
  end 
  
  it 'check game hints' do
    g = Hangman.new('HellO', 3)
    expect(g.gameOver?).to be false
    expect(g.gameWon?).to be false
    expect(g.word).to eq 'hello'
    g.guess('H')
    g.guess('L')
    expect(g.display).to eq 'h _ l l _'
    g.hint
    expect(g.count).to eq 2
    g.hint
    expect(g.count).to eq 1
    g.hint
    g.guess('L')
    expect(g.count).to eq 1
    g.guess('e')
    g.guess('o')
    expect(g.display).to eq 'h e l l o'
    expect(g.gameOver?).to be true
  end 
  
    it 'check game fail' do
    g = Hangman.new('News', 3)
    expect(g.gameOver?).to be false
    expect(g.gameWon?).to be false
    expect(g.word).to eq 'news'
    g.guess('n')
    g.guess('e')
    expect(g.display).to eq 'n e _ _'
    g.hint
    expect(g.count).to eq 2
    g.hint
    expect(g.count).to eq 1
    g.guess('n')
    g.guess('e')
    expect(g.display).to eq 'n e _ _'
    g.hint
    g.guess('r')
    expect(g.gameOver?).to be true
     expect(g.gameWon?).to be false
  end 
  
end

