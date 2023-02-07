require './instruction_page'
require './string_colors'

# this will be the start of the game, using separated concerns
class Game
  include InstructionPage
  include StringColors

  def play
    puts instructions
    check_choice = maker_or_breaker?
  end

  def maker_or_breaker?
    puts <<~HEREDOC
      Would you prefer to be the password:
      \e[2m(Type one of the below options)\e[0m
      \e[1;4mMaker\e[0m

      \e[1;4mBreaker\e[0m

    HEREDOC
    loop do
      user_input = gets.chomp.downcase
      return user_input if %w[maker breaker].include?(user_input)

      puts 'Error! Please enter "Maker" or "Breaker"!'
    end
  end

  def breaker_logic
    # pull from logic file
  end

  def maker_logic
    # pull from logic file
  end
end
