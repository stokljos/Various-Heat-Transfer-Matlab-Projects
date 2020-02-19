clear all; close all; clc;
N = 8; %number of fins
t = .003; % fin thickness
hi = 5000; %Convection heat transfer coefficient for water
ho = 200; %Convection heat transfer coefficient for air
k = 20; %Thermal conductivity
r1 = .013; % inner radius
r2= .016; % outer radius
r3 = .040; % tube radius
Ti = 90; % water temperature
To = 25; % tube temperature
Lc = r3-r2; %length of fins
Af = 2*(r3-r2); %each fin surface area

while (N*t)<= .05 %To determine how number of fins affect heat rate
    nf = tanh(sqrt(2*ho/(k*t))*Lc)/(sqrt(2*ho/(k*t))*Lc); %Fin efficiency 
    Ab = 2*pi*r2-N*t; %prime surface
    At = N*Af+Ab; %toStal surface area
    no = 1-N*Af/(At)*(1-nf); %overall surface efficiency
    Rconv = 1/(hi*pi*r1) ; %Convective resistance for water
    Rcond = log(r2/r1)/(2*pi*k); %conduction resistance to the tubes
    Rf = 1/(no*ho*At); %resistance in the fins
    q = (Ti-To)/(Rconv+Rcond+Rf); %heat rate per unit length
    figure(1);
    plot(N,q,'*R');
    hold on
    title('Number of Fins vs Heat Rate');
    xlabel('Number of Fins');
    ylabel('Heat Rate (W/m)');
    N = N+1;
end
N = 8;
while (N*t)<= .05 %To determine how the thickness affect heat rate
    nf = tanh(sqrt(2*ho/(k*t))*Lc)/(sqrt(2*ho/(k*t))*Lc);
    Ab = 2*pi*r2-N*t; %prime surface
    At = N*Af+Ab; %toStal surface area
    no = 1-N*Af/(At)*(1-nf); %surface efficiency
    Rconv = 1/(hi*pi*r1) ; %Convective resistance for water
    Rcond = log(r2/r1)/(2*pi*k); %conduction resistance to the tubes
    Rf = 1/(no*ho*At); %resistance in the fins
    q = (Ti-To)/(Rconv+Rcond+Rf); %heat rate per unit length
    figure(2);
    plot(t,q,'*R');
    hold on
    title('Thickness of Fins vs Heat Rate');
    xlabel('Thickness of Fins (m)');
    ylabel('Heat Rate (W/m)');
    t = t + .0005;
end

