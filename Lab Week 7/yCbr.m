img = imread('girl.tif');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

subplot(2,2,1), imshow(R), title('Red Channel');
subplot(2,2,2), imshow(G), title('Green Channel');
subplot(2,2,3), imshow(B), title('Blue Channel');
subplot(2,2,4), imshow(img), title('Original Image');

figure
load('ycbcr.mat');
Y = ycbcr(:,:,1);
Cb = ycbcr(:,:,2);
Cr = ycbcr(:,:,3);

subplot(3,1,1), imshow(Y), title('Luminance (Y)');
subplot(3,1,2), imshow(Cb), title('Blue Difference Chroma Components');
subplot(3,1,3), imshow(Cr), title('Red Difference Chroma Components');

[r, c] = size(Y);
Rn = zeros(r,c);
Gn = zeros(r,c);
Bn = zeros(r,c);
for i=1:r
  for j=1:c
    Rn(i,j) = Y(i, j) + 1.4025*(Cr(i, j)-128);
    Gn(i,j) = Y(i, j) - 0.3443*(Cb(i, j)-128)-0.7144 * (Cr(i, j)-128);
    Bn(i,j) = Y(i, j) + 1.7730*(Cb(i, j)-128);
  end
end

Rn = uint8(Rn);
Gn = uint8(Gn);
Bn = uint8(Bn);

newImg = cat(3, Rn, Gn, Bn);
figure
subplot(2,2,1), imshow(Rn), title('Red Channel');
subplot(2,2,2), imshow(Gn), title('Green Channel');
subplot(2,2,3), imshow(Bn), title('Blue Channel');
subplot(2,2,4), imshow(newImg), title('Combined Image');