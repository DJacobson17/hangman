module Gameplay # rubocop:disable Style/Documentation

  def play_round
    display_hidden(@hidden)
    display_tries(@tries)
    display_incorrect(@incorrect_guess)
    input_guess
    check_guess(@guess, @secret_word, @used)
    check_win
    check_loss
  end

  def input_guess
    puts 'Guess a letter'
    @guess = gets.chomp.upcase
  end

  def create_hidden(word)
    word_length = word.length
    @hidden = Array.new(word_length, '_')
  end

  def check_guess(guess, word, used)
    if used.include?(guess)
      puts "You've already tried that one.  Try again..."
    elsif word.include?(guess)
      temp_word = word.split(//)
      temp_word.each_with_index do |l, i|
        @hidden[i] = guess if l == guess
      end
    else
      @incorrect_guess << guess
      @tries -= 1
    end
    used << guess
  end

  def check_win
    return if @hidden.include? '_'

    @game_over = true
    @result = 'win'
  end

  def check_loss
    if @tries == 0
      @game_over = true
      @result = 'lose'
    end
  end


end
