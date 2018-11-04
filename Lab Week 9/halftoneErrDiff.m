function [b,e] = halftoneErrDiff(f,T)
    [N,M] = size(f);
    oldf = f;
    b = zeros(N,M);
    %using the pseudocode from the wikipedia
    for j=1:M
        for i=1:N
            oldpixel = f(i,j);
            newpixel = 255*(oldpixel>T);
            f(i,j) = newpixel;
            quantErr = oldpixel-newpixel;
            %using provided filter
            if(i<N)
                f(i+1,j) = f(i+1,j) + (quantErr*7/16);
            elseif(i>0 && j<M)
                f(i-1,j+1) = f(i-1,j+1) + (quantErr*3/16);
            elseif(j<M)
                f(i,j+1) = f(i,j+1) + (quantErr*5/16);
            elseif(i<N && j<M)
            f(i+1,j+1) = f(i+1,j+1) + (quantErr*1/16);
            end
            
            
        end 
    end
    b = uint8(f);
    temp=0;
    for i=1:N
        for j=1:M
           temp = temp + (double(oldf(i,j)) - double(b(i,j)))^2;
        end
    end
    e = temp/(N*M);
    
    imshow(b);
    title(['Halftone Error Diffusion with T=' num2str(T)]);
end