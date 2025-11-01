%This is the cover page of Wordle game

function Game_Wordle_CoverPage()
%Title: SDP Wordle Game Script
%declaring variables
pixilSizeAlphabet = 84;
pixilSizeGameWidth = 200;
pixilSizeGameHeight = 300;
zoom = 4;
RGBVal = [0,0,0];
graphicOfGrey = simpleGameEngine('pixil-greyALPHABET.png', pixilSizeAlphabet, pixilSizeAlphabet, zoom, RGBVal);
graphicOfGreyandYellow = simpleGameEngine('pixil-grey&yellowALPHABET.png', pixilSizeAlphabet, pixilSizeAlphabet, zoom, RGBVal);
graphicofYellowandGreen = simpleGameEngine('pixil-yellow&greenALPHABET.png', pixilSizeAlphabet, pixilSizeAlphabet, zoom, RGBVal);
graphicofGreen = simpleGameEngine('pixil-greenALPHABET.png', pixilSizeAlphabet, pixilSizeAlphabet, zoom, RGBVal);
graphicofCover = simpleGameEngine('pixil-COVERPAGE.png', pixilSizeGameWidth, pixilSizeGameHeight, zoom, RGBVal);
contents = [1,2,3,4,5; 6,7,8,9,10; 11,12,13,14,15; 16,17,18,19,20; 21,22,23,24,25];
x1 = 68;
y1 = 208;
x2 = 133;
y2 = 231;
set(gcf, 'Pointer', 'arrow');
%the read the image file
I = imread('pixil-COVERPAGE.png');
imshow('pixil-COVERPAGE.png')
I_red = I(:,:,1);
imshow(I_red);
I_green = I(:,:,2);
imshow(I_green);
I_blue = I(:,:,3);
imshow(I_blue);
imwrite(I, 'pixil-COVERPAGE_processed.png');
%[cover, colormap] = imread('cover.tif', 1);
%c2 = imread('cover.tif', 2);
%c3 = imread('cover.tif', 3);
%imshow(c3);
set(gcf, 'Position', [100, 100, 1000, 800]); % Large figure size
imshow('pixil-COVERPAGE_processed.png', 'InitialMagnification', 300); % 300% magnification
axis on; % Show axes
axis([0 pixilSizeGameWidth*2 0 pixilSizeGameHeight*2]); % Double axis limits to zoom
%%imshow(I);
%drawScene(graphicofCover, pixilSizeGameWidth, pixilSizeGameHeight);
hold on;
rectangle('Position', [x1, y1, x2 - x1, y2 - y1], 'EdgeColor', 'b', 'LineWidth', 2); % Highlight the region
axis([0 pixilSizeGameWidth 0 pixilSizeGameHeight]); % Adjust axis limits for your region
hold off;
%to check if the region is clicked
clickedInRegion = false;
while ~clickedInRegion
[x, y, button] = ginput(1);
if x >= x1 && x <= x2 && y >= y1 && y <= y2
clickedInRegion = true;
close;
else
disp('You clicked outside the specified region.');
end
end
end