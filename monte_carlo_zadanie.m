close all;
clear all;

clc
clearvars

format long
rng('default');

x_max = 3;
x_min = -3;
[X, Y]=meshgrid(-3:.1:3);
e = exp(1);
Z=-20*exp(-0.25*sqrt((1/2).*(X.^2+Y.^2)))-exp((1/2).*(cos(2*pi*X)+cos(2*pi*Y)))+20+e;

% figure; surf(X, Y, Z);
% shading interp 
% camlight
% material dull


fun =@(x) -20*exp(-0.25*sqrt((1/2).*(x(1).^2+x(2).^2)))-exp((1/2).*(cos(2*pi*x(1))+cos(2*pi*x(2))))+20+e;

n=10;
xpoints=x_min+rand(1,n)*(x_max-x_min);
ypoints=xpoints;
zpoints=fun(xpoints);

[M, I] = min(ypoints);
x0 = [0.5, 0.5];
errx=abs(x0-xpoints(I));
errz=abs(fun(x0)-xpoints(I));

[x,fval,exitflag,output]=fminsearch(fun,x0);
p = plot3(x(1),x(2), fval,'-+','Color','r','MarkerSize',10);
%p2 = plot3(xpoints,xpoints,zpoints,'r*','MarkerSize',10)

figure(1);
hold on
grid on
mesh(X,Y,Z);
xlabel('X');
ylabel('Y');
zlabel('Z');

