function [Word_num,board]=Game_Wordle_DisplayWord(Word,actual_word,output,count,Word_num,board)
    Word_num=CreateWordNum(Word,count,Word_num);
    %Size of each sprite. 
    sSize = 16;
    %Zoom factor of the sprites.
    zFactor = 10; 
    %Default background of the board
    BGC = [80 80 80]; 
    %To create the boards and display sprites using the Simple Game Engine.
    example_scene = simpleGameEngine("finalpixelframe.png", sSize, sSize, zFactor, BGC);

    %The keyboard with the used words
    keyboard_used=[];

    % checkcolour function to assign the value of the background color according to the placement and accuracy of the guessed word compared to the chosen word
    [keyboard_used,board]=checkcolour(Word,actual_word,keyboard_used,count,board);
    
    %Board with the colors for the previous words and the rest of the board filled with empty sprites
    disp_board=board;
    %Array of letter numbers with the letters for the previous words and the rest of the board filled with empty sprites
    disp_Word_num=Word_num;

    %fill the rest of the board with empty sprites
    for i=count+1:6
        disp_board=[disp_board;[30,30,30,30,30]];
    end
    for i=count+1:6
        disp_Word_num=[disp_Word_num;[27,27,27,27,27]];
    end
    %display the board
    drawScene(example_scene, disp_board, disp_Word_num);
    title("Wordle");
end

function Word_num=CreateWordNum(Word,count,Word_num)
%New array with the new numbers for the respective letter in the word 
    new_Word_num=[];
    %Use the excel file (letter_number.xlsx) for letter to position on image. 
    Database_display = readcell("letter_number.xlsx");
    %The matrix of the excel file. 
    Words_display=Database_display(:,1:2);
    for i=1:5
        % letter in each word 
        letter = Word(i);
        % index value of the letter in the image
        index = find(strcmpi(Words_display(:,1),Word(i)));
        new_Word_num=[new_Word_num,index];
    end
    Word_num = [Word_num; new_Word_num];
end

function [keyboard_used,new_output]=checkcolour(guess,Word,keyboard_used,count,new_output)
    %the previous outputs arrays of numbers of the previously guessed 
    old_output=[];
    for j = 1:5
    if guess(j)==Word(j)
        old_output=[old_output,28];
    elseif contains(Word,guess(j))
        old_output=[old_output,29];
    else
        old_output=[old_output,30];
        find_guess = find(strcmpi(keyboard_used,guess(j)));
        disp(find_guess);
        if ~isempty(find_guess)
            keyboard_used=[keyboard_used,guess(j)];
        end
    end
    end
    %the new output array with the numbers for the new guessed word 
        new_output = [new_output; old_output];
end
