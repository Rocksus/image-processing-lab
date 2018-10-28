function [outImg] = unsharp(filt, orgImg, alpha, beta)
    orgImg = double(orgImg);
    Y=filter2(filt,orgImg);
    outImg = alpha*orgImg - beta*Y;
    outImg = uint8(outImg);
end
