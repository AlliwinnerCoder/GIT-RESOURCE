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
%�߽����%
Smin1 = 4 * Vs * T1 + 2 * Amax * T1^2;
Smin2 = 4 * Vs * T1 + 2 * Vs * T2 + 3 * Amax * T1 * T2 + 2 * Amax * T1^2 + Amax * T2;
%���һ λ�����%
if Sinput > Smin2
    
end
%%




