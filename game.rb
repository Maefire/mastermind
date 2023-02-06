require './instruction_page'
require './string_colors'

# this will be the start of the game, using separated concerns
class Game
  include InstructionPage
  include StringColors

  def play
    puts instructions
  end
end
