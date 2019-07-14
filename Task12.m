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

P = [5,10,15,20];%Ԥ�ⳤ��
M = 2;%���Ƴ���
Ywt = [];
Uwt = 1;

tend = 2000;
r = 1;
[y1,u1] = scmpc(PreModel,Model,Ywt,Uwt,M,P(1),tend,r);
[y2,u2] = scmpc(PreModel,Model,Ywt,Uwt,M,P(2),tend,r);
[y3,u3] = scmpc(PreModel,Model,Ywt,Uwt,M,P(3),tend,r);
[y4,u4] = scmpc(PreModel,Model,Ywt,Uwt,M,P(4),tend,r);
t = 0:20:2000;


figure(2)
plot(t,y1,t,y2,t,y3,t,y4);
legend('P=5','P=10','P=15','P=20');
title('Ԥ��������(system response)');
xlabel('time');

figure(3)
plot(t,u1,t,u2,t,u3,t,u4);
legend('P=5','P=10','P=15','P=20');
title('u(manipulated variable)');
xlabel('time');
