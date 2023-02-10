# maker and breaker information here?
# steps in game:
#      ask maker to create password (We could get away with never printing this to screen)
#      ask breaker for password guess
#      check for matches
#      display current guess | display current hints
#      If guess is exact match, return the win condition
require './string_colors'

module GameLogic
  include StringColors

  def password_solved?
    # end game if solved
    # if hint for right position hits 4, and no wrong position, game win
  end

  def password_compare(password, guess)
    # both password and guess are an array of strings
    temp_password = password.clone
    temp_guess = guess.clone
    unconverted_hint = hint_checking(temp_password, temp_guess)
    hint = convert_hint(unconverted_hint)
    print "#{colored_numbers(temp_guess)}    hint:#{hint}"
  end

  def hint_checking(password, guess)
    hint = []
    guess.each_with_index do |element, index|
      if password[index] == element
        hint << '!'
      elsif password.include?(element)
        hint << '?'
      end
    end
    hint
  end

  def convert_hint(hint)
    hint_string = hint.map { |color| hint_colors(color) }
    hint_string.join
  end
end
