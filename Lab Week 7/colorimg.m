k = load('data.mat');
lambda = [400:10:700];

plot(lambda, k.x);
hold
plot(lambda, k.y);
plot(lambda, k.z);
legend("X", "Y", "Z");
title("XYZ Value");
xlabel("Wavelength (nm)");
ylabel("CIE");
L = [];
M = [];
S = [];

for i=1:31
  A = [k.x(i);k.y(i);k.z(i)];
  Ainv = [0.2430 0.8560 -0.0440; -0.3910 1.1650 0.0870; 0.0100 -0.0080 0.5630];
  B = Ainv*A;
  L(i) = B(1);
  M(i) = B(2);
  S(i) = B(3);
end

figure
plot(lambda, L);
hold
plot(lambda, M);
plot(lambda, S);
legend("L", "M", "S");
title("LMS Value");
xlabel("Wavelength");
ylabel("CIE");

figure
plot(lambda, k.x);
hold
plot(lambda, k.y);
plot(lambda, k.z);
plot(lambda, L);
plot(lambda, M);
plot(lambda, S);
legend("X", "Y", "Z", "L", "M", "S");
xlabel("Wavelength");
ylabel("CIE");
title("XYZ and LMS Values");
