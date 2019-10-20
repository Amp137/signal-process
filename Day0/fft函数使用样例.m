%% ʹ��FFT�������ǲ��ͷ�����Ƶ�׷���
fo = 50;  % ���ǲ��ͷ�����Ƶ��(Hz)
Fs = 1000; % ����Ƶ��(Hz)
Ts = 1 / Fs; % ��������(s)
L = 1000; % �źų��ȣ�����������
t = (0: L-1) * Ts; % ����������

y7 = square(2*pi*fo*t, 50); % ����
y8 = sawtooth(2*pi*fo*t, 0.5); % ���ǲ�
figure(1);
plot(t(1:50), y7(1:50), t(1:50), y8(1:50));
xlabel('t(s)');
ylabel('y(t)');
title('ʱ��ͼ��');
grid;
ylim([-1.1 1.1]);

N = 2^nextpow2(L);
Y7 = fft(y7, N);
P2 = abs(Y7 / N);
P1 = P2(1: (N/2 + 1));
P1 = 2*P1;
freqRange = Fs * (0: (N/2)) / N;

figure(2);
plot(freqRange, P1);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('��������Ƶ��ͼ');






