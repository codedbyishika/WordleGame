%This is the frontend of the Wordle game

clear
clc
close all

Game_Wordle_CoverPage()

% A while loop checks for this variable if the user wishes to replay the game. The default is set to 0 to continue to play the game and 1 to exit the game. 
game_counter=0;
while game_counter==0

    close all
    disp("Welcome to Wordle!");
    disp("You have six chances to guess the secret five-letter word.");
    disp("Type in a word as a guess, and the game tells you which letters are or aren't in the word.");
    disp("The aim is to figure out the secret word with the fewest guesses.");

    [Word,guess_counter,keyboard_used,Words] = Game_Wordle_CreateWord();
    
    %Keeps count of how many times words are guessed. 
    count = 1;
    %This is an array of the numbers associated with the image file (finalpixelframe.png) with the guessed letters generated using an excel file (letter_number) and the function CreateWordNum. The new numbers of the new guessed words are added to this preexisting array. 
    Word_num=[];
    %This is an array of the numbers associated with the image file (finalpixelframe.png) with the background generated using checkcolour function to assign the value of the background color according to the placement and accuracy of the guessed word compared to the chosen word.
    board=[];
    %This is to store the guessed the word
    guess="";
    %The game continues till the count reaches 6 and the word is not guessed.
    while count<=6 && ~strcmpi(guess,Word)
        
        [guess,guess_counter,keyboard_used,output]=Game_Wordle_Backend(Word,guess_counter,keyboard_used,Words);
         %The game continues only if the conditions of not guessed already,
         %is a 5 letter word and is in the word lsit are satisfied as ouput array is left empty in these cases.
        if ~isempty(output)
            % The board and Word_num are modified and the board is
            % displayed.
            [Word_num,board]=Game_Wordle_DisplayWord(guess,Word,output,count,Word_num,board);
            %  Number of guesses are increased
            count = count + 1;
        end
        
    end
    % Displays the final chosen word
    fprintf("The word is %s.\n",Word);
    %If the player wants to play the game again
    play=input("Do you want to play again?\n(Please enter 1 to continue and 0 to exit)");
    if play==0
        game_counter=1;
        disp("Thank you for playing!");
    elseif play==1
        game_counter=0;
    else
        disp("Input is inaccurate!");
    end
end
