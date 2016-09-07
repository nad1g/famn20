%%
% 1. f(x,y) = 4x(1-x).
fxy = @(x,y) 4.*x.*(1-x);
N = 5;
[x,y] = meshgrid(linspace(0,1,N), linspace(0,1,N));
vals = fxy(x,y);
disp(vals);
figure;
image(vals*255);
colormap(gray(255));

%%
