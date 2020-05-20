clear;
clc

A = load('2010000427.csv');

lat = A(:,1);
lon = A(:,2);
rssi = A(:,3);

X = linspace(min(lon),max(lon),25); 
Y = linspace(min(lat),max(lat),25); 
[xq, yq] = meshgrid(X,Y); 
zq = griddata(lon,lat,rssi,xq,yq); 
plot3(lon,lat,rssi,'k.')
hold on
mesh(xq,yq,zq)
xlabel('lon')
ylabel('lat')
title('Scattered Interpolant');
hold off

%polynomial interpolation x&y = 4th degree
%surffit = fit([lon,lat],rssi,'poly44','normalize','on');
%plot(surffit,[lon,lat],rssi);
