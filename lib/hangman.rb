require_relative 'instructions'
require_relative 'display'
require_relative 'gameplay'
require 'pry-byebug'
require 'yaml'

def save_game(game)
  filename = 'saved_game.yml'
  dump = YAML.dump(game)
  File.open(filename, 'w') { |file| file.write dump }
end

def load_game
  filename = 'saved_game.yml'
  # saved = File.open(/Users/davidjacobson/Desktop/TOP/ruby/hangman/saved_game.yml, 'r')
  YAML.load_file(filename,
                 permitted_classes: [Hangman]
)
  # saved.close
  
end

puts 'New game or Saved game?  (N or S)'
type = gets.chomp.downcase
until %w[n s].include?(type)
  puts 'Invalid choice. Please enter n or s'
  type = gets.chomp.downcase
end

game = type == 'n' ? Hangman.new : load_game
until game.over?
  next unless game.input_guess == 'SAVE'
  if save_game(game)
    puts 'Game saved'
    exit!
    end
end

