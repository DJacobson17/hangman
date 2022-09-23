require_relative 'instructions'
require_relative 'display'
require_relative 'gameplay'
require 'pry-byebug'

class Hangman # rubocop:disable Style/Documentation
  include TextInstructions
  include Display
  include Gameplay
  attr_accessor :guess, :hidden
  
  def initialize
    puts instructions
    new_game
  end

  def new_game
    @game_over = false
    @result = ''
    @tries = 7
    @incorrect_guess = []
    @used = []
    create_hidden(word_select)
    play_round while @game_over == false
    display_result(@result)
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
end
Hangman.new

