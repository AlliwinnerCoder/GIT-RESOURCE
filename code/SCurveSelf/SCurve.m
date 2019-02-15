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
    %---------------------------------T1---------------------------------------------%
    %J的图像 T1% 
    ThetaT1 = 0;
    Tplot1 = linspace(0,T1,T1/0.001);
    Jplot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Jplot1(i) = Jmax;
    end
    figure(1);
    plot(Tplot1,Jplot1,'r');
    ylim([-Jmax - Jmax/10 Jmax + Jmax/10]); 
    hold on;
    
    %A的图像 T1%
    Aplot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Aplot1(i) = Jmax * Tplot1(i);
    end
    figure(2);
    plot(Tplot1,Aplot1,'g');
    ylim([-Amax - Amax/10 Amax + Amax/10]);
    hold on;
    %----------------------------------T1--------------------------------------------%
    
    
    %---------------------------------T2---------------------------------------------%
    %J的图像 T2%
    ThetaT2 = T1;
    Tplot2 = linspace(T1,T1+T2,T2/0.001);
    Jplot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Jplot2(i) = 0;
    end
    
    %A的图像 T2%
    Aplot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Aplot2(i) = Amax;
    end
    figure(2)
    plot(Tplot2,Aplot2,'g');
    %---------------------------------T2---------------------------------------------%
    
    %---------------------------------T3---------------------------------------------%
    %J的图像 T3%
    T3 = T1;
    ThetaT3 = T1 + T2;
    Tplot3 = linspace(T1+T2,T1+T2+T3,T3/0.001);
    Jplot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Jplot3(i) = -Jmax;
    end
    figure(1);
    plot(Tplot3,Jplot3,'r');
    hold on;
    
    %A的图像 T3%
    Aplot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Aplot3(i) = Amax - Jmax * (Tplot3(i)-ThetaT3);
    end
    figure(2)
    plot(Tplot3,Aplot3,'g');
    hold on;
    %---------------------------------T3---------------------------------------------%
   
    %---------------------------------T4---------------------------------------------%
    %J的图像 T4%
    T4 = (Sinput - Smin2) / Vmax;
    ThetaT4 = T1 + T2 + T3;
    Tplot4 = linspace(T1+T2+T3,T1+T2+T3+T4,T4/0.001);
    Jplot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Jplot4(i) = 0;
    end
    
    %A的图像 T4%
    Aplot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Aplot4(i) = 0;
    end
    figure(2);
    plot(Tplot4,Jplot4,'g');
    hold on;
    %---------------------------------T4---------------------------------------------%
    
    %---------------------------------T5---------------------------------------------%
    %J的图像 T5%
    T5 = T1;
    ThetaT5 = T1 + T2 + T3 + T4;
    Tplot5 = linspace(T1+T2+T3+T4,T1+T2+T3+T4+T5,T5/0.001);
    Jplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Jplot5(i) = Jmax;
    end
    figure(1);
    plot(Tplot5,Jplot5,'r');
    hold on
    
    %A的图像 T5%
    Aplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Aplot5(i) = -Jmax * (Tplot5(i) - ThetaT5);
    end
    figure(2);
    plot(Tplot5,Aplot5,'g');
    hold on
    %---------------------------------T5---------------------------------------------%
    
    %---------------------------------T6---------------------------------------------%
    %J的图像 T6%
    T6 = T2;
    ThetaT6 = T1 + T2 + T3 + T4 + T5;
    Tplot6 = linspace(T1+T2+T3+T4+T5,T1+T2+T3+T4+T5+T6,T6/0.001);
    Jplot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Jplot6(i) = 0;
    end
    %A的图像 T6%
    Aplot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Aplot6(i) = -Amax;
    end
    figure(2);
    plot(Tplot6,Aplot6,'g');
    hold on
    %---------------------------------T6---------------------------------------------%
   
    %---------------------------------T7---------------------------------------------%
    %J的图像 T7%
    T7 = T1;
    ThetaT7 = T1 + T2 + T3 + T4 + T5 + T6;
    Tplot7 = linspace(T1+T2+T3+T4+T5+T6,T1+T2+T3+T4+T5+T6+T7,T7/0.001);
    Jplot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Jplot7(i) = -Jmax;
    end
    figure(1);
    plot(Tplot7,Jplot7,'r');
    hold on;
    
    %A的图像 T7%
    Aplot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Aplot7(i) = -Amax + Jmax * (Tplot7(i) - ThetaT7);
    end
    figure(2);
    plot(Tplot7,Aplot7,'g');
    hold on
    %---------------------------------T7---------------------------------------------%
end
%%




