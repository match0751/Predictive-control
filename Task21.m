%% ���ݻ��ֶ�����ڽ�Ծ��Ӧ���������ģ�͵�Ԥ������㷨
clear all;
close all;

% ԭģ��
num = [1];
den = [120,0];
sys=tf(num,den);%ģ�ʹ��ݺ���
figure(1)
subplot(2,1,1)
step(num,den);
title('��Ծ��Ӧ');
xlabel('time');

% ����Ԥ�����
G = poly2tfd(1,[120 0]);%ģ�͵�MPC��ʽ
T = 20; % ��������
Nt = 1;%������ȶ�������
TFinal = 1000; % ����ʱ��
Model = tfd2step(TFinal,T,Nt,G);%��λ��Ծ��Ӧ
PreModel = Model;%Ԥ�������

P = 10;%Ԥ�ⳤ��
M = 2;%���Ƴ���
Ywt = [];
Uwt = 1;
Dkmpc = mpccon(PreModel,Ywt,Uwt,M,P);%����Ԥ������� �������
tend = 12000;
r = 1;
[y,u,ym] = mpcsim(PreModel,Model,Dkmpc,tend,r);
t = 0:20:12000;
% figure(1)
subplot(2,1,2)
plot(t,y);
title('Ԥ��������(system response)');
xlabel('time');

figure(2)
subplot(2,1,1)
plot(t,ym);
title('ym (model response)');
xlabel('time');
subplot(2,1,2)
plot(t,u);
title('u(manipulated variable)');
xlabel('time');
