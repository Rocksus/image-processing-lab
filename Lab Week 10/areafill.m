img = imread('img22gd2.tif');
k1 = connectedNeighbor(a,45,67,1);
imshow(k1);
title('Area Fill with T=1');
figure
k2 = connectedNeighbor(a,45,67,2);
imshow(k2);
title('Area Fill with T=2');
figure
k3 = connectedNeighbor(a,45,67,3);
imshow(k3);
title('Area Fill with T=3');