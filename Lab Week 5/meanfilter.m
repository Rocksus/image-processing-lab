function [outImg] = meanfilter(A)
    [rows,cols] = size(A);
    outImg = zeros(rows, cols);
    A=double(A);
    for i=1:rows
       for j=1:cols
           %set borders
           rmn=max(1, i-1);
           rmx=min(rows, i+1);
           cmn=max(1, j-1);
           cmx=min(cols, j+1);
           %take sampling from image
           tmp=A(rmn:rmx, cmn:cmx);
           %apply to outImg
           outImg(i,j)=mean(tmp(:));
       end
    end
    A = uint8(A);
    outImg = uint8(outImg);
    figure;
    set(gcf, 'Position', get(0,'Screensize')/2);
    subplot(121), imshow(A), title('Original');
    subplot(122), imshow(outImg), title('Mean Filter Results');
end