%% ʵ��һ ��3�� ż�Գ����������źŵĺϳ�
% �������ߣ���� 2017301200060
% ���ڣ�2019/9/6
% ʹ�õĸ���Ҷ�����任��ʽ��y6 = cos(t) + cos(t*3)/(3*3) + cos(t*5)/(5*5) + ...

t=-0.02:0.0001:0.02;  
A=12/pi; 

y=0;  
for i=1:1
    y=y+A*(cos((2*i-1)*100*pi*t)/(2*i-1)^2);  
end  
subplot(221);
plot(t,y); 
axis([-0.02,0.02,-5,5]); 
xlabel('time'); 
ylabel('ǰ 1 �����޼���'); 

y=0;  
for i=1:5
    y=y+A*(cos((2*i-1)*100*pi*t)/(2*i-1)^2);  
end  
subplot(222); 
plot(t,y); 
axis([-0.02,0.02,-5,5]); 
xlabel('time'); 
ylabel('ǰ 5 �����޼���'); 

y=0;  
for i=1:10  
    y=y+A*(cos((2*i-1)*100*pi*t)/(2*i-1)^2);  
end  
subplot(223) 
plot(t,y);  
axis([-0.02,0.02,-5,5]); 
xlabel('time'); 
ylabel('ǰ 10 �����޼���'); 

y=0;  
for i=1:50 
    y=y+A*(cos((2*i-1)*100*pi*t)/(2*i-1)^2);  
end  
subplot(224); 
plot(t,y); 
axis([-0.02,0.02,-5,5]); 
xlabel('time'); 
ylabel('ǰ 50 �����޼���');