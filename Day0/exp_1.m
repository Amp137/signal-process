%% �ϳɷ���
t = linspace(0, 10, 500);
y0 = sin(t);
y1 = y0 + sin(t*3)/3;
y2 = y1 + sin(t*5)/5 + sin(t*7)/7 + sin(t*9)/9;
y3 = y2 + sin(t*11)/11 + sin(t*13)/13 + sin(t*15)/15 + sin(t*17)/17 + ...
    sin(t*19)/19;
plot(t, y0, t, y1, t, y2, t, y3);
title('г���ƽ�����');

%% ��ǰ 5 ��г�����ƺϳ� 50Hz,��ֵΪ 3 �ķ���
t = linspace(-pi/50, pi/50, 500);
y4 = (6/pi) * (sin(2*pi*50*t) + 1/3 * sin(2*pi*3*50*t) + 1/5 * ...
    sin(2*pi*5*50*t) + 1/7 * sin(2*pi*7*50*t) + 1/9 * sin(2*pi*9*50*t));
y5 = 3/2 * square(2*pi*50*t, 50);
plot(t, y4, t, y5);
title('�ϳ�50Hz����ֵΪ3�ķ���');

%% �ϳ����ǲ�
t = linspace(0, 20, 500);
y6 = cos(t) + cos(t*3)/(3*3) + cos(t*5)/(5*5) + cos(t*7)/(7*7) + ...
    cos(t*9)/(9*9);
plot(t, y6);
title('�ϳ����ǲ�');








