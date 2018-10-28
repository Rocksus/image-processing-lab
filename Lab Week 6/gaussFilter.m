function [outArr] = gaussFilter(N, var)
    outArr = zeros(N,N);
    for i=1:N
        for j=1:N
            x=i-ceil(N/2);
            y=j-ceil(N/2);
            outArr(i,j) = exp(-(x^2+y^2)/(2*var^2));
        end
    end
    outArr = outArr / sum(sum(outArr));
end