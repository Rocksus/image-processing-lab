function [outImg] = gammaCorr(origImg, gmval)
origImg = double(origImg);
[rows, cols] = size(origImg);

%power law transformation
outImg = abs((1*origImg).^gmval);
maxn=max(outImg(:));
minm=min(outImg(:));

for i=1:rows
   for j=1:cols
      outImg(i,j) = (255*outImg(i,j))/(maxn-minm);
   end
end
outImg = uint8(outImg);
end