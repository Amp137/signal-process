
%% ʵ���� ��2�� ��ϵͳ��������ϵͳ��״̬�켣
% �������ߣ���� 2017301200060
% ���ڣ�2019/9/27

t = 0:0.1:500; 

%ȷ��ϵͳ״̬���̺���������е� a,b,c,d ���� 
a = [-1 0; 0 -2]; 
b = [1; 1];
c = [1 0; 0 1];
d = [0; 0];             

sys = ss(a,b,c,d);       %����ϵͳ״̬�ռ�ģ�� 
Response = impulse(sys,t);  %��ϵͳ�ĳ弤��Ӧ 

figure(1);
plot(Response(:,1),Response(:,2),'linewidth',2);  %��ʾ״̬�켣 
xlabel('lambda1(t)','fontsize',14) 
ylabel('lambda2(t)','fontsize',14) 

