clear;
clc;
close all;
Amax = 100;
Jmax = 1000;
Vmax = 200;
Vs = 10;
Sinput = 500;
%常量计算%
T1 = Amax / Jmax;
T2 = (Vmax - Vs - Amax * T1) / Amax;
if T2 < 0
    disp("Amax is too large,Give little Amax and rerun");
end
%边界计算%
Smin1 = 4 * Vs * T1 + 2 * Amax * T1^2;
Smin2 = 4 * Vs * T1 + 2 * Vs * T2 + 3 * Amax * T1 * T2 + 2 * Amax * T1^2 + Amax * T2^2;
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
    
    %V的图像 T1%
    Vplot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Vplot1(i) = Vs + 1/2 * Jmax * Tplot1(i)^2;
    end
    figure(3);
    plot(Tplot1,Vplot1,'b');
    ylim([Vs/5,Vmax + Vmax/10]);
    hold on
    
    %S的图像 T1%
    Splot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Splot1(i) = Vs * Tplot1(i) + 1/6 * Jmax * Tplot1(i)^3;
    end
    S1 = Vs * T1 + 1/6 * Jmax * T1^3;
    figure(4);
    plot(Tplot1,Splot1,'k');
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
    hold on;
    
    %V的图像 T2%
    Vplot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Vplot2(i) = Vs + 1/2 * Jmax * T1^2 + Amax * (Tplot2(i) - ThetaT2);
    end
    figure(3)
    plot(Tplot2,Vplot2,'b');
    
    %S的图像 T2%
    Splot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Splot2(i) = S1 + (Vs + 1/2 * Jmax * T1^2) * (Tplot2(i) - ThetaT2) + 1/2 * Amax * (Tplot2(i) - ThetaT2)^2;
    end
    S2 = S1 + (Vs + 1/2 * Jmax * T1^2) * T2 + 1/2 * Amax * T2^2;
    figure(4);
    plot(Tplot2,Splot2,'k');
    hold on;
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
    
    %V的图像 T3%
    Vplot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Vplot3(i) = Vs + 1/2 * Jmax * T1^2 + Amax * T2 + Amax * (Tplot3(i) - ThetaT3)- 1/2 * Jmax * (Tplot3(i) - ThetaT3)^2;
    end
    figure(3)
    plot(Tplot3,Vplot3,'b');
    hold on;
    
    %S的图像 T3%
    Splot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Splot3(i) = S2 + (Vs + 1/2 * Jmax * T1^2 + Amax * T2)*(Tplot3(i) - ThetaT3) + 1/2 * Amax * (Tplot3(i) - ThetaT3)^2 - 1/6 * Jmax * (Tplot3(i) - ThetaT3)^3;
    end
    S3 = S2 + (Vs + 1/2 * Jmax * T1^2 + Amax * T2) * T3 + 1/2 * Amax * T3^2 - 1/6 * Jmax * T3^3;
    figure(4);
    plot(Tplot3,Splot3,'k');
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
    
    %V的图像 T4%
    Vplot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Vplot4(i) = Vs + Amax * T2 + Amax * T3;
    end
    figure(3);
    plot(Tplot4,Vplot4,'b');
    hold on;
    
    %S的图像 T4%
    Splot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Splot4(i) = S3 + (Vs + Amax * T2 + Amax * T3) * (Tplot4(i) - ThetaT4);
    end
    S4 = S3 + (Vs + Amax * T2 + Amax * T3) * T4;
    figure(4);
    plot(Tplot4,Splot4,'k');
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
    hold on;
    
    %A的图像 T5%
    Aplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Aplot5(i) = -Jmax * (Tplot5(i) - ThetaT5);
    end
    figure(2);
    plot(Tplot5,Aplot5,'g');
    hold on;
    
    %V的图像 T5%
    Vplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Vplot5(i) = Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * (Tplot5(i) - ThetaT5)^2;
    end
    figure(3)
    plot(Tplot5,Vplot5,'b');
    hold on;
    
    %S的图像 T5%
    Splot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Splot5(i) = S4 + (Vs + Amax * T2 + Amax * T3) * (Tplot5(i) - ThetaT5) - 1/6 * Jmax * (Tplot5(i) - ThetaT5)^3;
    end
    S5 = S4 + (Vs + Amax * T2 + Amax * T3) * T5 - 1/6 * Jmax * T5^3;
    figure(4);
    plot(Tplot5,Splot5,'k');
    hold on;
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
    hold on;
    
    %V的图像 T6%
    Vplot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Vplot6(i) = Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax *T5^2 - Amax * (Tplot6(i) - ThetaT6);
    end
    figure(3);
    plot(Tplot6,Vplot6,'b');
    hold on;
    
    %S的图像 T6%
    Splot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Splot6(i) = S5 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2) * (Tplot6(i) - ThetaT6) - 1/2 * Amax * (Tplot6(i) - ThetaT6)^2;
    end
    S6 = S5 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2) * T6 - 1/2 * Amax * T6^2;
    figure(4);
    plot(Tplot6,Splot6,'k');
    hold on;
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
    hold on;
    
    %V的图像 T7%
    Vplot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Vplot7(i) = Vs + Amax*T2 + Amax*T3 - 1/2*Jmax*T5^2 - Amax * T6 - Amax * (Tplot7(i) - ThetaT7) + 1/2 * Jmax * (Tplot7(i) - ThetaT7)^2;
    end
    figure(3);
    plot(Tplot7,Vplot7,'b');
    hold on;
    
    %S的图像 T7%
    Splot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Splot7(i) = S6 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2 - Amax * T6) * (Tplot7(i) - ThetaT7) - 1/2 * Amax * (Tplot7(i) - ThetaT7)^2 + 1/6 * Jmax * (Tplot7(i) - ThetaT7)^3;
    end
    figure(4);
    plot(Tplot7,Splot7,'k');
    hold on;
    %---------------------------------T7---------------------------------------------%
end

%情况二 位移最第二大%
if Smin1 < Sinput && Sinput <= Smin2
    %重新计算T2,Vmax输入Vmax无效%
    a = Amax;
    b = 2 * Vs + 3 * Amax * T1;
    c = 4 * Vs * T1 + 2 * Amax * T1^2 -Sinput;
    NewT2 = (-b + sqrt(b ^2 - 4 * a *c))/(2 * a);
    NewT2 = NewT2 / 0.001;
    NewT2 = floor(NewT2);
    NewT2 = NewT2 * 0.001;
    
    T2 = NewT2 / 2;
    Vmax = Vs + Amax * T2 + Amax * T1;
    Smin2 = 4 * Vs * T1 + 2 * Vs * T2 + 3 * Amax * T1 * T2 + 2 * Amax * T1^2 + Amax * T2^2;
    
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
    
    %V的图像 T1%
    Vplot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Vplot1(i) = Vs + 1/2 * Jmax * Tplot1(i)^2;
    end
    figure(3);
    plot(Tplot1,Vplot1,'b');
    ylim([Vs/5,Vmax + Vmax/10]);
    hold on
    
    %S的图像 T1%
    Splot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Splot1(i) = Vs * Tplot1(i) + 1/6 * Jmax * Tplot1(i)^3;
    end
    S1 = Vs * T1 + 1/6 * Jmax * T1^3;
    figure(4);
    plot(Tplot1,Splot1,'k');
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
    hold on;
    
    %V的图像 T2%
    Vplot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Vplot2(i) = Vs + 1/2 * Jmax * T1^2 + Amax * (Tplot2(i) - ThetaT2);
    end
    figure(3)
    plot(Tplot2,Vplot2,'b');
    
    %S的图像 T2%
    Splot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Splot2(i) = S1 + (Vs + 1/2 * Jmax * T1^2) * (Tplot2(i) - ThetaT2) + 1/2 * Amax * (Tplot2(i) - ThetaT2)^2;
    end
    S2 = S1 + (Vs + 1/2 * Jmax * T1^2) * T2 + 1/2 * Amax * T2^2;
    figure(4);
    plot(Tplot2,Splot2,'k');
    hold on;
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
    
    %V的图像 T3%
    Vplot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Vplot3(i) = Vs + 1/2 * Jmax * T1^2 + Amax * T2 + Amax * (Tplot3(i) - ThetaT3)- 1/2 * Jmax * (Tplot3(i) - ThetaT3)^2;
    end
    figure(3)
    plot(Tplot3,Vplot3,'b');
    hold on;
    
    %S的图像 T3%
    Splot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Splot3(i) = S2 + (Vs + 1/2 * Jmax * T1^2 + Amax * T2)*(Tplot3(i) - ThetaT3) + 1/2 * Amax * (Tplot3(i) - ThetaT3)^2 - 1/6 * Jmax * (Tplot3(i) - ThetaT3)^3;
    end
    S3 = S2 + (Vs + 1/2 * Jmax * T1^2 + Amax * T2) * T3 + 1/2 * Amax * T3^2 - 1/6 * Jmax * T3^3;
    figure(4);
    plot(Tplot3,Splot3,'k');
    hold on;
    %---------------------------------T3---------------------------------------------%
    
    %---------------------------------T4---------------------------------------------%
    %J的图像 T4%
    NewT4 = (Sinput - Smin2) / Vmax; 
    NewT4 = NewT4 / 0.001;
    NewT4 = floor(NewT4);
    T4 = NewT4 * 0.001;
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
    
    %V的图像 T4%
    Vplot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Vplot4(i) = Vs + Amax * T2 + Amax * T3;
    end
    figure(3);
    plot(Tplot4,Vplot4,'b');
    hold on;
    
    %S的图像 T4%
    Splot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Splot4(i) = S3 + (Vs + Amax * T2 + Amax * T3) * (Tplot4(i) - ThetaT4);
    end
    S4 = S3 + (Vs + Amax * T2 + Amax * T3) * T4;
    figure(4);
    plot(Tplot4,Splot4,'k');
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
    hold on;
    
    %A的图像 T5%
    Aplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Aplot5(i) = -Jmax * (Tplot5(i) - ThetaT5);
    end
    figure(2);
    plot(Tplot5,Aplot5,'g');
    hold on;
    
    %V的图像 T5%
    Vplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Vplot5(i) = Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * (Tplot5(i) - ThetaT5)^2;
    end
    figure(3)
    plot(Tplot5,Vplot5,'b');
    hold on;
    
    %S的图像 T5%
    Splot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Splot5(i) = S4 + (Vs + Amax * T2 + Amax * T3) * (Tplot5(i) - ThetaT5) - 1/6 * Jmax * (Tplot5(i) - ThetaT5)^3;
    end
    S5 = S4 + (Vs + Amax * T2 + Amax * T3) * T5 - 1/6 * Jmax * T5^3;
    figure(4);
    plot(Tplot5,Splot5,'k');
    hold on;
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
    hold on;
    
    %V的图像 T6%
    Vplot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Vplot6(i) = Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax *T5^2 - Amax * (Tplot6(i) - ThetaT6);
    end
    figure(3);
    plot(Tplot6,Vplot6,'b');
    hold on;
    
    %S的图像 T6%
    Splot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Splot6(i) = S5 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2) * (Tplot6(i) - ThetaT6) - 1/2 * Amax * (Tplot6(i) - ThetaT6)^2;
    end
    S6 = S5 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2) * T6 - 1/2 * Amax * T6^2;
    figure(4);
    plot(Tplot6,Splot6,'k');
    hold on;
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
    hold on;
    
    %V的图像 T7%
    Vplot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Vplot7(i) = Vs + Amax*T2 + Amax*T3 - 1/2*Jmax*T5^2 - Amax * T6 - Amax * (Tplot7(i) - ThetaT7) + 1/2 * Jmax * (Tplot7(i) - ThetaT7)^2;
    end
    figure(3);
    plot(Tplot7,Vplot7,'b');
    hold on;
    
    %S的图像 T7%
    Splot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Splot7(i) = S6 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2 - Amax * T6) * (Tplot7(i) - ThetaT7) - 1/2 * Amax * (Tplot7(i) - ThetaT7)^2 + 1/6 * Jmax * (Tplot7(i) - ThetaT7)^3;
    end
    figure(4);
    plot(Tplot7,Splot7,'k');
    hold on;
    %---------------------------------T7---------------------------------------------% 
end

%情况三 位移最第三大%
if  Sinput <= Smin1 
    %调整合适Amax%
    while Sinput < Smin1
        Amax = Amax / 2;
        T1 = Amax / Jmax;
        Smin1 = 4 * Vs * T1 + 2 * Amax * T1^2;
    end
    
    %重新计算T2,Vmax输入Vmax无效%
    a = Amax;
    b = 2 * Vs + 3 * Amax * T1;
    c = 4 * Vs * T1 + 2 * Amax * T1^2 -Sinput;
    NewT2 = (-b + sqrt(b ^2 - 4 * a *c))/(2 * a);
    NewT2 = NewT2 / 0.001;
    NewT2 = floor(NewT2);
    NewT2 = NewT2 * 0.001;
    
    T2 = NewT2 / 2;
    Vmax = Vs + Amax * T2 + Amax * T1;
    Smin2 = 4 * Vs * T1 + 2 * Vs * T2 + 3 * Amax * T1 * T2 + 2 * Amax * T1^2 + Amax * T2^2;
    
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
    
    %V的图像 T1%
    Vplot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Vplot1(i) = Vs + 1/2 * Jmax * Tplot1(i)^2;
    end
    figure(3);
    plot(Tplot1,Vplot1,'b');
    ylim([Vs/5,Vmax + Vmax/10]);
    hold on
    
    %S的图像 T1%
    Splot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Splot1(i) = Vs * Tplot1(i) + 1/6 * Jmax * Tplot1(i)^3;
    end
    S1 = Vs * T1 + 1/6 * Jmax * T1^3;
    figure(4);
    plot(Tplot1,Splot1,'k');
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
    hold on;
    
    %V的图像 T2%
    Vplot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Vplot2(i) = Vs + 1/2 * Jmax * T1^2 + Amax * (Tplot2(i) - ThetaT2);
    end
    figure(3)
    plot(Tplot2,Vplot2,'b');
    
    %S的图像 T2%
    Splot2 = zeros(1,T2/0.001);
    for i = 1 : T2/0.001
        Splot2(i) = S1 + (Vs + 1/2 * Jmax * T1^2) * (Tplot2(i) - ThetaT2) + 1/2 * Amax * (Tplot2(i) - ThetaT2)^2;
    end
    S2 = S1 + (Vs + 1/2 * Jmax * T1^2) * T2 + 1/2 * Amax * T2^2;
    figure(4);
    plot(Tplot2,Splot2,'k');
    hold on;
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
    
    %V的图像 T3%
    Vplot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Vplot3(i) = Vs + 1/2 * Jmax * T1^2 + Amax * T2 + Amax * (Tplot3(i) - ThetaT3)- 1/2 * Jmax * (Tplot3(i) - ThetaT3)^2;
    end
    figure(3)
    plot(Tplot3,Vplot3,'b');
    hold on;
    
    %S的图像 T3%
    Splot3 = zeros(1,T3/0.001);
    for i = 1 : T3/0.001
        Splot3(i) = S2 + (Vs + 1/2 * Jmax * T1^2 + Amax * T2)*(Tplot3(i) - ThetaT3) + 1/2 * Amax * (Tplot3(i) - ThetaT3)^2 - 1/6 * Jmax * (Tplot3(i) - ThetaT3)^3;
    end
    S3 = S2 + (Vs + 1/2 * Jmax * T1^2 + Amax * T2) * T3 + 1/2 * Amax * T3^2 - 1/6 * Jmax * T3^3;
    figure(4);
    plot(Tplot3,Splot3,'k');
    hold on;
    %---------------------------------T3---------------------------------------------%
    
    %---------------------------------T4---------------------------------------------%
    %J的图像 T4%
    NewT4 = (Sinput - Smin2) / Vmax; 
    NewT4 = NewT4 / 0.001;
    NewT4 = floor(NewT4);
    T4 = NewT4 * 0.001;
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
    
    %V的图像 T4%
    Vplot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Vplot4(i) = Vs + Amax * T2 + Amax * T3;
    end
    figure(3);
    plot(Tplot4,Vplot4,'b');
    hold on;
    
    %S的图像 T4%
    Splot4 = zeros(1,T4/0.001);
    for i = 1 : T4/0.001
        Splot4(i) = S3 + (Vs + Amax * T2 + Amax * T3) * (Tplot4(i) - ThetaT4);
    end
    S4 = S3 + (Vs + Amax * T2 + Amax * T3) * T4;
    figure(4);
    plot(Tplot4,Splot4,'k');
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
    hold on;
    
    %A的图像 T5%
    Aplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Aplot5(i) = -Jmax * (Tplot5(i) - ThetaT5);
    end
    figure(2);
    plot(Tplot5,Aplot5,'g');
    hold on;
    
    %V的图像 T5%
    Vplot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Vplot5(i) = Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * (Tplot5(i) - ThetaT5)^2;
    end
    figure(3)
    plot(Tplot5,Vplot5,'b');
    hold on;
    
    %S的图像 T5%
    Splot5 = zeros(1,T5/0.001);
    for i = 1 : T5/0.001
        Splot5(i) = S4 + (Vs + Amax * T2 + Amax * T3) * (Tplot5(i) - ThetaT5) - 1/6 * Jmax * (Tplot5(i) - ThetaT5)^3;
    end
    S5 = S4 + (Vs + Amax * T2 + Amax * T3) * T5 - 1/6 * Jmax * T5^3;
    figure(4);
    plot(Tplot5,Splot5,'k');
    hold on;
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
    hold on;
    
    %V的图像 T6%
    Vplot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Vplot6(i) = Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax *T5^2 - Amax * (Tplot6(i) - ThetaT6);
    end
    figure(3);
    plot(Tplot6,Vplot6,'b');
    hold on;
    
    %S的图像 T6%
    Splot6 = zeros(1,T6/0.001);
    for i = 1 : T6/0.001
        Splot6(i) = S5 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2) * (Tplot6(i) - ThetaT6) - 1/2 * Amax * (Tplot6(i) - ThetaT6)^2;
    end
    S6 = S5 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2) * T6 - 1/2 * Amax * T6^2;
    figure(4);
    plot(Tplot6,Splot6,'k');
    hold on;
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
    hold on;
    
    %V的图像 T7%
    Vplot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Vplot7(i) = Vs + Amax*T2 + Amax*T3 - 1/2*Jmax*T5^2 - Amax * T6 - Amax * (Tplot7(i) - ThetaT7) + 1/2 * Jmax * (Tplot7(i) - ThetaT7)^2;
    end
    figure(3);
    plot(Tplot7,Vplot7,'b');
    hold on;
    
    %S的图像 T7%
    Splot7 = zeros(1,T7/0.001);
    for i = 1 : T7/0.001
        Splot7(i) = S6 + (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2 - Amax * T6) * (Tplot7(i) - ThetaT7) - 1/2 * Amax * (Tplot7(i) - ThetaT7)^2 + 1/6 * Jmax * (Tplot7(i) - ThetaT7)^3;
    end
    figure(4);
    plot(Tplot7,Splot7,'k');
    hold on;
    S7 = (Vs + Amax * T2 + Amax * T3 - 1/2 * Jmax * T5^2 - Amax * T6) * T7 - 1/2 * Amax * T7^2 + 1/6 * Jmax * T7^3;
    %---------------------------------T7---------------------------------------------%
end
%%




