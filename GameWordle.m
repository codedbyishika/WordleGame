%
%
%

clear
clc

Database = readcell("5LetterWordDatabase_new.xlsx");
Words=Database(:,1);
Position = randi([1,663],1);
Word = lower(Words{Position});

fprintf("The word is %s.\n",Word);

Database_display = readcell("letter_number.xlsx");
Words_display=Database_display(:,1:2);

Word_num=[];

for i=1:5
    letter = Word(i);
    index = find(strcmpi(Words_display(:,1),Word(i)));
    index=index+1;
    Word_num=[Word_num,index];
end


sSize = 84;
zFactor = 50; 
BGC = [80 80 80]; 
example_scene = simpleGameEngine("pixil-greyALPHABET.png", sSize, sSize, zFactor, BGC);

%Cover Page
cover_scene = simpleGameEngine("pixil-COVERPAGE.png", 200, 300, zFactor, BGC);

% Board is empty sprites
tmp=[1,1,1,1,1];
board=[tmp;tmp;tmp;tmp;tmp;tmp];
drawScene(example_scene, board);

%Displaying word
drawScene(example_scene, board);
if getKeyboardInput(example_scene)
    drawScene(example_scene, Word_num);
end
title("Word");

%{
% Random letters are generated for 2nd Word
waitforbuttonpress();
drawScene(example_scene, board);
if getKeyboardInput(example_scene)
    drawScene(example_scene, randi([1,26],1,5));
end
title("Word 2");

% Random letters are generated for 3rd Word
waitforbuttonpress();
drawScene(example_scene, board);
if getKeyboardInput(example_scene)
    drawScene(example_scene, randi([1,26],1,5));
end
title("Word 3");
%}

%{
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

%
%keyboard=[[],[],["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]];

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
%}