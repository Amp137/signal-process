%% ʵ��һ ��4�� ��ԳƷ����źź�ż�Գ������źŵ�Ƶ�׷���
% �������ߣ���� 2017301200060
% ���ڣ�2019/9/6

fo = 50;  % ���ǲ��ͷ�����Ƶ��(Hz)
Fs = 10000; % ����Ƶ��(Hz)
Ts = 1 / Fs; % ��������(s)
L = 8192; % �źų��ȣ�����������
t = (0: L-1) * Ts; % ����������

% ���ɷ��������ǲ�
y7 = 0; A = 4/pi; %ȡǰ20������ϳ�Ƶ��Ϊfo�ķ���y7
for i=1:20 
    y7 = y7+A*(sin((2*i-1)*100*pi*t)/(2*i-1));  
end  
y8 = 0; A = 3/pi; %ȡǰ20������ϳ�Ƶ��Ϊfo�����ǲ�y8
for i=1:20
    y8 = y8+A*(cos((2*i-1)*100*pi*t)/(2*i-1)^2);  
end  

%����ʱ��ͼ
figure(1);
LRange = 500; % ȡ����ʱ��ͼ��չʾ
subplot(221);
plot(t(1:LRange), y7(1:LRange));
xlabel('t(s)');
ylabel('y(t)');
title('50Hz��ԳƷ���ʱ��ͼ��0-0.05s��');
grid;

subplot(222);
plot(t(1:LRange), y8(1:LRange));
xlabel('t(s)');
ylabel('y(t)');
title('50Hzż�Գ����ǲ�ʱ��ͼ��0-0.05s��');
grid;

% ʹ��fft()���и���Ҷ�任����һ������ȡ����Ƶ��
N = 2^nextpow2(L); % ��L�Ŵ������2��������N���Լ���fft()�ļ���
Y7 = fft(y7, N); % ����ĩβ��0������N�����и���Ҷ�任
Y8 = fft(y8, N);
Y7Pd = abs(Y7 / N); % ��һ����ȡ����ֵ���õ�˫��Ƶ��
Y7Ps = Y7Pd(1: (N/2 + 1)); % ȡ���ߣ��õ�����Ƶ��
Y7Ps(2:end-1) = 2 * Y7Ps(2:end-1); % ��ȥֱ�������⣬����Ƶ�ʷ�ֵ��2���Է��Ϸ�ֵ��һ����Ҫ��
Y8Pd = abs(Y8 / N);
Y8Ps = Y8Pd(1: (N/2 + 1));
Y8Ps(2:end-1) = 2 * Y8Ps(2:end-1);

% ����Ƶ��ͼ
freq = Fs * (0: (N/2)) / N; % ����Ƶ��ͼ�ĺ�����
subplot(223);
freqRange = 375; % ȡ����Ƶ��չʾ
plot(freq(1:freqRange), Y7Ps(1:freqRange));
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('��������Ƶ��ͼ��0-500Hz��');
grid;

subplot(224);
plot(freq(1:freqRange), Y8Ps(1:freqRange));
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('���ǲ�����Ƶ��ͼ��0-500Hz��');
grid;

