%% 实验一 第4题 奇对称方波信号和偶对称三角信号的频谱分析
% 程序作者：李昊 2017301200060
% 日期：2019/9/6

fo = 50;  % 三角波和方波的频率(Hz)
Fs = 10000; % 采样频率(Hz)
Ts = 1 / Fs; % 采样周期(s)
L = 8192; % 信号长度（“点数”）
t = (0: L-1) * Ts; % 采样点序列

% 生成方波、三角波
y7 = 0; A = 4/pi; %取前20项级数，合成频率为fo的方波y7
for i=1:20 
    y7 = y7+A*(sin((2*i-1)*100*pi*t)/(2*i-1));  
end  
y8 = 0; A = 3/pi; %取前20项级数，合成频率为fo的三角波y8
for i=1:20
    y8 = y8+A*(cos((2*i-1)*100*pi*t)/(2*i-1)^2);  
end  

%绘制时域图
figure(1);
LRange = 500; % 取部分时域图像展示
subplot(221);
plot(t(1:LRange), y7(1:LRange));
xlabel('t(s)');
ylabel('y(t)');
title('50Hz奇对称方波时域图像（0-0.05s）');
grid;

subplot(222);
plot(t(1:LRange), y8(1:LRange));
xlabel('t(s)');
ylabel('y(t)');
title('50Hz偶对称三角波时域图像（0-0.05s）');
grid;

% 使用fft()进行傅里叶变换并归一化，提取单边频谱
N = 2^nextpow2(L); % 将L放大到最近的2的整数幂N，以加速fft()的计算
Y7 = fft(y7, N); % 序列末尾补0至长度N，进行傅里叶变换
Y8 = fft(y8, N);
Y7Pd = abs(Y7 / N); % 归一化并取绝对值，得到双边频谱
Y7Ps = Y7Pd(1: (N/2 + 1)); % 取左半边，得到单边频谱
Y7Ps(2:end-1) = 2 * Y7Ps(2:end-1); % 除去直流分量外，其他频率幅值乘2，以符合幅值归一化的要求
Y8Pd = abs(Y8 / N);
Y8Ps = Y8Pd(1: (N/2 + 1));
Y8Ps(2:end-1) = 2 * Y8Ps(2:end-1);

% 绘制频谱图
freq = Fs * (0: (N/2)) / N; % 生成频谱图的横坐标
subplot(223);
freqRange = 375; % 取部分频谱展示
plot(freq(1:freqRange), Y7Ps(1:freqRange));
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('方波单边频谱图（0-500Hz）');
grid;

subplot(224);
plot(freq(1:freqRange), Y8Ps(1:freqRange));
xlabel('f(Hz)');
ylabel('|P1(t)|');
title('三角波单边频谱图（0-500Hz）');
grid;

