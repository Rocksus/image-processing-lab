function [outImg] = pointTrans(A, T1, T2)
    [rows, cols] = size(A);
    outImg = zeros(rows, cols);
    x = reshape(A, 1, rows*cols);
    figure, hist(x, 0:255);
    title('Original Image HistogrB am');
    xlabel('Gray Intensity Levels');
    ylabel('Frequency');
    x = double(x);
    for i=1:size(x,2)
        if (x(i)<T1)
           x(i)=0;
        elseif (x(i)>T2)
            x(i)=255;
        else
            x(i) = round((x(i)-T1)*255/(T2-T1));
        end
    end
    x=uint8(x);
    figure, imshow(A);
    title('Original Image');
    outImg = reshape(x, rows, cols);
    figure, hist(x, 0:255);
    title('Histogram After Equalization');
    xlabel('Gray Intensity Levels');
    ylabel('Frequency');
    figure, imshow(outImg);
    title('Image After Equalization');
end