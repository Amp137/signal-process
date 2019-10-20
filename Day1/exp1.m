%% 实验一 第1题 奇对称方波合成
% 程序来自实验指导书
% 日期：2019/9/6
% 注意：使用“复制图窗”功能可以把图片无损复制到Word文档里

t=0:0.0001:0.1;  
sishu=12/pi;  
 
y=sishu*sin(2*pi*50*t);  
subplot(221); 
plot(t,y); 
axis([0,0.1,-4,4]);
xlabel('time'); 
ylabel('前 1 项有限级数'); 

y=sishu*(sin(100*pi*t)+sin(3*100*pi*t)/3);  
subplot(222); 
plot(t,y); 
axis([0,0.1,-4,4]); 
xlabel('time'); 
ylabel('前 2 项有限级数'); 

y=sishu*(sin(100*pi*t)+sin(3*100*pi*t)/3+sin(5*100*pi*t)/5+ ...
    sin(7*100*pi*t)/7+sin(9*100*pi*t)/9);  
subplot(223);
plot(t,y);  
axis([0,0.1,-4,4]); 
xlabel('time'); 
ylabel('前 5 项有限级数'); 

y=0;  
for i=1:50  
    y=y+sishu*(sin((2*i-1)*100*pi*t)/(2*i-1));  
end  
subplot(224); 
plot(t,y); 
axis([0,0.1,-4,4]); 
xlabel('time'); 
ylabel('前 50 项有限级数'); 