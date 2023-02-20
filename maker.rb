# this is mostly AI logic, for a computer to guess your password
require './string_colors'
require './game_logic'

# instantiated if player wants computer to guess the password
class Maker
  include StringColors
  include GameLogic

  attr_reader :user_password, :all_combo, :current_guess

  def initialize
    @user_password = user_given_password
    @all_combo = CHOICES.repeated_permutation(4)
    @current_guess = generate_initial_guess
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
  def user_given_password
    puts 'Please enter four numbers between 1-6 for the password:'
    puts "\e[2m(Invalid characters are ignored.)\e[0m"
    input_password = gets.chomp.delete('^1-6').split('')
    return puts 'Error! Only enter four numbers between 1-6!' unless input_password.length == 4

    input_password
  end

  # computer logic to guess password

  def generate_initial_guess
    initial_guess = %w[1 1 2 2]
    @current_guess = password_compare(@user_password, initial_guess, options: :no_print)
  end

  # need to add a check so it keeps the answer and the matches that equal %w(? ? ? ?)
  def reduce_pop
    @all_combo = @all_combo.select do |possibility|
      hint = password_compare(@user_password, possibility, options: :no_print)
      hint.eql?(@current_guess) || hint.eql?(%w[? ? ? ?]) || hint.eql?(%w[! ! ! !])
    end

    puts "Remaining combos: #{@all_combo}"
  end

  def next_guess
    next_guess = @all_combo.sample
    @current_guess = password_compare(@user_password, next_guess, options: :no_print)

    puts "Current guess: #{@current_guess}"
  end

  # vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv#
  # vvvvv these all need to be refactored with the ai in mind vvvvv#
  # vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv#
  def password_solved?
    return unless @current_guess.eql?(@password)

    puts "\e[102mCongratulations! You cracked the password!\e[0m"
    try_again?
  end

  def round_12?
    return unless @round_counter >= 12

    puts "\e[91mHow unfortunate! The computer overlord won this time!\e[0m"
    try_again?
  end
  # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#
  # ^^^^^ these all need to be refactored with the ai in mind ^^^^^#
  # ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#
end
