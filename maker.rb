# this is mostly AI logic, for a computer to guess your password
require './string_colors'
require './game_logic'

# instantiated if player wants computer to guess the password
class Maker
  include StringColors
  include GameLogic

  attr_reader :user_password, :all_combo, :current_hint, :literal_guess

  def initialize
    @user_password = user_given_password
    @all_combo = CHOICES.repeated_permutation(4).to_a
    @literal_guess = nil
    @current_hint = nil
  end

  def game_loop
    @round_counter = 1
    puts "\e[1mRound: #{@round_counter}\e[0m"
    generate_guess
    @round_counter += 1
    loop do
      break if password_solved?(options: :ai_mode) || round_12?(options: :ai_mode)

      reduce_pop
      puts "\e[1mRound: #{@round_counter}\e[0m"
      generate_guess
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

  # @all_combo.sample
  def generate_guess
    @literal_guess = @literal_guess.nil? ? %w[1 1 2 2] : @all_combo.first
    @current_hint = password_compare(@user_password, @literal_guess, options: :print)
  end

  def reduce_pop
    @all_combo = @all_combo.select do |possibility|
      hint = password_compare(@literal_guess, possibility, options: :no_print)
      hint.eql?(@current_hint) || hint.eql?(%w[! ! ! !])
    end
    @all_combo.delete(@literal_guess)
    ## enable these to see more on what is happening when reduce pop runs ##
    # puts "Remaining combos: #{@all_combo}"
    # puts "size of array: #{@all_combo.size}"
  end
end
