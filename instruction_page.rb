# this module only contains the intructions/title page of the game
module InstructionPage
  def instructions
    <<~HEREDOC


      "\e[4mMastermind instructions:\e[0m"
      This is a version of the Mastermind game, where you are put against a computer player.
      The goal of this game is to make or break a password using 4 out of 6  given colored numbers.

      #{print_colored_numbers([1, 2, 3, 4, 5, 6])}
      #{code_colors("1")}
    HEREDOC
  end
end
