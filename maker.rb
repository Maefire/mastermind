# this is mostly AI logic, for a computer to guess your password
require './string_colors'
require './game_logic'

# instantiated if player wants computer to guess the password
class Maker
  include StringColors
  include GameLogic

  attr_reader :choices

  def initialize
    @choices = %w[1 2 3 4 5 6]
  end

  def game_loop
    @round_counter = 1
    # generate_password
    loop do
      puts "\e[1mRound: #{@round_counter}\e[0m"
      guess_password
      break if password_solved? || round_12?

      @round_counter += 1
    end
  end

  # this creates a random password of 4 numbers
  def get_user_password
    puts 'Please enter four numbers between 1-6 for the password:'
    puts "\e[2m(Invalid characters are ignored.)\e[0m"
    @user_password = gets.chomp.delete('^1-6').split('')
    unless @user_password.length == 4
      puts 'Error! Only enter four numbers between 1-6!'
    end
  end

  def guess_password
    # computer logic to guess password
    # if you want multiple difficulties, you might want to make multiple versions of
    # this, named appropriately, so it guesses passwords at different average totals
    # consider forcing it to guess wrong on purpose for an "easy mode"
    # The algorithm works as follows, with P = length of the solution used in the game,  
    # x1 = exact matches ("!") and Y1 = near matches ("?"):

    # Set i = 1
    # Play fixed initial guess G1 (my first "test" guess for ai to try. [1, 1, 2, 2]?)
    # Get the response X1 and Y1 password_compare(@user_password, @guess)
    
    # Repeat while Xi ≠ P: (start a loop. while "!"(i) != @user_password.length)
    # i += 1
    # Set Ei = ∅ and h = 1
    # Initialize population
    # Repeat while h ≤ maxgen and |Ei| ≤ maxsize:
    # Generate new population using crossover, mutation, inversion and permutation
    
    # Calculate fitness (hint_checking is my fitness function,so password_compare)
    # Add eligible combinations to Ei
    # Increment h
    # Play guess Gi which belongs to Ei
    # Get response Xi and Yi
  end

  # vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv#
  # vvvvv these all need to be refactored with the ai in mind vvvvv#
  # vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv#
  def password_solved?
    return unless @user_guess.eql?(@password)

    puts "\e[102mCongratulations! You cracked the password!\e[0m"
    try_again?
  end

  def round_12?
    return unless @round_counter >= 12

    puts "\e[91mHow unfortunate! The computer overlord won this time!\e[0m"
    try_again?
  end

  def try_again?
    puts 'New Game? Enter \"Y\" to continue, or any other key to quit.'
    new_game = gets.chomp.downcase
    if %w[y yes].include?(new_game)
      Game.new.play
    else
      puts 'Thank you for playing!'
    end
    true
  end
  # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#
  # ^^^^^ these all need to be refactored with the ai in mind ^^^^^#
  # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#
end
