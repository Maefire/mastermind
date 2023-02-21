require './string_colors'

# this module is used to check password against guesses, then print the guess and
# hint out for the player feedback
module GameLogic
  include StringColors

  CHOICES = %w[1 2 3 4 5 6].freeze

  OPTIONS = %i[print no_print player_mode ai_mode].freeze

  def password_compare(password, guess, options: :print)
    temp_password = password.clone
    temp_guess = guess.clone
    unconverted_hint = hint_checking(temp_password, temp_guess)
    if OPTIONS[0].eql?(options)
      print "#{colored_numbers(guess)}    hint:#{convert_hint(unconverted_hint)}\n\n"
    end

    unconverted_hint
  end

  def hint_checking(password, guess)
    @hint = []
    password.each_with_index do |element, index|
      next unless guess[index] == element

      @hint << '!'
      password[index] = 'match'
      guess[index] = 'match'
    end

    guess.each_index do |index|
      next unless guess[index] != 'match' && password.include?(guess[index])

      @hint << '?'
      first_matching_index = password.find_index(guess[index])
      password[first_matching_index] = 'partial'
      guess[index] = 'partial'
    end
    @hint
  end

  def convert_hint(_hint_array)
    hint_string = @hint.map { |color| hint_colors(color) }
    hint_string.join
  end

  def password_solved?(options: :player_mode)
    if OPTIONS[-1].eql?(options)
      return unless @current_hint.eql?(%w[! ! ! !])

      puts "\e[102mThat AI needs a nerf, right? It guessed your password!\e[0m"
    elsif OPTIONS[2].eql?(options)
      return unless @user_guess.eql?(@password)

      puts "\e[102mCongratulations! You cracked that try-hard AI's password!\e[0m"
    end
    try_again?
  end

  def round_12?(options: :player_mode)
    if OPTIONS[-1].eql?(options)
      return unless @round_counter >= 12

      puts "\e[91mHow unfortunate...for the Skynet wannabe! You outsmarted the computer!\e[0m"
    elsif OPTIONS[2].eql?(options)
      return unless @round_counter >= 12

      puts "\e[91mHow unfortunate! The computer overlord won this time!\e[0m"
      puts "#{colored_numbers(@password)} was the password!\n\n"
    end
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
