# Tic-Tac-Toe-WOPR
My first experience with AI: unbeatable tic-tac-toe!

This was the final project for my first ever CS course in grade 10. Written in Turing - an easy-to-read and simple-to-learn language - it provided an excellent starting-point to my programming career, building the knowledge base I developed when learning more complex languages like C++, Java, and Python.

You can download Turing from http://compsci.ca/holtsoft/, the same website where I learned much of the skills needed to create this project, or the new open source version (http://tristan.hume.ca/openturing/), also available on GitHub. Alternatively, you can just download and run the provided .exe file if you trust me.

The code is a bit beefy, at 1400 lines, and horribly inefficient. The vast majority of it is useless, brilliant animations, or copying and pasting the same sections of code over and over, corresponding to hardcoding which moves the computer should make for optimal play.

The AI is remarkably simple, based on a Magic Square whose horizontal, vertical, and diagonal sums all add up to 15:

%|2|9|4

%|7|5|3

%|6|1|8

The computer is able to check all these combinations through lines and lines of if-statements (I know I know) in order to play (or block) a winning move.

The three levels of play are 1) random moves, 2) randomly switching between Level 1 and Level 3, or 3) perfect play. Like WOPR in WarGames, trying to beat Level 3 is futile. If you can successfully beat Level 3, I'll buy you a beer or launch a nuke or something.

Level 2 is a mess. Don't play Level 2. 

The user also has the option of selection 1 or 2 player games, if you want to play with a friend instead of getting your ass kicked ;)

