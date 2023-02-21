require './string_colors'
require './game_logic'

# instantiated if player wants to guess the password
class Breaker
  include StringColors
  include GameLogic

  def game_loop
    @round_counter = 1
    generate_password # delete da "p" nerd
    loop do
      puts "\e[1mRound: #{@round_counter}\e[0m"
      guess_password
      break if password_solved?(options: :player_mode) || round_12?(options: :player_mode)

      @round_counter += 1
    end
  end

  # this creates a random password of 4 numbers
  def generate_password
    @password = CHOICES.repeated_permutation(4).to_a.sample
  end

  def guess_password
    puts 'Please enter four numbers between 1-6 for the password:'
    puts "\e[2m(Invalid characters are ignored.)\e[0m"
    @user_guess = gets.chomp.delete('^1-6').split('')
    if @user_guess.length == 4
      password_compare(@password, @user_guess)
    else
      puts 'Error! Only enter four numbers between 1-6!'
      @round_counter -= 1
    end
  end
end
