%% ʵ��һ ��1�� ��ԳƷ����ϳ�
% ��������ʵ��ָ����
% ���ڣ�2019/9/6
% ע�⣺ʹ�á�����ͼ�������ܿ��԰�ͼƬ�����Ƶ�Word�ĵ���

t=0:0.0001:0.1;  
sishu=12/pi;  
 
y=sishu*sin(2*pi*50*t);  
subplot(221); 
plot(t,y); 
axis([0,0.1,-4,4]);
xlabel('time'); 
ylabel('ǰ 1 �����޼���'); 

y=sishu*(sin(100*pi*t)+sin(3*100*pi*t)/3);  
subplot(222); 
plot(t,y); 
axis([0,0.1,-4,4]); 
xlabel('time'); 
ylabel('ǰ 2 �����޼���'); 

y=sishu*(sin(100*pi*t)+sin(3*100*pi*t)/3+sin(5*100*pi*t)/5+ ...
    sin(7*100*pi*t)/7+sin(9*100*pi*t)/9);  
subplot(223);
plot(t,y);  
axis([0,0.1,-4,4]); 
xlabel('time'); 
ylabel('ǰ 5 �����޼���'); 

y=0;  
for i=1:50  
    y=y+sishu*(sin((2*i-1)*100*pi*t)/(2*i-1));  
end  
subplot(224); 
plot(t,y); 
axis([0,0.1,-4,4]); 
xlabel('time'); 
ylabel('ǰ 50 �����޼���'); 