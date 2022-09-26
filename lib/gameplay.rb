


  class Hangman # rubocop:disable Style/Documentation
    include TextInstructions
    include Display
    attr_accessor :guess, :hidden

    def initialize
      @game_over = false
      @result = ''
      @tries = 7
      @incorrect_guess = []
      @used = []
      create_hidden(word_select)
      puts instructions
    end

    def word_select
      list = []
      file_data = File.read('google-10000-english-no-swears.txt').split
      file_data.each do |word|
        list << word if word.length >= 5 && word.length <= 12
      end
      @secret_word = list.sample(1)
      @secret_word = @secret_word.to_s.gsub(/("|\[|\])/, '').upcase
      @secret_word
    end

    def play_round
      input_guess
      check_win
      check_loss
    end

    def display
      display_hidden(@hidden)
      display_tries(@tries)
      display_incorrect(@incorrect_guess)
    end

    def input_guess
      display_hidden(@hidden)
      display_tries(@tries)
      display_incorrect(@incorrect_guess)
      puts "Guess a letter or enter 'save' to save your game."
      guess = gets.chomp.upcase
      return guess if guess == 'SAVE'
      
      check_guess(guess)
    end

    def create_hidden(word)
      word_length = word.length
      @hidden = Array.new(word_length, '_')
    end

    def check_guess(guess)
      if @used.include?(guess)
        puts "You've already tried that one.  Try again..."
      elsif @secret_word.include?(guess)
        temp_word = @secret_word.split(//)
        temp_word.each_with_index do |l, i|
          @hidden[i] = guess if l == guess
        end
      else
        @incorrect_guess << guess
        @tries -= 1
      end
      @used << guess
    end

    def over?
      check_win == true ||  check_loss == true
    end

    def check_win
      return if @hidden.include? '_'

      puts 'Congratulations!  You are the smartest person alive!!!'
      puts @secret_word
      true
    end

    def check_loss
      if @tries == 0
        puts 'Oh, You were so close!'
        puts @secret_word
        @game_over == true
      end
    end
  end
