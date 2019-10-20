%%%%%%%%%
% 实验四 detect.m 输入拨号音，识别出对应的电话号码
% 作者：李昊 2017301200060
% 日期：2019/9/28
%%%%%%%%%

function [number, audio] = detect()
N = 2048;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

%global NUM;
%audio = NUM;
%Fs = 8192;

[audio, Fs] = audioread('N0.wav'); % 默认读取N0.wav文件，也可手动设置识别的目标音频

sound(audio, Fs);
Ts = 1 / Fs; 
t = (1:1000) * Ts;

L = length(audio);
l = L / 1100;
number = '';
for i = 1:l
    j = (i - 1) * 1100 + 1; % 每1100点取前1000个点，对应的是每个号码的DTMF信号
    d = audio(j:j+999);
    f = fft(d, N);
    f = abs(f / N); % 频谱归一化
    num(1) = 170 + find(f(170:238) == max(f(170:238))); % 找出低频区的峰值
    num(2) = 300 + find(f(300:412) == max(f(300:412))); % 找出高频区的峰值
    
    % 判断具体属于哪个频率
    if (num(1) < 180)
        row = 1;
    elseif (num(1) < 200)
        row = 2;
    elseif (num(1) < 220)
        row = 3;
    else 
        row = 4;
    end
    if (num(2) < 320)
        col = 1;
    elseif (num(2) < 340)
        col = 2;
    else 
        col = 3;
    end
    
    % 按照频率与号码的对应关系，将DTMF信号最终还原为号码
    switch row
        case 1
            digit = col;
        case 2
            digit = 3 + col;
        case 3
            digit = 6 + col;
        otherwise
            digit = 0;
                
    end
    number = strcat(number, string(digit));
    
%     fs = f(1: (N/2 + 1)); % 取左半边，得到单边频谱
%     fs(2:end-1) = 2 * fs(2:end-1); % 除去直流分量外，其他频率幅值乘2，以符合幅值归一化的要求
%     freq = Fs * (0: (N/2)) / N; % 生成频谱图的横坐标
%     figure(1);
%     freqRange = 500;
%     plot(freq(1:freqRange), fs(1:freqRange));
%     xlabel('f(Hz)');
%     ylabel('|P1(t)|');
%     text(1500, 0.35, string(digit), 'Color', 'red', 'FontSize', 28);
%     title('拨号音单边频谱图');
%     grid;
end
    
                    
                    
    
    
    