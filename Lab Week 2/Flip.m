orgImg = imread('yacht.tif');
%to reassign the original image
img = orgImg;
[r, c] = size(img);
savePath = fullfile(strcat(pwd, '\Results'));
if ~exist(savePath, 'dir')
    mkdir(savePath);
end
%showing the original
imshow(orgImg);
title("Original Image");
%horizontally flipping
%iterate through half the rows, but through
%the whole columns.
for i = 1:r/2
    for j = 1:c
        temp = img(i,j);
        img(i,j)=img(r-i+1,j);
        img(r-i+1,j)=temp;
    end
end
figure, imshow(img);
title("Flipped Horizontally");

fullFileName = fullfile(savePath, 'Flipped Horizontally.tif');
imwrite(img, fullFileName);
%reassigning
img = orgImg;
%flipping vertically
%iterate through half the columns
%but all of the rows.
for i = 1:r
    for j = 1:c/2
        temp = img(i,j);
        img(i,j)=img(i,c-j+1);
        img(i,c-j+1)=temp;
    end
end
figure, imshow(img);
title("Flipped Vertically");
fullFileName = fullfile(savePath, 'Flipped Vertically.tif');
imwrite(img, fullFileName);
img = orgImg;
for i = 1:r
    for j=1:c
        img(i,j) = 255-img(i,j);
    end
end
figure, imshow(img);
title("Negative");
fullFileName = fullfile(savePath, 'Negative.tif');
imwrite(img, fullFileName);
img = orgImg;
for i = 1:r
    for j=1:c
        img(i,j) = img(i,j)*0.5;
    end
end
figure, imshow(img);
title("Multiplied 0.5");
fullFileName = fullfile(savePath, 'Multiply 0.5.tif');
imwrite(img, fullFileName);
img = orgImg;
for i = 1:r
    for j=1:c
        img(i,j) = img(i,j)*1.5;
    end
end
figure, imshow(img);
title("Multiplied 1.5");
fullFileName = fullfile(savePath, 'Multiply 1.5.tif');
imwrite(img, fullFileName);