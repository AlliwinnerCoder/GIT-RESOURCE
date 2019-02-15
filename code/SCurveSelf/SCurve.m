clear;
clc;
close all;
Amax = 100;
Jmax = 1000;
Vmax = 200;
Vs = 10;
Sinput = 400;
%常量计算%
T1 = Amax / Jmax;
T2 = (Vmax - Vs - Amax * T1) / Amax;
if T2 < 0
    disp("Amax is too large,Give little Amax and rerun");
end
%边界计算%
Smin1 = 4 * Vs * T1 + 2 * Amax * T1^2;
Smin2 = 4 * Vs * T1 + 2 * Vs * T2 + 3 * Amax * T1 * T2 + 2 * Amax * T1^2 + Amax * T2;
%情况一 位移最大%
if Sinput > Smin2
    %J的图像%
    figure;
    ylim([-2000 2000]); 
    Tplot1 = linspace(0,T1,T1/0.001);
    Jplot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Jplot1(i) = Jmax;
    end
    plot(Tplot1,Jplot1,'r');
    hold on;
    
    Tplot2 = linspace(T1,T1+T2,T2/0.001);
    Jplot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Jplot2(i) = 0;
    end
    
    T3 = T1;
    Tplot3 = linspace(T1+T2,T1+T2+T3,T3/0.001);
    Jplot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Jplot3(i) = -Jmax;
    end
    plot(Tplot3,Jplot3,'r');
    hold on;
    
    T4 = (Sinput - Smin2) / Vmax;
    Tplot4 = linspace(T1+T2+T3,T1+T2+T3+T4,T4/0.001);
    Jplot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Jplot4(i) = 0;
    end
    
    T5 = T1;
    Tplot5 = linspace(T1+T2+T3+T4,T1+T2+T3+T4+T5,T5/0.001);
    Jplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Jplot5(i) = Jmax;
    end
    plot(Tplot5,Jplot5,'r');
    hold on
    
    T6 = T2;
    Tplot6 = linspace(T1+T2+T3+T4+T5,T1+T2+T3+T4+T5+T6,T6/0.001);
    Jplot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Jplot6(i) = 0;
    end
    
    T7 = T1;
    Tplot7 = linspace(T1+T2+T3+T4+T5+T6,T1+T2+T3+T4+T5+T6+T7,T7/0.001);
    Jplot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Jplot7(i) = -Jmax;
    end
    plot(Tplot7,Jplot7,'r');
    hold on;    
end
%%




