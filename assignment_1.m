%%
% 1. f(x,y) = 4x(1-x).
fxy = @(x,y) 4.*x.*(1-x);
N = 5;
[x,y] = meshgrid(linspace(0,1,N), linspace(0,1,N));
vals = fxy(x,y)*15;
disp(vals);
figure;
image(vals);
colormap(gray(15));

%%
% 4.
u = [1 -3; 4 1];
v = (1/2)*[1 1; -1 -1];
w = (1/2)*[1 -1; 1 -1];

uc = u(:);
nu = (uc'*uc)^(1/2);
vc = v(:);
nv = (vc'*vc)^(1/2);
wc = w(:);
nw = (wc'*wc)^(1/2);
disp(['The norm of u is: ',num2str(nu)])
disp(['The norm of v is: ',num2str(nv)])
disp(['The norm of w is: ',num2str(nw)])
disp(['u . v = ', num2str(nu*nv)])
disp(['u . w = ', num2str(nu*nw)])
disp(['v . w = ', num2str(nv*nw)])
