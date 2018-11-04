function [b,e] = halftoneDither(f,I)
    [N,M] = size(f);
    [DN, DM] = size(I);
    %calculate T
    T = zeros(DN, DM);
    for i=1:DN
        for j=1:DM
            T(i,j) = 255*(I(i,j) - 0.5) /(DN*DM);
        end
    end
    %copy T matrix until as big as f
    while (sum(size(T)-size(f)) < 0)
       T = [T T; T T];
    end
    %crop T matrix to size
    T = T(1:N, 1:M);
    %compute b
    b = uint8(255*(f>T));
    %compute e
    temp=0;
    for i=1:N
        for j=1:M
           temp = temp + (double(f(i,j)) - double(b(i,j)))^2;
        end
    end
    e = temp/(N*M);
    
    imshow(b);
    title('Halftone Dithering');
end