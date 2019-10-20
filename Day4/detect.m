%%%%%%%%%
% ʵ���� detect.m ���벦������ʶ�����Ӧ�ĵ绰����
% ���ߣ���� 2017301200060
% ���ڣ�2019/9/28
%%%%%%%%%

function [number, audio] = detect()
N = 2048;
lf = [697 770 852 941];
hf = [1209 1336 1477 1633];

%global NUM;
%audio = NUM;
%Fs = 8192;

[audio, Fs] = audioread('N0.wav'); % Ĭ�϶�ȡN0.wav�ļ���Ҳ���ֶ�����ʶ���Ŀ����Ƶ

sound(audio, Fs);
Ts = 1 / Fs; 
t = (1:1000) * Ts;

L = length(audio);
l = L / 1100;
number = '';
for i = 1:l
    j = (i - 1) * 1100 + 1; % ÿ1100��ȡǰ1000���㣬��Ӧ����ÿ�������DTMF�ź�
    d = audio(j:j+999);
    f = fft(d, N);
    f = abs(f / N); % Ƶ�׹�һ��
    num(1) = 170 + find(f(170:238) == max(f(170:238))); % �ҳ���Ƶ���ķ�ֵ
    num(2) = 300 + find(f(300:412) == max(f(300:412))); % �ҳ���Ƶ���ķ�ֵ
    
    % �жϾ��������ĸ�Ƶ��
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
    
    % ����Ƶ�������Ķ�Ӧ��ϵ����DTMF�ź����ջ�ԭΪ����
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
    
%     fs = f(1: (N/2 + 1)); % ȡ���ߣ��õ�����Ƶ��
%     fs(2:end-1) = 2 * fs(2:end-1); % ��ȥֱ�������⣬����Ƶ�ʷ�ֵ��2���Է��Ϸ�ֵ��һ����Ҫ��
%     freq = Fs * (0: (N/2)) / N; % ����Ƶ��ͼ�ĺ�����
%     figure(1);
%     freqRange = 500;
%     plot(freq(1:freqRange), fs(1:freqRange));
%     xlabel('f(Hz)');
%     ylabel('|P1(t)|');
%     text(1500, 0.35, string(digit), 'Color', 'red', 'FontSize', 28);
%     title('����������Ƶ��ͼ');
%     grid;
end
    
                    
                    
    
    
    