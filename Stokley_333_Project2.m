clear all; close all; clc;
L = 0.007; %Thickness
p = 2800; %Density
c = 900; %lumped capacitance
k = 180; %Thermal Conductivity
e = 0.8; %emissivity
o = 5.67*10^-8; %Stefan-Boltzmann Constant
Tsur = 25+273; %in Kelvin and surrounding temperature
As = 0.04; %Area of Surface
qh = 1.25*10^4; %Heat flux
h = 10; %Convection Coefficient
T = 135+273; %in Kelvin and final temperature
v = L*As; %Volume
%*****Find Biot Number for Convection and Radiation*****
Bi = h*L/k;
hr =e*o*(T+Tsur)*(T^2+Tsur^2); %Radiation coeffiecent
Bir = hr*L/k;
if Bi<1 && Bir <1
    fprintf("Biot Numbers are less than 1 so okay to use lumped Capacitance \n");    
    %*****Calculate Time to get to T*****
    t = (p*v*c*(T-Tsur))/(As*(qh-h*(T-Tsur)-e*o*(T^4-Tsur^4)));
    fprintf('It will take %.2f seconds required to get the plate to 135 degrees Celsius \n', t);
    for T1 = Tsur:1:T
        t = (p*v*c*(T1-Tsur))/(As*(qh-h*(T1-Tsur)-e*o*(T1^4-Tsur^4)));
        figure(1);
        plot(t,T1,'*R');
        hold on
        title('Time vs Temperature of Surface');
        xlabel('Time(seconds)');
        ylabel('Temperature(K)');
    end
    
else
        fprintf("Biot Numbers are greater than 1 so not okay to use lumped Capacitance \n");
end 
