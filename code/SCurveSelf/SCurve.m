clear;
clc;
Amax = 100;
Jmax = 1000;
Vmax = 200;
Vs = 10;
Sinput = 400;
%��������%
T1 = Amax / Jmax;
T2 = (Vmax - Vs - Amax * T1) / Amax;
if T2 < 0
    disp("Amax is too large,Give little Amax and rerun");
end
%�߽����%
Smin1 = 4 * Vs * T1 + 2 * Amax * T1^2;
Smin2 = 4 * Vs * T1 + 2 * Vs * T2 + 3 * Amax * T1 * T2 + 2 * Amax * T1^2 + Amax * T2;
%���һ λ�����%
if Sinput > Smin2
    %J��ͼ��%
    Tplot1 = linspace(0,T1,T1/0.001);
    Jplot1 = zeros(1,T1/0.001);
    for i = 1 : T1/0.001
        Jplot1(i) = Jmax;
    end
    figure;
    plot(Tplot1,Jplot1,'r');
    hold on;
end
%%




