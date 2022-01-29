%% 绘制接受新解概率p随温度T变化的图
T = 0.1:0.1:1000;  % 温度
% 设置三个不同的函数变化值
delta_f1 = 10; 
delta_f2 = 50;
delta_f3 = 100;
delta_f4 = 500;
% 分别计算三个不同的函数变化值下接受新解的概率
p1 = exp(-delta_f1 ./ T);
p2 = exp(-delta_f2 ./ T);
p3 = exp(-delta_f3 ./ T);
p4 = exp(-delta_f4 ./ T);
plot(T, p1, T, p2, T, p3 ,T,p4,'LineWidth' , 2)
xlabel('温度T'); ylabel('接受新解的概率p')
legend('delta f = 10','delta f = 50','delta f= 100','delta f=500')
