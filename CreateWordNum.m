function Word_num=CreateWordNum(Word)
    Database_display = readcell("letter_number.xlsx");
    Words_display=Database_display(:,1:2);
    Word_num=[];
    for i=1:5
        letter = Word(i);
        index = find(strcmpi(Words_display(:,1),Word(i)));
        Word_num=[Word_num,index];
    end
end