function [] = confirm(A)
t = 1;
sz = size(A.x);
x = zeros(sz(2));
y = zeros(sz(2));
z = zeros(sz(2));
for i=1:sz(2)
 x(i) = A.x(i)/(A.x(i) + A.y(i) + A.z(i));
 y(i) = A.y(i)/(A.x(i) + A.y(i) + A.z(i));
 z(i) = A.z(i)/(A.x(i) + A.y(i) + A.z(i));
 if round(x(i)+y(i)+z(i)) ~= 1
   t=0;
 end
end
if t == 1
  disp("ALL IS ONE");
else
  disp("INVALID");
end

plot(x,y);
axis([0 1 0 1]);
xlabel("x values");
ylabel("y values");

R709 = [0.640 0.330 0.030];
G709 = [0.300 0.600 0.100];
B709 = [0.150 0.060 0.790];
hold
plot(R709(1), R709(2), 'r*','Linewidth', 2);
plot(G709(1), G709(2), 'g*','Linewidth', 2);
plot(B709(1), B709(2), 'b*','Linewidth', 2);
plot(0.333,0.333,'k*', 'LineWidth', 2);
line([R709(1),G709(1)], [R709(2),G709(2)])
line([G709(1),B709(1)], [G709(2),B709(2)])
line([B709(1),R709(1)], [B709(2),R709(2)])

legend("x-y values", "R709", "G709", "B709", "Equal Energy White Point");
title("Spectrum Locus");
xlabel("x Axis");
ylabel("y Axis");
end
