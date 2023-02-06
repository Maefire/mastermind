# this module only contains the intructions/title page of the game
module InstructionPage
  def instructions
    <<~HEREDOC


      \e[4mMastermind instructions:\e[0m

        This is a version of the Mastermind game, where you are put against a computer
        player.
        The goal of this game is to make or break a password using 4 out of 6  given
        colored numbers.

        These are the provided colored numbers to choose from:
        #{print_colored_numbers([1, 2, 3, 4, 5, 6])}


        Alongside the numbers, you will have hints to guide you on your way to victory.
        These hints will indicate if you have a number in the correct position,
        or if you have a correct number in the wrong position. It is your goal to figure
        out which numbers relate to the hints, using logic.

        If you have a matching number, in the correct position, you will see at
        least one #{hint_colors('!')}

        If you have a matching number, but in the wrong position, you will instead
        see at least one #{hint_colors('?')}

        An example round might look like this:
        (Hidden password: #{print_colored_numbers([6, 4, 3, 1])})

        \e[4mRound 1\e[0m

        you guessed:

        #{print_colored_numbers([6, 3, 2, 5])}  #{hint_colors('!')}#{hint_colors('?')}

        As you can see, the #{code_colors('6')} was in the right spot, which gave a #{hint_colors('!')} hint,
        while the #{code_colors('3')} was in the password, but in the wrong spot,
        which gave a #{hint_colors('?')} hint.

        \e[1mWait a second,because there's a catch:\e[0m
        You only have \e[1;4;3;31m12 rounds\e[0m to guess the password correctly!

        \e[1;3;36mG O O D  L U C K !\e[0m

    HEREDOC
  end
end
