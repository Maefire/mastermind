require './string_colors'
require './game_logic'

# the logic for when the player wants to guess the password
class Breaker
  include StringColors
  include GameLogic

  attr_reader :choices

  @choices = %w[1 2 3 4 5 6]

  # this creates a random password of 4 numbers
  def generated_password
    @password = @@choices.repeated_permutation(4).to_a.sample
  end

  def guess_password
    puts 'Please enter four numbers between 1-6 for the password:'
    @user_guess = gets.chomp.delete('^1-6').split('')
    if @user_guess.length == 4
      puts print_colored_numbers(@user_guess)
    else
      puts 'Error! Only enter four numbers between 1-6!'
    end
  end
end
