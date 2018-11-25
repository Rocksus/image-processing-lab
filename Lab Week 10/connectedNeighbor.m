function [c]=connectedNeighbor(img,x,y,T)
  c=zeros(size(img));
  img = double(img);
  c(x,y) = 1;
  [rows,cols] = size(img);
  c = connectedSet(c,img(x,y),img, x-1, y, T,rows,cols);
  c = connectedSet(c,img(x,y),img, x+1, y, T,rows,cols);
  c = connectedSet(c,img(x,y),img, x, y+1, T,rows,cols);
  c = connectedSet(c,img(x,y),img, x, y-1, T,rows,cols);
  c = uint8(c)*255;
  c = 255-c; %invert, showing connected as black and rest as white.
end
