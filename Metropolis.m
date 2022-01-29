%% ���ƽ����½����p���¶�T�仯��ͼ
T = 0.1:0.1:1000;  % �¶�
% ����������ͬ�ĺ����仯ֵ
delta_f1 = 10; 
delta_f2 = 50;
delta_f3 = 100;
delta_f4 = 500;
% �ֱ����������ͬ�ĺ����仯ֵ�½����½�ĸ���
p1 = exp(-delta_f1 ./ T);
p2 = exp(-delta_f2 ./ T);
p3 = exp(-delta_f3 ./ T);
p4 = exp(-delta_f4 ./ T);
plot(T, p1, T, p2, T, p3 ,T,p4,'LineWidth' , 2)
xlabel('�¶�T'); ylabel('�����½�ĸ���p')
legend('delta f = 10','delta f = 50','delta f= 100','delta f=500')
