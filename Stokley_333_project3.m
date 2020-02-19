clear all; close all; clc;
tmo = 35;
tmi = 15;
%****** Values for mean temp assumed at 300K****
u = 855*10^-6;
cp = 4179;
ki = 613*10^-3;
pr = 5.83;
m = 0.2;
x = zeros(21, 1); y = zeros(21, 1);
x1 = zeros(21, 1); y1 = zeros(21, 1);
x2 = zeros(21, 1); y2 = zeros(21, 1);
b = 1; %to change graphs for each temp
for tinf = 250:125:500 %go through entire code for each air temp
    if tinf == 250 %Values for tinf = 250C
    vo = 39.4*10^-6;
    ko = 41.3*10^-3;
    pro = .716;
    elseif tinf == 375 %Values for tinf = 375C
    vo = 46.3*10^-6;
    ko = 44.1*10^-3;
    pro = .726;
    elseif tinf == 500 %Values for tinf = 500C
    vo = 53.59*10^-6;
    ko = 47.3*10^-3;
    pro = .729;
    end
for d = 0.02:0.01:0.04 %this loop will find the length at every velocity from 20 to 40 for each diameter
    Re = 4*m/(pi*d*u);
    hi = ki/d*(.023*Re^.8*5.83^.4);
    n = 1; %increase x and y in matrix through each loop
    for v = 20:1:40
        Reo = v*d/vo;
        Nuo = 0.3 + (.62*Reo^.5*pro^.333)/(1+(.4/pro)^.667)^.25*(1+(Reo/282000)^.625)^.8;
        ho = Nuo*ko/d;
        U = 1/(1/hi + 1/ho);
        L = -log((tinf-tmo)/(tinf-tmi))*m*cp/(pi*d*U);
        if d == 0.02 %this statement will decide what values of L and v to insert based off of diameter
            x(n,1) = v;
            y(n,1) = L;
        elseif d == 0.03
            x1(n,1) = v;
            y1(n,1) = L;
        elseif d == 0.04
            x2(n,1) = v;
            y2(n,1) = L;
        end
        n = n+1;
    end
        n = 1;
end
    figure(b);
    plot(x(:, 1), y(:, 1),'R');
    hold on
    plot(x1(:, 1), y1(:, 1),'B');
    hold on
    plot(x2(:, 1), y2(:, 1),'G');
    hold on
    xlim([20 40])
    ylim([3 6])
    if tinf == 250
    title('Air Temp = 250C');
    elseif tinf == 375
        title('Air Temp = 375C');
    elseif tinf == 500
        title('Air Temp = 500C');
    end
    ylabel('Length (m)');
    xlabel('Velocity(m/s)');
    legend('d=20mm','d=30mm', 'd=40mm');
    grid on;
    b = b+1;
end