close all

img = imread('img03y.tif');
imshow(img), title('Original Image');
img = double(img);

Qtables %load up quant and zig

%Define functions
fn1 = @(x) round(dct2(x.data, [8,8])./(Quant*0.25));
fn2 = @(x) round(dct2(x.data, [8,8])./(Quant*1));
fn3 = @(x) round(dct2(x.data, [8,8])./(Quant*4));
ifn1 = @(x) round(idct2(x.data, [8,8]).*(Quant*0.25));
ifn2 = @(x) round(idct2(x.data, [8,8]).*(Quant*1));
ifn3 = @(x) round(idct2(x.data, [8,8]).*(Quant*4));

figure
dct_blk = blockproc(img, [8,8], fn1);
idct_blk = blockproc(dct_blk, [8,8], ifn1);
fid = fopen('img03y025.dq', 'w');
fwrite(fid, dct_blk, 'integer*2');
subplot(1,3,1), imshow(uint8(dct_blk)), title('DCT Transform with Gamma=0.25');
dct_blk = fread(fid);
subplot(1,3,2), imshow(uint8(idct_blk)), title('Inverse DCT Transfrom with Gamma=0.25');
subplot(1,3,3), imshow(uint8(abs(img-idct_blk))), title('Difference');

figure
dct_blk = blockproc(img, [8,8], fn2);
idct_blk = blockproc(dct_blk, [8,8], ifn2);
fid1 = fopen('img03y1.dq', 'w');
fwrite(fid1, dct_blk, 'integer*2');
subplot(1,3,1), imshow(uint8(dct_blk)), title('DCT Transform with Gamma=1');
dct_blk = fread(fid1);
subplot(1,3,2), imshow(uint8(idct_blk)), title('Inverse DCT Transfrom with Gamma=1');
subplot(1,3,3), imshow(uint8(abs(img-idct_blk))), title('Difference');

figure
dct_blk = blockproc(img, [8,8], fn3);
idct_blk = blockproc(dct_blk, [8,8], ifn3);
fid2 = fopen('img03y4.dq', 'w');
fwrite(fid2, dct_blk, 'integer*2');
subplot(1,3,1), imshow(uint8(dct_blk)), title('DCT Transform with Gamma=4');
dct_blk = fread(fid2);
subplot(1,3,2), imshow(uint8(idct_blk)), title('Inverse DCT Transfrom with Gamma=4');
subplot(1,3,3), imshow(uint8(abs(img-idct_blk))), title('Difference');
