require_relative 'instructions'
require_relative 'display'
require_relative 'gameplay'


class Hangman # rubocop:disable Style/Documentation
  include TextInstructions
  include Display
  include Gameplay
  def initialize
    puts instructions
    new_game
  end

  def new_game
    @game_over = false
    # word_select
    # turn_display
    # while game_over == false
    puts missing_letters(word_select)
  end

  def word_select
    list = []
    file_data = File.read('google-10000-english-no-swears.txt').split
    file_data.each do |word|
      list << word if word.length >= 5 && word.length <= 12
    end
    @secret_word = list.sample(1)
    @secret_word.to_s.gsub(/("|\[|\])/, "")

  end
end
Hangman.new

