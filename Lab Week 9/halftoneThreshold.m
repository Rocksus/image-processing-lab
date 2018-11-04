function [b,e] = halftoneThreshold(f,T)
    [N, M] = size(f);
    b = zeros(N,M);
    for i=1:N
       for j=1:M
           if (f(i,j) > T)
              b(i,j) = 255;
           else
               b(i,j) = 0;
           end
       end
    end
    temp=0;
    for i=1:N
        for j=1:M
           temp = temp + (double(f(i,j)) - double(b(i,j)))^2;
        end
    end
    e = temp/(N*M);
    
    imshow(b);
    title(['Halftone Thresholding with T=' num2str(T)]);
end