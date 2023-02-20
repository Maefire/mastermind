require './string_colors'

# this module is used to check password against guesses, then print the guess and
# hint out for the player feedback
module GameLogic
  include StringColors

  CHOICES = %w[1 2 3 4 5 6].freeze

  OPTIONS = %i[print no_print].freeze

  def password_compare(password, guess, options: :print)
    temp_password = password.clone
    temp_guess = guess.clone
    unconverted_hint = hint_checking(temp_password, temp_guess)
    if OPTIONS.index(options).zero?
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
