%% ���ݶ�����ڽ�Ծ��Ӧ���������ģ�͵�Ԥ������㷨
% �Կ��ƹ��ɵ�̽��
clear all;
close all;

% ԭģ��
num = [10];
den = [1200,1];
sys=tf(num,den);%ģ�ʹ��ݺ���
figure(1)
% subplot(2,1,1)
step(num,den);
title('��Ծ��Ӧ');
xlabel('time');

% ����Ԥ�����
G = poly2tfd(10,[1200 1]);%ģ�͵�MPC��ʽ
T = 20; % ��������
Nt = 1;%������ȶ�������
TFinal = 1000; % ����ʱ��
Model = tfd2step(TFinal,T,Nt,G);%��λ��Ծ��Ӧ
PreModel = Model;%Ԥ�������

P = 10;%Ԥ�ⳤ��
M = [1,2,4,6];%���Ƴ���
Ywt = [];
Uwt = 1;
Dkmpc1 = mpccon(PreModel,Ywt,Uwt,M(1),P);%����Ԥ������� �������
Dkmpc2 = mpccon(PreModel,Ywt,Uwt,M(2),P);%����Ԥ������� �������
Dkmpc3 = mpccon(PreModel,Ywt,Uwt,M(3),P);%����Ԥ������� �������
Dkmpc4 = mpccon(PreModel,Ywt,Uwt,M(4),P);%����Ԥ������� �������

tend = 2000;
r = 1;

[y1,u1,ym1] = mpcsim(PreModel,Model,Dkmpc1,tend,r);% Ԥ�����
[y2,u2,ym2] = mpcsim(PreModel,Model,Dkmpc2,tend,r);% Ԥ�����
[y3,u3,ym3] = mpcsim(PreModel,Model,Dkmpc3,tend,r);% Ԥ�����
[y4,u4,ym4] = mpcsim(PreModel,Model,Dkmpc4,tend,r);% Ԥ�����
t = 0:20:2000;
% subplot(2,1,2)
% plot(t,y1,t,y2,t,y3,t,y4);
% legend('P=5','P=10','P=15','P=20');
% title('Ԥ��������(system response)');
% xlabel('time');

figure(2)
plot(t,y1,t,y2,t,y3,t,y4);
legend('M=1','M=2','M=4','M=6');
title('Ԥ��������(system response)');
xlabel('time');

figure(3)
% subplot(2,1,1)
plot(t,ym1,t,ym2,t,ym3,t,ym4);
legend('M=1','M=2','M=4','M=6');
title('ym (model response)');
xlabel('time');

figure(4)
plot(t,u1,t,u2,t,u3,t,u4);
legend('M=1','M=2','M=4','M=6');
title('u(manipulated variable)');
xlabel('time');
