k = imread('lena512color.tiff');
R = k(:,:,1);
G = k(:,:,2);
B = k(:,:,3);

subplot(2,2,1); imshow(k); title("Original Image");
subplot(2,2,2); imshow(R); title("Red Channel");
subplot(2,2,3); imshow(G); title("Green Channel");
subplot(2,2,4); imshow(B); title("Blue Channel");

load('ycbcr.mat'); %obtains h and ycbcr
Y = ycbcr(:,:,1);
Cb = ycbcr(:,:,2);
Cr = ycbcr(:,:,3);
Y = filter2(h, Y);

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
%Plots RGB of filtered Y, and normal Cb, and Cr
subplot(2,2,1), imshow(Rn), title('Red Channel');
subplot(2,2,2), imshow(Gn), title('Green Channel');
subplot(2,2,3), imshow(Bn), title('Blue Channel');
subplot(2,2,4), imshow(newImg), title('Combined Image');

Cb = filter2(h, Cb);
Cr = filter2(h, Cr);

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
%Plots RGB of filtered Y, filtered Cb, and filtered Cr
subplot(2,2,1), imshow(Rn), title('Red Channel');
subplot(2,2,2), imshow(Gn), title('Green Channel');
subplot(2,2,3), imshow(Bn), title('Blue Channel');
subplot(2,2,4), imshow(newImg), title('Combined Image');
