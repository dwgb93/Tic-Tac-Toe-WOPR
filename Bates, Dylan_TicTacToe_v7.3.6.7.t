setscreen ("graphics:800;600")

var u : array 1 .. 5 of int %................................................the array that holds all of the players moves
var c : array 1 .. 5 of int %................................................the array that holds all of the computers moves
var u1 : array 1 .. 5 of int %...............................................the array that holds all of player 1's moves moves
var u2 : array 1 .. 5 of int %...............................................the array that holds all of player 2's moves
var answer : string (1)
var win, lose, cat : int := 0     %...........................................counter for how many wins, losses, cats
var level, place : int %.....................................................Variables for level and place
var OnePlayer, TwoPlayer, X1, O1, X1st, O1st, level2 : boolean := false %....Variables are made false
var font1, font2, x, y, button, delay1 : int %...............................Variables for 2 fonts, delay, and mousewhere

font1 := Font.New ("serif:24:Bold,Italic") %.................................Makes font Times New Roman 24 Bold Italic
font2 := Font.New ("Agency FB:18") %.........................................Makes font Agency FB 18

%MUSIC: Plays song in a loop when it says fork PlayMusic
% process PlayMusic
%     loop
%         Music.PlayFile ("Overworld.mid")
%     end loop
% end PlayMusic
% fork PlayMusic
% UNCOMMENT THIS COMMENTED RANGE FOR RELAXING MUSIC WHILE YOU PLAY, BUT A MUCH SLOWER PROGRAM

proc Draw_board %............................................................Procedure to start game

    %Variables become false
    OnePlayer := false
    TwoPlayer := false
    X1 := false
    O1 := false
    X1st := false
    O1st := false
    level2 := false

    loop %...................................................................Repeats
	colorback (30) %.....................................................Background is gray
	cls %................................................................Makes whole background the colour
	Font.Draw ("Welcome to my Tic Tac Toe Game!", 50, maxy - 50, font1, blue) %Says quote
	Font.Draw ("Do you want to play? (y or n)", 150, maxy - 100, font1, red) %Says quote
	getch (answer) %.....................................................Get y or n

	case answer of %.....................................................Cases answer
	    label "y", "Y" : %...............................................If answer = y or Y
		cls %........................................................Then clear screen
		exit %.......................................................And exits case
	    label "n", "N" : %...............................................If answer = n or N
		cls %........................................................Then clear sceen
		Font.Draw ("If you change your mind, press any key.", 50, maxy - 50, font1, red) %And write quote
		Input.Pause %................................................Wait for a key to press
		cls %........................................................Then clear screen
	    label : %........................................................If answer = anything else
		Font.Draw ("That is an invalid choice. Please enter y or n.", 100, 200, font2, black) %Then put quote
	end case %...........................................................End case statement

    end loop %...............................................................End the loop

    Font.Draw ("Pick one player or two.", 50, maxy - 50, font1, blue) %......Writes quote
    drawfilloval (200, 300, 25, 25, black) %.................................Draws head
    drawfillarc (200, 250, 25, 25, 0, 180, black) %..........................Draws shoulders
    drawfillbox (175, 200, 225, 250, black) %................................Draws body
    drawbox (230, 250, 330, 350, black) %....................................Draws computer outline
    drawfillbox (235, 255, 325, 345, black) %................................Draws computer screen
    drawline (280, 250, 230, 225, black) %...................................Draws left stand
    drawline (230, 225, 330, 225, black) %...................................Draws stand base
    drawline (330, 225, 280, 250, black) %...................................Draws right stand
    drawfilloval (500, 300, 25, 25, black) %.................................Draws other head
    drawfillarc (500, 250, 25, 25, 0, 180, black) %..........................Draws other shoulders
    drawfillbox (475, 200, 525, 250, black) %................................Draws other body
    drawfilloval (550, 325, 25, 25, black) %.................................Draws other body
    drawfillarc (550, 275, 25, 25, 0, 180, black) %..........................Draws other shoulders
    drawfillbox (525, 225, 575, 275, black) %................................Draws other body

    loop %...................................................................Repeats
	mousewhere (x, y, button) %..........................................Finds mouse x, y, coordinates and if button if pressed
	if button = 1 then %.................................................If button is pressed
	    if x < 330 and x > 175 and y < 350 and y > 200 %.................If the mouse coordinates are between range
		    then %...................................................Then
		OnePlayer := true %..........................................Var becomes true
		cls %........................................................The screen is cleared
		exit %.......................................................And the loop is exited
	    elsif x < 575 and x > 475 and y < 350 and y > 200 %..............Otherwise, if the mosue coordinates are with range
		    then %...................................................Then
		TwoPlayer := true %..........................................Var becomes true
		cls %........................................................The screen is cleared
		exit %.......................................................And the loop is exited
	    end if %.........................................................Ends if statement
	end if %.............................................................Ends other if statement
    end loop %...............................................................End loop

    if OnePlayer = true %....................................................If var is
	    then %...............................................................Then
	Font.Draw ("Pick X's or O's.", 50, maxy - 50, font1, blue) %.............Put quote
	for b : 1 .. 100 %.......................................................For variable c 1-100 times
	    drawfilloval (200 + b, 300 - b, 5, 5, brightred) %...................Draw left side of X
	    delay (1) %.........................................................Slow it down a bit
	end for %................................................................End for loop
	for d : 1 .. 100 %.......................................................For variable d 1-100 times
	    drawfilloval (300 - d, 300 - d, 5, 5, brightred) %...................Draw right side of X
	    delay (1) %.........................................................Slow it down a bit
	end for %................................................................End for loop
	for e : 1 .. 360 %.......................................................For d 1-360 degrees
	    drawfillarc (500, 250, 50, 50, 0, 0 + e, black) %....................Draw a circle
	    drawfilloval (500, 250, 40, 40, 30) %.............................With a gray one on top to make an O
	    delay (1) %.........................................................Slow it down a bit
	end for %................................................................End for loop

	loop %...................................................................Repeats
	    mousewhere (x, y, button) %..........................................Finds mouse x, y, coordinates + if button is pressed
	    if button = 1 %......................................................If button is pressed
		    then %.......................................................Then
		if x < 305 and x > 195 and y < 305 and y > 195 %.................If mouse coordinates are between range
			then %...................................................Then
		    X1 := true %.................................................Var X1 becomes true
		    cls %........................................................The screen is cleared
		    exit %.......................................................And exits the loop
		elsif x < 550 and x > 450 and y < 300 and y > 200 %..............Otherwise if the mouse coordinates are between range
			then %...................................................Then
		    O1 := true %.................................................Var O1 becomes true
		    cls %........................................................The screen is cleared
		    exit %.......................................................And exits the loop
		end if %.........................................................Ends if statement
	    end if %.............................................................End other if statement
	end loop %...............................................................Ends loop

	Font.Draw ("Pick the level of difficulty.", 50, maxy - 50, font1, blue) %Write quotes
	Font.Draw ("1", 100, 300, font1, brightred)
	Font.Draw ("2", 300, 300, font1, brightred)
	Font.Draw ("3", 500, 300, font1, brightred)

	loop %...................................................................Repeats
	    mousewhere (x, y, button) %..........................................Finds mouse x, y, coordinates and if button if pressed
	    if button = 1 then %.................................................If button is pressed
		if x < 125 and x > 90 and y < 330 and y > 290 %................If the mouse coordinates are between range
			then %...................................................Then
		    level := 1 %.................................................Level becomes 1
		    cls %........................................................The screen is cleared
		    exit %.......................................................And the loop is exited
		elsif x < 325 and x > 290 and y < 330 and y > 290 %..............Otherwise, if the mosue coordinates are with range
			then %...................................................Then
		    level2 := true %.................................................Var becomes true
		    cls %........................................................The screen is cleared
		    exit %.......................................................And the loop is exited
		elsif x < 525 and x > 490 and y < 330 and y > 290 %..............Otherwise if mouse coordinates are between range
			then %...................................................Then
		    level := 3 %.................................................Level becomes 3
		    cls %........................................................The screen is cleares
		    exit %.......................................................And the loop is exited
		end if %.........................................................Ends if statement
	    end if %.............................................................Ends other if statement
	end loop %...............................................................End loop

    elsif TwoPlayer = true then
	Font.Draw ("Pick who goes first.", 50, maxy - 50, font1, blue) %.........Writes quote
	for h : 1 .. 100 %.......................................................For var h 1-100
	    drawfilloval (200 + h, 300 - h, 5, 5, brightred) %...................Draws left side of x
	    delay (1) %.........................................................Slows it down a bit
	end for %................................................................Ends for loop
	for i : 1 .. 100 %.......................................................For var i 1-100
	    drawfilloval (300 - i, 300 - i, 5, 5, brightred) %...................Draws right side of x
	    delay (1) %.........................................................Slows it down a bit
	end for %................................................................Ends for loop
	for j : 1 .. 360 %.......................................................For var 1-360 degrees
	    drawfillarc (500, 250, 50, 50, 0, 0 + j, black) %....................Draw circle
	    drawfilloval (500, 250, 40, 40, 30) %................................With a grey one ontop to make an O
	    delay (1)
	end for

	loop %...................................................................Repeats
	    mousewhere (x, y, button) %..........................................Finds mouse x, y, coordinates + if button is pressed
	    if button = 1 %......................................................If button is pressed
		    then %.......................................................Then
		if x < 305 and x > 195 and y < 305 and y > 195 %.................If mouse coordinates are between range
			then %...................................................Then
		    X1st := true %.................................................Var X1 becomes true
		    cls %........................................................The screen is cleared
		    exit %.......................................................And exits the loop
		elsif x < 550 and x > 450 and y < 300 and y > 200 %..............Otherwise if the mouse coordinates are between range
			then %...................................................Then
		    O1st := true %.................................................Var O1 becomes true
		    cls %........................................................The screen is cleared
		    exit %.......................................................And exits the loop
		end if %.........................................................Ends if statement
	    end if %.............................................................End other if statement
	end loop %...............................................................Ends loop

    end if %.....................................................................Ends if statement
    %DRAWS BOARD
    for a : 1 .. 400
	drawfilloval (225, 500 - a, 10, 10, purple)
	delay (1)
    end for
    for e : 1 .. 400
	drawfilloval (375, 500 - e, 10, 10, purple)
	delay (1)
    end for
    for f : 1 .. 400
	drawfilloval (100 + f, 375, 10, 10, purple)
	delay (1)
    end for
    for g : 1 .. 400
	drawfilloval (100 + g, 225, 10, 10, purple)
	delay (1)
    end for
    %WRITES SCORES
    locate (35, 25)
    put win
    locate (35, 53)
    put lose
    locate (35, 90)
    put cat
    %WRITES QUOTES
    Font.Draw ("WINS:", 100, 45, font1, brightgreen)
    Font.Draw ("LOSES:", 300, 45, font1, brightred)
    Font.Draw ("CATS GAMES:", 500, 45, font1, yellow)

end Draw_board

%Procedure
proc Initialize
    %resets the global values to "0" and
    %used if another game will be played without closing the window
    for i : 1 .. 5
	u (i) := -999
	u1 (i) := -999
	u2 (i) := -999
	c (i) := -999
    end for
end Initialize

function User_Win : boolean
    %checks to see if 3 of the users moves equals 15
    %which will make the user win
    if u (1) + u (2) + u (3) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1 %adds to the win counter
	locate (35, 25)
	put win %puts the win counter
	result true
    elsif u (2) + u (3) + u (4) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u (3) + u (4) + u (5) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u (1) + u (3) + u (4) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u (1) + u (4) + u (5) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u (1) + u (2) + u (4) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u (1) + u (3) + u (5) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u (2) + u (4) + u (5) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u (2) + u (3) + u (5) = 15 then
	Font.Draw ("You Win!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    end if

    result false
end User_Win

function User1_Win : boolean
    if u1 (1) + u1 (2) + u1 (3) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1 %adds to the win counter
	locate (35, 25)
	put win %puts the win counter
	result true
    elsif u1 (2) + u1 (3) + u1 (4) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u1 (3) + u1 (4) + u1 (5) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u1 (1) + u1 (3) + u1 (4) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u1 (1) + u1 (4) + u1 (5) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u1 (1) + u1 (2) + u1 (4) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u1 (1) + u1 (3) + u1 (5) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u1 (2) + u1 (4) + u1 (5) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u1 (2) + u1 (3) + u1 (5) = 15 then
	Font.Draw ("Player 1 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    end if
    result false

end User1_Win

function User2_Win : boolean
    if u2 (1) + u2 (2) + u2 (3) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1 %adds to the win counter
	locate (35, 25)
	put win %puts the win counter
	result true
    elsif u2 (2) + u2 (3) + u2 (4) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u2 (3) + u2 (4) + u2 (5) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u2 (1) + u2 (3) + u2 (4) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u2 (1) + u2 (4) + u2 (5) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u2 (1) + u2 (2) + u2 (4) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u2 (1) + u2 (3) + u2 (5) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u2 (2) + u2 (4) + u2 (5) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    elsif u2 (2) + u2 (3) + u2 (5) = 15 then
	Font.Draw ("Player 2 Wins!", maxy - 50, maxy - 50, font2, brightgreen)
	win := win + 1
	locate (35, 25)
	put win
	result true
    end if

    result false
end User2_Win

function Computer_Win : boolean
    %to check if 3 of the computers move will equal 15
    %which will make the computer win
    if c (1) + c (2) + c (3) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1 %adds to the lose counter
	locate (35, 86)
	put lose %puts the lose counter
	result true
    elsif c (2) + c (3) + c (4) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1
	locate (35, 86)
	put lose
	result true
    elsif c (3) + c (4) + c (5) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1
	locate (35, 86)
	put lose
	result true
    elsif c (1) + c (3) + c (4) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1
	locate (35, 86)
	put lose
	result true
    elsif c (1) + c (4) + c (5) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1
	locate (35, 86)
	put lose
	result true
    elsif c (1) + c (2) + c (4) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1
	locate (35, 86)
	put lose
	result true
    elsif c (1) + c (3) + c (5) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1
	locate (35, 86)
	put lose
	result true
    elsif c (2) + c (4) + c (5) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1
	locate (35, 86)
	put lose
	result true
    elsif c (2) + c (3) + c (5) = 15 then
	Font.Draw ("You Lose!", maxy - 50, maxy - 50, font2, brightred)
	lose := lose + 1
	locate (35, 86)
	put lose
	result true
    end if

    result false
end Computer_Win

function taken (x : int) : boolean
    %checks to see if the move selected has already been taken
    %if true then another move will have to be made
    for i : 1 .. 5
	if x = u (i) or x = c (i) or x = u1 (i) or x = u2 (i) then
	    result true
	end if
    end for
    result false
end taken

function Get_User_Move : int
    %gets the users move by clicking with the mouse in the
    %desired location
    var x, y, button : int
    %|2|9|4
    %|7|5|3
    %|6|1|8
    loop
	mousewhere (x, y, button)
	if button = 1 then
	    if x >= 90 and x < 225 and y >= 90 and y <= 225 then
		if not (taken (6)) then


		    result 6
		end if
	    elsif x >= 225 and x < 375 and y >= 225 and y <= 375 then
		if not (taken (5)) then


		    result 5
		end if
	    elsif x >= 375 and x < 510 and y >= 375 and y <= 510 then
		if not (taken (4)) then


		    result 4
		end if
	    elsif x >= 90 and x < 225 and y >= 225 and y <= 375 then
		if not (taken (7)) then


		    result 7
		end if
	    elsif x >= 90 and x < 225 and y >= 375 and y <= 510 then
		if not (taken (2)) then


		    result 2
		end if
	    elsif x >= 225 and x < 375 and y >= 90 and y <= 225 then
		if not (taken (1)) then


		    result 1
		end if
	    elsif x >= 225 and x < 375 and y >= 375 and y <= 510 then
		if not (taken (9)) then


		    result 9
		end if
	    elsif x >= 375 and x < 510 and y >= 90 and y <= 225 then
		if not (taken (8)) then


		    result 8
		end if

	    elsif x >= 375 and x < 510 and y >= 225 and y <= 375 then
		if not (taken (3)) then


		    result 3
		end if
	    end if
	end if
    end loop

end Get_User_Move

function Get_User1_Move : int
    %gets the users move by clicking with the mouse in the
    %desired location. If mouse is withinn range and button is clicked and space is not takes then it takes that space
    var x, y, button : int
    %Numbers indicate where result goes
    %Each line adds to 15
    %|2|9|4
    %|7|5|3
    %|6|1|8
    loop
	mousewhere (x, y, button)
	if button = 1 then
	    if x >= 90 and x < 225 and y >= 90 and y <= 225 then
		if not (taken (6)) then


		    result 6
		end if
	    elsif x >= 225 and x < 375 and y >= 225 and y <= 375 then
		if not (taken (5)) then


		    result 5
		end if
	    elsif x >= 375 and x < 510 and y >= 375 and y <= 510 then
		if not (taken (4)) then


		    result 4
		end if
	    elsif x >= 90 and x < 225 and y >= 225 and y <= 375 then
		if not (taken (7)) then


		    result 7
		end if
	    elsif x >= 90 and x < 225 and y >= 375 and y <= 510 then
		if not (taken (2)) then


		    result 2
		end if
	    elsif x >= 225 and x < 375 and y >= 90 and y <= 225 then
		if not (taken (1)) then


		    result 1
		end if
	    elsif x >= 225 and x < 375 and y >= 375 and y <= 510 then
		if not (taken (9)) then


		    result 9
		end if
	    elsif x >= 375 and x < 510 and y >= 90 and y <= 225 then
		if not (taken (8)) then


		    result 8
		end if

	    elsif x >= 375 and x < 510 and y >= 225 and y <= 375 then
		if not (taken (3)) then


		    result 3
		end if
	    end if
	end if

    end loop

end Get_User1_Move

function Get_User2_Move : int
    %gets the users move by clicking with the mouse in the
    %desired location
    var x, y, button : int
    %|2|9|4
    %|7|5|3
    %|6|1|8
    loop
	mousewhere (x, y, button)
	if button = 1 then
	    if x >= 90 and x < 225 and y >= 90 and y <= 225 then
		if not (taken (6)) then


		    result 6
		end if
	    elsif x >= 225 and x < 375 and y >= 225 and y <= 375 then
		if not (taken (5)) then


		    result 5
		end if
	    elsif x >= 375 and x < 510 and y >= 375 and y <= 510 then
		if not (taken (4)) then


		    result 4
		end if
	    elsif x >= 90 and x < 225 and y >= 225 and y <= 375 then
		if not (taken (7)) then


		    result 7
		end if
	    elsif x >= 90 and x < 225 and y >= 375 and y <= 510 then
		if not (taken (2)) then


		    result 2
		end if
	    elsif x >= 225 and x < 375 and y >= 90 and y <= 225 then
		if not (taken (1)) then


		    result 1
		end if
	    elsif x >= 225 and x < 375 and y >= 375 and y <= 510 then
		if not (taken (9)) then


		    result 9
		end if
	    elsif x >= 375 and x < 510 and y >= 90 and y <= 225 then
		if not (taken (8)) then


		    result 8
		end if

	    elsif x >= 375 and x < 510 and y >= 225 and y <= 375 then
		if not (taken (3)) then


		    result 3
		end if
	    end if
	end if

    end loop

end Get_User2_Move

function Can_Computer_Win : int
    %adds 2 of the computers move together and will move the
    %spot that equals the sum of the 2 moves - 15 and that number will be made
    for i : 1 .. 4
	for j : i + 1 .. 5
	    if c (i) + c (j) = 11 then
		if not (taken (4)) then

		    result 4
		end if
	    elsif c (i) + c (j) = 6 then
		if not (taken (9)) then

		    result 9
		end if
	    elsif c (i) + c (j) = 13 then
		if not (taken (2)) then

		    result 2
		end if
	    elsif c (i) + c (j) = 9 then
		if not (taken (6)) then

		    result 6
		end if
	    elsif c (i) + c (j) = 8 then
		if not (taken (7)) then

		    result 7
		end if
	    elsif c (i) + c (j) = 7 then
		if not (taken (8)) then

		    result 8
		end if
	    elsif c (i) + c (j) = 10 then
		if not (taken (5)) then

		    result 5
		end if
	    elsif c (i) + c (j) = 12 then
		if not (taken (3)) then

		    result 3
		end if
	    elsif c (i) + c (j) = 14 then
		if not (taken (1)) then

		    result 1
		end if
	    end if
	end for
    end for

    result 0

end Can_Computer_Win

function Block_User : int
    %adds 2 of users move together and moves the computer into the
    %spot need for the user to get 15
    for i : 1 .. 4
	for j : i + 1 .. 5
	    if u (i) + u (j) = 11 then
		if not (taken (4)) then

		    result 4
		end if
	    elsif u (i) + u (j) = 6 then
		if not (taken (9)) then

		    result 9
		end if
	    elsif u (i) + u (j) = 13 then
		if not (taken (2)) then
		    result 2
		end if
	    elsif u (i) + u (j) = 9 then
		if not (taken (6)) then

		    result 6
		end if
	    elsif u (i) + u (j) = 8 then
		if not (taken (7)) then
		    result 7
		end if
	    elsif u (i) + u (j) = 7 then
		if not (taken (8)) then

		    result 8
		end if
	    elsif u (i) + u (j) = 10 then
		if not (taken (5)) then

		    result 5
		end if
	    elsif u (i) + u (j) = 12 then
		if not (taken (3)) then

		    result 3
		end if
	    elsif u (i) + u (j) = 14 then
		if not (taken (1)) then

		    result 1
		end if
	    end if
	end for
    end for

    result 0

end Block_User

function Get_Computer_Move (turn : int) : int
    %uses the Can_Computer_Win and the Block_User and
    %checks possible combination moves that the user can make
    %to trick the computer and then moves accordingly
    var move : int
    % Level two takes a random iteger 1-2
    loop
	if level2 = true then
	    randint (place, 1, 2)
	    %If one then level becomes one for that move
	    if place = 1 then
		level := 1
		%If two then level becomes three for that move
	    elsif place = 2 then
		level := 3
	    end if
	end if
	%Takes a random integer 1-9 If not taken then that move is used
	if level = 1 then
	    randint (move, 1, 9)
	    if not (taken (move)) then
		result move
	    end if
	end if
	%Level 3(Impossible to beat)
	if level = 3 then

	    if Can_Computer_Win = 0 then         %if the computer can win it will go for the win else it will check for a block
		if Block_User = 0 then         %if the computer can block it will go for the block else it will take the middle spot
		    if taken (5) then         %goes for the middle but if taken then
			%Finds out where to go based on prevoius moves by user
			for i : 1 .. 5
			    for j : 1 .. 5
				if u (i) = 2 and u (j) = 8 then
				    if not (taken (9)) then
					result 9
				    end if
				end if
				if u (i) = 4 and u (j) = 6 then
				    if not (taken (3)) then
					result 3
				    end if
				end if
				if u (i) = 2 and u (j) = 1 then
				    if not (taken (6)) then
					result 6
				    end if
				end if
				if u (i) = 2 and u (j) = 3 then
				    if not (taken (4)) then
					result 4
				    end if
				end if
				if u (i) = 4 and u (j) = 1 then
				    if not (taken (8)) then
					result 8
				    end if
				end if
				if u (i) = 4 and u (j) = 7 then
				    if not (taken (2)) then
					result 2
				    end if
				end if
				if u (i) = 6 and u (j) = 9 then
				    if not (taken (2)) then
					result 2
				    end if
				end if
				if u (i) = 6 and u (j) = 3 then
				    if not (taken (8)) then
					result 8
				    end if
				end if
				if u (i) = 8 and u (j) = 7 then
				    if not (taken (6)) then
					result 6
				    end if
				end if
				if u (i) = 8 and u (j) = 9 then
				    if not (taken (4)) then
					result 4
				    end if
				end if
				if u (i) = 5 and u (j) = 2 then
				    if not (taken (6)) then
					result 6
				    end if
				end if
				if u (i) = 5 and u (j) = 6 then
				    if not (taken (2)) then
					result 2
				    end if
				end if
				if u (i) = 5 and u (j) = 4 then
				    if not (taken (8)) then
					result 8
				    end if
				end if
				if u (i) = 5 and u (j) = 8 then
				    if not (taken (4)) then
					result 4
				    end if
				end if
				if u (i) = 7 and u (j) = 9 then
				    if not (taken (2)) then
					result 2
				    end if
				end if
				if u (i) = 7 and u (j) = 1 then
				    if not (taken (6)) then
					result 6
				    end if
				end if
				if u (i) = 1 and u (j) = 3 then
				    if not (taken (8)) then
					result 8
				    end if
				end if
				if u (i) = 3 and u (j) = 9 then
				    if not (taken (4)) then
					result 4
				    end if
				end if
			    end for
			end for
			for i : 1 .. 5
			    if u (i) = 5 then
				randint (move, 1, 4)
				if move = 1 then
				    if not (taken (2)) then
					result 2
				    end if
				elsif move = 2 then
				    if not (taken (4)) then
					result 4
				    end if
				elsif move = 3 then
				    if not (taken (6)) then
					result 6
				    end if
				elsif move = 4 then
				    if not (taken (8)) then
					result 8
				    end if
				end if
			    end if
			end for
		    else
			result 5
		    end if
		else
		    result Block_User
		end if
	    else
		result Can_Computer_Win
	    end if
	    randint (move, 1, 9)
	    if not (taken (move)) then
		result move
	    end if

	end if

    end loop
end Get_Computer_Move
%|2|9|4
%|7|5|3
%|6|1|8
%Finds out what the move result was, and draws an X, or O, depending on whose turn it is, and who went first
proc Plot_Move (player : string (2), var move : int)
    if OnePlayer = true then
	if player = "c" and X1 = true or player not= "c" and O1 = true then
	    %Draws O's
	    if move = 1 then
		for j : 1 .. 360
		    drawfillarc (300, 150, 50, 50, 0, 0 + j, black)
		    drawfilloval (300, 150, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 2 then
		for j : 1 .. 360
		    drawfillarc (150, 450, 50, 50, 0, 0 + j, black)
		    drawfilloval (150, 450, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 3 then
		for j : 1 .. 360
		    drawfillarc (450, 300, 50, 50, 0, 0 + j, black)
		    drawfilloval (450, 300, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 4 then
		for j : 1 .. 360
		    drawfillarc (450, 450, 50, 50, 0, 0 + j, black)
		    drawfilloval (450, 450, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 5 then
		for j : 1 .. 360
		    drawfillarc (300, 300, 50, 50, 0, 0 + j, black)
		    drawfilloval (300, 300, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 6 then
		for j : 1 .. 360
		    drawfillarc (150, 150, 50, 50, 0, 0 + j, black)
		    drawfilloval (150, 150, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 7 then
		for j : 1 .. 360
		    drawfillarc (150, 300, 50, 50, 0, 0 + j, black)
		    drawfilloval (150, 300, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 8 then
		for j : 1 .. 360
		    drawfillarc (450, 150, 50, 50, 0, 0 + j, black)
		    drawfilloval (450, 150, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 9 then
		for j : 1 .. 360
		    drawfillarc (300, 450, 50, 50, 0, 0 + j, black)
		    drawfilloval (300, 450, 40, 40, 30)
		    delay (1)
		end for

	    end if
	elsif player not= "c" and X1 = true or player = "c" and O1 = true then
	    %Draws X's
	    if move = 1 then
		for h : 1 .. 100
		    drawfilloval (250 + h, 200 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (350 - i, 200 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 2 then
		for h : 1 .. 100
		    drawfilloval (100 + h, 500 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (200 - i, 500 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 3 then
		for h : 1 .. 100
		    drawfilloval (400 + h, 350 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (500 - i, 350 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 4 then
		for h : 1 .. 100
		    drawfilloval (400 + h, 500 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (500 - i, 500 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 5 then
		for h : 1 .. 100
		    drawfilloval (250 + h, 350 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (350 - i, 350 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 6 then
		for h : 1 .. 100
		    drawfilloval (100 + h, 200 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (200 - i, 200 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 7 then
		for h : 1 .. 100
		    drawfilloval (100 + h, 350 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (200 - i, 350 - i, 5, 5, brightred)
		    delay (1)
		end for
	    elsif move = 8 then
		for h : 1 .. 100
		    drawfilloval (400 + h, 200 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (500 - i, 200 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 9 then
		for h : 1 .. 100
		    drawfilloval (250 + h, 500 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (350 - i, 500 - i, 5, 5, brightred)
		    delay (1)
		end for
	    end if
	end if
	%Same as above, but for a two player game
    elsif TwoPlayer = true then
	if O1st = true and player = "u1" or X1st = true and player = "u2" then
	    %Draws O's
	    if move = 1 then
		for j : 1 .. 360
		    drawfillarc (300, 150, 50, 50, 0, 0 + j, black)
		    drawfilloval (300, 150, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 2 then
		for j : 1 .. 360
		    drawfillarc (150, 450, 50, 50, 0, 0 + j, black)
		    drawfilloval (150, 450, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 3 then
		for j : 1 .. 360
		    drawfillarc (450, 300, 50, 50, 0, 0 + j, black)
		    drawfilloval (450, 300, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 4 then
		for j : 1 .. 360
		    drawfillarc (450, 450, 50, 50, 0, 0 + j, black)
		    drawfilloval (450, 450, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 5 then
		for j : 1 .. 360
		    drawfillarc (300, 300, 50, 50, 0, 0 + j, black)
		    drawfilloval (300, 300, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 6 then
		for j : 1 .. 360
		    drawfillarc (150, 150, 50, 50, 0, 0 + j, black)
		    drawfilloval (150, 150, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 7 then
		for j : 1 .. 360
		    drawfillarc (150, 300, 50, 50, 0, 0 + j, black)
		    drawfilloval (150, 300, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 8 then
		for j : 1 .. 360
		    drawfillarc (450, 150, 50, 50, 0, 0 + j, black)
		    drawfilloval (450, 150, 40, 40, 30)
		    delay (1)
		end for

	    elsif move = 9 then
		for j : 1 .. 360
		    drawfillarc (300, 450, 50, 50, 0, 0 + j, black)
		    drawfilloval (300, 450, 40, 40, 30)
		    delay (1)
		end for
	    end if

	elsif X1st = true and player = "u1" or O1st = true and player = "u2" then
	    %Draws X's
	    if move = 1 then
		for h : 1 .. 100
		    drawfilloval (250 + h, 200 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (350 - i, 200 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 2 then
		for h : 1 .. 100
		    drawfilloval (100 + h, 500 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (200 - i, 500 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 3 then
		for h : 1 .. 100
		    drawfilloval (400 + h, 350 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (500 - i, 350 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 4 then
		for h : 1 .. 100
		    drawfilloval (400 + h, 500 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (500 - i, 500 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 5 then
		for h : 1 .. 100
		    drawfilloval (250 + h, 350 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (350 - i, 350 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 6 then
		for h : 1 .. 100
		    drawfilloval (100 + h, 200 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (200 - i, 200 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 7 then
		for h : 1 .. 100
		    drawfilloval (100 + h, 350 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (200 - i, 350 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 8 then
		for h : 1 .. 100
		    drawfilloval (400 + h, 200 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (500 - i, 200 - i, 5, 5, brightred)
		    delay (1)
		end for

	    elsif move = 9 then
		for h : 1 .. 100
		    drawfilloval (250 + h, 500 - h, 5, 5, brightred)
		    delay (1)
		end for
		for i : 1 .. 100
		    drawfilloval (350 - i, 500 - i, 5, 5, brightred)
		    delay (1)
		end for
	    end if
	end if
    end if

end Plot_Move

% MAIN PROGRAM

loop
    %VARIABLES
    var trans : int
    var again : string (1)     %Only 1st character is accepted
    Initialize
    var user : string := "u"
    var comp : string := "c"
    var user1 : string := "u1"
    var user2 : string := "u2"
    var turn : int

    Draw_board     %Runs procedure declared above

    if OnePlayer = true then
	for i : 1 .. 5
	    turn := i     %var turn becomes for loop var i
	    drawfillbox (0, maxy - 75, maxx, maxy, 30)
	    Font.Draw ("It is your turn.", 500, maxy - 50, font2, black)
	    trans := Get_User_Move     %var trans becomes function result
	    u (i) := trans     %User's for loop var i becomes new trans
	    Plot_Move (user, trans)     %Runs function with the user and trans variables as input
	    if User_Win then
		exit
	    end if
	    if i = 5 then
		cat := cat + 1
		locate (35, 90)
		put cat
	    end if
	    exit when i = 5
	    drawfillbox (400, maxy - 75, maxx, maxy, 30)
	    Font.Draw ("It is now the computer's turn.", 400, maxy - 50, font2, black)
	    randint (delay1, 0, 3000)     %Gets a random number
	    delay (delay1)     %Delays for that number
	    %SAME AS ABOVE
	    trans := Get_Computer_Move (i)
	    c (i) := trans
	    Plot_Move (comp, trans)
	    if Computer_Win then
		exit
	    end if
	    delay (100)
	end for
	%SAME AS ABOVE
    elsif TwoPlayer = true then
	for i : 1 .. 5
	    turn := i
	    drawfillbox (400, maxy - 75, maxx, maxy, 30)
	    Font.Draw ("It is Player 1's turn.", 500, maxy - 50, font2, black)
	    trans := Get_User1_Move
	    u1 (i) := trans
	    Plot_Move (user1, trans)
	    if User1_Win then
		exit
	    end if
	    if i = 5 then
		cat := cat + 1
		locate (35, 90)
		put cat
	    end if
	    exit when i = 5
	    drawfillbox (400, maxy - 75, maxx, maxy, 30)
	    Font.Draw ("It is now Player 2's turn.", 400, maxy - 50, font2, black)
	    trans := Get_User2_Move
	    u2 (i) := trans
	    Plot_Move (user2, trans)
	    if User2_Win then
		exit
	    end if
	    delay (100)
	end for
    end if
    %Once over does following
    drawfillbox (400, maxy - 75, maxx, maxy, 30)
    Font.Draw ("Would you like to play again?", 50, maxy - 50, font2, black)
    locate (3, 35)
    getch (again)     %Gets first caracter, user does not have to press enter
    if again = "y" then     %If yes then finishes loop, goes back to beginning
    elsif again = "n" then     %If no then goes back to original no sequence then back to the beginning
	cls     %........................................................Then clear sceen
	Font.Draw ("If you change your mind, press any key.", 50, maxy - 50, font1, red)     %And write quote
	Input.Pause     %................................................Wait for a key to press
	cls     %........................................................Then clear screen
    else     %Otherwise
	exit     %Exits loop
    end if

end loop
