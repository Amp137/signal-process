%% ʵ��� Ƶ�׷���
% �������ߣ���� 2017301200060
% ���ڣ�2019/9/20

% ���SIMULINK��������õ����ڵ���ź�
time = out.tout;
src = out.src;
imp = out.imp;
lpf = out.lpf;
product = out.product;
rec = out.rec;

% �ӵõ�����źŵĳ��ȺͲ�������
L = length(time); % �źų��ȡ�������
Ss = (time(L) - time(1)) / L; % ��������(s)
Fs = 1 / Ss; % ����Ƶ��

%���Ƹ��ź�ʱ��ͼ
figure(1);
subplot(221);
plot(time, src);
xlabel('t(s)');
ylabel('y(t)');
title('�ź�Դ����');
ylim([-1.5 1.5]);
grid;

subplot(222);
plot(time, imp);
xlabel('t(s)');
ylabel('y(t)');
title('��������Ĳ���');
grid;

subplot(223);
plot(time, product);
xlabel('t(s)');
ylabel('y(t)');
title('�������źŵĲ���');
grid;

subplot(224);
plot(time, rec);
xlabel('t(s)');
ylabel('y(t)');
title('�ָ��Ժ��źŵĲ���');
grid;

% ʹ��fft()���и���Ҷ�任����һ������ȡ����Ƶ��
% N = 2^nextpow2(L); % ��L�Ŵ������2��������N���Լ���fft()�ļ���
N = L;
if (mod(N, 2) == 1)
    N = N + 1;
end
% ����ĩβ��0������N�����и���Ҷ�任
Src = fft(src, N); Lpf = fft(lpf, N);
Product = fft(product, N); Rec = fft(rec, N); 
% ��һ����ȡ����ֵ���õ�˫��Ƶ�ף�Ȼ��ȡ���ߣ��õ�����Ƶ��
Sd = abs(Src / N); Ss = Sd(1: (N/2 + 1)); Ss(2:end-1) = 2*Ss(2:end-1);
Ld = abs(Lpf / N); Ls = Ld(1: (N/2 + 1)); Ls(2:end-1) = 2*Ls(2:end-1);
Pd = abs(Product / N); Ps = Pd(1: (N/2 + 1)); Ps(2:end-1) = 2*Ps(2:end-1);
Rd = abs(Rec / N); Rs = Rd(1: (N/2 + 1)); Rs(2:end-1) = 2*Rs(2:end-1);

% ����Ƶ��ͼ
freq = Fs * (0: (N/2)) / N; % ����Ƶ��ͼ�ĺ�����
figure(2);
freqRange = 50; % ȡ����Ƶ��չʾ
subplot(221);
plot(freq, Ss);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('�����źŵķ�Ƶ����');
grid;

subplot(222);
plot(freq, Ls);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('�˲����źŵķ�Ƶ����');
grid;

subplot(223);
plot(freq, Ps);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('�������źŵķ�Ƶ����');
grid;

subplot(224);
plot(freq, Rs);
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('�ָ����źŵķ�Ƶ����');
grid;