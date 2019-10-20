fo = 50;  % ���ǲ��ͷ�����Ƶ��(Hz)
Fs = 10000; % ����Ƶ��(Hz)
Ts = 1 / Fs; % ��������(s)
L = 8192; % �źų��ȣ�����������
t = (0: L-1) * Ts; % ����������

y7 = square(2*pi*fo*t, 50); % ����
y8 = sawtooth(2*pi*fo*t, 0.5); % ���ǲ�

figure(1);
LRange = 1000; % ȡ����ʱ��ͼ��չʾ
plot(t(1:LRange), y7(1:LRange));
xlabel('t(s)');
ylabel('y(t)');
grid;
ylim([-1.5, 1.5]);

figure(2);
LRange = 1000; % ȡ����ʱ��ͼ��չʾ
plot(t(1:LRange), y8(1:LRange));
xlabel('t(s)');
ylabel('y(t)');
grid;
ylim([-1.5, 1.5]);