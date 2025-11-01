% Backend of the wordle game

function [guess,guess_counter,keyboard_used,output]=Game_Wordle_Backend(Word,guess_counter,keyboard_used,Words)
        %the guessed word from user
        guess = input("Enter guess: ","s");
        if check5letter(guess) && checkwordexist(Words,guess) && checkifguessed(guess_counter,guess)
                if guess == Word
                    disp("Word guessed correctly!");
                    %background color for the board
                    output=[28 28 28 28 28];
                    return
                else
                    [keyboard_used,output]=checkcolour(guess,Word,keyboard_used);
                end
        else
            output = [];
        % to keep track of the words already guessed by the user 
        guess_counter=[guess_counter,guess];
        end
end
%checks if the word is of 5 letters
function output = check5letter(guess)
    if length(guess)==5
        output = true;
    else
        output=false;
        disp("Word is not 5 letters!");
    end
end
%checks if the word already exists
function output = checkwordexist(Words,guess)
    find_guess = find(strcmpi((Words(:,1)),guess));
    if ~isempty(find_guess)
        output = true;
    else
        output=false;
        disp("Word does not exist!");
    end
end
%check if the word is already guessed
function output = checkifguessed(guess_counter,guess)
%check if the guessed word and chosen word are the same
    find_guess = strcmpi(guess_counter,guess);
    if find_guess==0
        output = true;
    else
        output=false;
        disp("Word already guessed!");
    end
end
%The keyboard with the used words
%check the colour for the letters in the word
function [keyboard_used,output]=checkcolour(guess,Word,keyboard_used)
    output=[];
    for j = 1:5
    if guess(j)==Word(j)
        output=[output,28];
    elseif contains(Word,guess(j))
        output=[output,29];
    else
        output=[output,30];
        find_guess = find(strcmpi(keyboard_used,guess(j)));
        if ~isempty(find_guess)
            keyboard_used=[keyboard_used,guess(j)];
        end
    end
    end
end
