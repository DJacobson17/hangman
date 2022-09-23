# frozen_string_literal: true

module Display # rubocop:disable Style/Documentation
  @row1 = '  ________'
  @row2 = '  |/    \\|'
  @row0 = '  |'
  @row3 = '  |       O'
  @row4 = '  |       |'
  @row4a = '  |      /|'
  @row4b = '  |      /|\\'
  @row5 = '  |       |'
  @row6 = '  |      /'
  @row6a = '  |      /\\'
  @row7 = '__|__'

  def hangman_display
    puts @row1
    puts @row2
    puts @row0
    puts @row0
    puts @row0
    puts @row0
    puts @row7
  end

  def display_hidden(word)
    puts word.join(' ')
  end

  def display_result(result)
    puts @secret_word
    if result == 'win'
      puts 'Congratulations!  You are the smartest person alive!!!'
    else
      puts 'Oh, You were so close!'
    end
  end

  def display_tries(tries)
    puts "Tries left: #{tries}"
  end

  def display_incorrect(guesses)
    puts "Incorrect guesses: #{guesses}"
  end
end
