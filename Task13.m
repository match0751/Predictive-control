%% ���ݶ������״̬�ռ���������ģ�͵�Ԥ������㷨
clear all;
close all;

% ԭģ��
num = [10];
den = [1200,1];
sys=tf(num,den);%ģ�ʹ��ݺ���
figure(1)
step(num,den);
title('��Ծ��Ӧ');
xlabel('time');

% ����Ԥ�����
G = poly2tfd(10,[1200 1]);%ģ�͵�MPC��ʽ
T = 20; % ��������
Nt = 1;%������ȶ�������
TFinal = 1000; % ����ʱ��
Model = tfd2mod(T,Nt,G);%��λ��Ծ��Ӧ
PreModel = Model;%Ԥ�������

P = 10;%Ԥ�ⳤ��
M = [1,2,4,6];%���Ƴ���
Ywt = [];
Uwt = 1;

tend = 2000;
r = 1;
[y1,u1] = scmpc(PreModel,Model,Ywt,Uwt,M(1),P,tend,r);
[y2,u2] = scmpc(PreModel,Model,Ywt,Uwt,M(2),P,tend,r);
[y3,u3] = scmpc(PreModel,Model,Ywt,Uwt,M(3),P,tend,r);
[y4,u4] = scmpc(PreModel,Model,Ywt,Uwt,M(4),P,tend,r);
t = 0:20:2000;


figure(2)
plot(t,y1,t,y2,t,y3,t,y4);
legend('M=1','M=2','M=4','M=6');
title('Ԥ��������(system response)');
xlabel('time');

figure(3)
plot(t,u1,t,u2,t,u3,t,u4);
legend('M=1','M=2','M=4','M=6');
title('u(manipulated variable)');
xlabel('time');
