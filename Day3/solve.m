
%% 实验三 第2题 由系统函数绘制系统的状态轨迹
% 程序作者：李昊 2017301200060
% 日期：2019/9/27

t = 0:0.1:500; 

%确定系统状态方程和输出方程中的 a,b,c,d 矩阵 
a = [-1 0; 0 -2]; 
b = [1; 1];
c = [1 0; 0 1];
d = [0; 0];             

sys = ss(a,b,c,d);       %建立系统状态空间模型 
Response = impulse(sys,t);  %求系统的冲激响应 

figure(1);
plot(Response(:,1),Response(:,2),'linewidth',2);  %显示状态轨迹 
xlabel('lambda1(t)','fontsize',14) 
ylabel('lambda2(t)','fontsize',14) 

