require './string_colors'
require './game_logic'

# instantiated if player wants to guess the password
class Breaker
  include StringColors
  include GameLogic

  attr_reader :choices

  def initialize
    @choices = %w[1 2 3 4 5 6]
  end

  def game_loop
    # round_counter = 1
    # generate_password
    # start the game loop, which will run between round 1-12.
    # guess_password
    # check password and print message using the correct method (guess_password runs check itself)
    # if round 13 (might be off by 1 here ), then break and return game over message
    # if password solved, break and return win message. When checking. easy check: 
            # if hint(!) is 4, win message.
            # alternatively, check if each member of array matches
    # round_counter += 1
    # end loop
  end

  # this creates a random password of 4 numbers
  def generate_password
    @password = @choices.repeated_permutation(4).to_a.sample
  end

  def guess_password
    puts 'Please enter four numbers between 1-6 for the password:'
    puts "\e[2m(Invalid characters are ignored.)\e[0m"
    @user_guess = gets.chomp.delete('^1-6').split('')
    if @user_guess.length == 4
      # run the comparison method here
      password_compare(@password, @user_guess)
    else
      puts 'Error! Only enter four numbers between 1-6!'
    end
  end
end
