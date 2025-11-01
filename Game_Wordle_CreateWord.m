%This is to generate random word
function [Word,guess_counter,keyboard_used,Words]=Game_Wordle_CreateWord()
    %The excel document (5LetterWordDatabase_new.xlsx) with 5-letter words.  
    Database = readcell("5LetterWordDatabase_new.xlsx");
    %Matrix of the words database.
    Words=Database(:,1);
    Position = randi([1,3103],1);
    Word = lower(Words{Position});
    %To store the previous guesses. 
    guess_counter=[];
    %The keyboard with the used words. 
    keyboard_used=[];

    %fprintf("The word is %s.\n",Word); %To check the code
end