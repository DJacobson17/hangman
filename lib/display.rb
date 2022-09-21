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

  def turn_display
    puts @row1
    puts @row2
    puts @row0
    puts @row0
    puts @row0
    puts @row0
    puts @row7
  end
end
