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
      break if password_solved? || round_12?

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

  def password_solved?
    return unless @user_guess.eql?(@password)

    puts "\e[102mCongratulations! You cracked the password!\e[0m"
    try_again?
  end

  def round_12?
    return unless @round_counter >= 12

    puts "\e[91mHow unfortunate! The computer overlord won this time!\e[0m"
    puts "#{colored_numbers(@password)} was the password!\n\n"
    try_again?
  end

  def try_again?
    puts 'New Game? Enter "Y" to continue, or any other key to quit.'
    new_game = gets.chomp.downcase
    if %w[y yes].include?(new_game)
      Game.new.play
    else
      puts 'Thank you for playing!'
    end
    true
  end
end
