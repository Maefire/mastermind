# Mastermind
Mastermind or Master Mind is a code-breaking game for two players.[1][2] It resembles an earlier pencil and paper game called Bulls and Cows that may date back a century.

# Gameplay and rules
The game is played using:

a decoding board, with a shield at one end covering a row of four large holes, and twelve (or ten, or eight, or six) additional rows containing four large holes next to a set of four small holes;
code pegs of six different colors (or more; see Variations below), with round heads, which will be placed in the large holes on the board; and
key pegs, some colored black, some white, which are flat-headed and smaller than the code pegs; they will be placed in the small holes on the board.
The two players decide in advance how many games they will play, which must be an even number. One player becomes the codemaker, the other the codebreaker. The codemaker chooses a pattern of four code pegs. Players decide in advance whether duplicates and blanks are allowed. If so, the codemaker may even choose four same-colored code pegs or four blanks. If blanks are not allowed in the code, the codebreaker may not use blanks in their guesses. The codemaker places the chosen pattern in the four holes covered by the shield, visible to the codemaker but not to the codebreaker.

The codebreaker tries to guess the pattern, in both order and color, within eight to twelve turns. Each guess is made by placing a row of code pegs on the decoding board. Once placed, the codemaker provides feedback by placing from zero to four key pegs in the small holes of the row with the guess. A colored or black key peg is placed for each code peg from the guess which is correct in both color and position. A white key peg indicates the existence of a correct color code peg placed in the wrong position.

If there are duplicate colors in the guess, they cannot all be awarded a key peg unless they correspond to the same number of duplicate colors in the hidden code. For example, if the hidden code is red-red-blue-blue and the player guesses red-red-red-blue, the codemaker will award two colored key pegs for the two correct reds, nothing for the third red as there is not a third red in the code, and a colored key peg for the blue. No indication is given of the fact that the code also includes a second blue.

Once feedback is provided, another guess is made; guesses and feedback continue to alternate until either the codebreaker guesses correctly, or all rows on the decoding board are full.

Traditionally, players can only earn points when playing as the codemaker. The codemaker gets one point for each guess the codebreaker makes. An extra point is earned by the codemaker if the codebreaker is unable to guess the exact pattern within the given number of turns. (An alternative is to score based on the number of key pegs placed.) The winner is the one who has the most points after the agreed-upon number of games are played.

Other rules may be specified.

# Project
My goal is to recreate the original Mastermind game, as shown above, where you play versus the AI. I will be trying to make it so the AI uses the "Worst case: Five-guess algorithm". I will attempt to purposefully have it guess wrong from time to time, so that the player can win as the Code Maker. As the Code Breaker, the player will have 12 rounds to guess the password, using logical deduction. Programming wise, I want to practice a more in depth "separation of concerns", so that my game is split into more readable bits of logic.