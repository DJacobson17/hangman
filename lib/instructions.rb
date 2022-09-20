# frozen_string_literal: true

module TextInstructions
  def instructions
    <<~HEREDOC

      WELCOME TO HANGMAN
            
             ________
             |       |       R Q N P G F
             O       |
            /|\\      |     
            / \\      |
                  ___|___     _ A _ T _
                  
                  
     How to play:
     
      The computer will select a word at random between 
     5 and 12 letters.  You will try to guess that word
     by suggesting letters you think are in that word.  
     If you guess a letter that is in the word all occurrences 
     of it will show up in the secret word spaces.  If you
     guess a letter that is not in the word that letter will appear
     in the list of incorrect letters and an element of the man
     is added.
      The game is over when all of the letters are guessed correctly
    or when the stick man is completed (6 misses).

                 GOOD LUCK!!!

    HEREDOC
  end
end
