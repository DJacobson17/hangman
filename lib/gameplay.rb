module Gameplay

  def input_guess
    puts 'Guess a letter'
    @guess = gets.chomp.upcase
  end

  def missing_letters(word)
    word_length = word.length
    puts word_length
    puts word
    hidden = Array.new(word_length, '_')
    hidden.join(' ')
  end


end