% Backend of the wordle game

clear
clc

Database = readcell("5LetterWordDatabase_new.xlsx");
Words=Database(:,1);
Position = randi([1,3103],1);
Word = lower(Words{Position});

fprintf("The word is %s.\n",Word); %To check the code

function output = check5letter(guess)
    if length(guess)==5
        output = true;
    else
        output=false;
        disp("Word is not 5 letters!");
    end
end

function output = checkwordexist(Words,guess)
    find_guess = find(strcmpi((Words(:,1)),guess));
    if ~isempty(find_guess)
        output = true;
    else
        output=false;
        disp("Word does not exist!");
    end
end

function output = checkifguessed(guess_counter,guess)
    find_guess = strcmpi(guess_counter,guess);
    if find_guess==0
        output = true;
    else
        output=false;
        disp("Word already guessed!");
    end
end

function checkcolour(guess,Word)
    for j = 1:5
    output=[];
    if guess(j)==Word(j)
        output=[output,'green'];
    elseif contains(Word,guess(j))
        output=[output,'yellow'];
    else
        output=[output,'grey'];
    end
    disp(output);
    end
end

guess_counter=[];

count = 1;
while count<=6
    guess = input("Enter guess: ","s");
    if check5letter(guess) && checkwordexist(Words,guess) && checkifguessed(guess_counter,guess)
            if guess == Word
                disp("Word guessed correctly!");
                break
            else
                checkcolour(guess,Word);
                count = count + 1;
            end
    guess_counter=[guess_counter,guess];
    end
end
fprintf("The word is %s.\n",Word);