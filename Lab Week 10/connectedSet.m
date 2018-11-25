function [c] = connectedSet(c_,prevPointVal,img,x,y,T, row, col)
  c = c_;
  if (x>0 && y>0 && x<=row && y<=col)
    %continue
    if(c(x,y)~=1)
      if(abs(prevPointVal-img(x,y))<=T)
        %continue
        c(x,y) = 1;
        c = connectedSet(c,img(x,y),img, x-1, y, T, row, col);
        c = connectedSet(c,img(x,y),img, x+1, y, T, row, col);
        c = connectedSet(c,img(x,y),img, x, y+1, T, row, col);
        c = connectedSet(c,img(x,y),img, x, y-1, T, row, col);
      end
    end
  end
end