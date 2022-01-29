 %% SA优化搜索TSP
    %初始温度1000，降温系数0.95，内循环固定20次，邻域解数量同城市数量，邻域搜索调用一次2-opt算子(O(n^2))
    %解空间：17! = 3.55687428×10^14, 目标最优解7291/2085
    
clear;
close all;
clc;

% 读取距离矩阵
[~,cities] = Read('ulysses22.tsp');
cities = cities';
M = calculateDistance(cities);

% load gr17Matrix.mat
% M = gr17Matrix;

[~,cityNum] = size(M);
run = 100; 
values = zeros(run,1);

tic
for i=1:run 
    i
    %初温度
    T0 = 1000;
    %降温系数
    tau = 0.95;
    %终止温度
    Ts = 1;
    %内循环次数
    MaxInnerLoop = 20;
    %邻域搜索返回的邻域解数量=城市数量
    neiborNum = cityNum;
    %随机初始解/当前位置(当前解)
    path = randperm(cityNum);
    %初始解路径长度
    pathfar = distance_calc(M,path);
    %最好目标值
    bestValue = pathfar;
    %当前目标值
    currentbestValue = bestValue;
    %最好路径
    bestPath = path;
    %当前路径
    currentbestPath = path;
    iterations = 1; %画图     
    
    %外循环-降温过程,迭代次数134(1000*0.95^134 = 1.03), 总134*20 = 2680次邻域搜索(2-opt算子，O(n^2))，2680*17=45560个邻域解
    while T0>=Ts
        %内循环-等温过程，固定迭代次数50次
        %path是当前路径，即当前走到了哪里、现在在山上哪个位置
        %进入内循环之前path就是上一个等温过程的平衡态，由于概率接受，path不一定等于历史最佳值bestPath
        for in = 1:MaxInnerLoop 
            e0 = distance_calc(M,path);
            %对于每轮循环开始前，path就是经过上一轮走到的位置
            %每轮循环从开始，使用2-opt(随机交换两个城市)，得到neiborNum(==cityNum,20)个邻域解，O(n^2)
            neiboorSols = Neiborhood(path,cityNum,neiborNum);
            e2 = distance_calc(M,neiboorSols);
            [better,index] = sort(e2);
             %取邻域搜索所得佳路径newpath及最佳值
            e1 = better(1,1);
            newpath = neiboorSols(index(1),:);
            %目标值改进，即比当前位置好，无条件接受为新的当前解path,并作为下一轮内循环的起点
            if e1 <e0
                currentbestValue = e1;
                currentbestPath = newpath; %currentbestPath:一直代表当前位置
                path = newpath;
                %如果新的当前位置比历史最佳位置好，更新bestPath
                if bestValue >currentbestValue
                    bestValue = currentbestValue;
                    bestPath = currentbestPath;
                end
            %否则按照Metropolis准则接受newpath为下一轮内循环起点path
            else
                pt = min(1,exp(-(e1-e0)/T0));
                if pt > rand
                    path = newpath;
                    e0 = e1;
                end
            end
        end
        %等温过程结束，降温(缓慢下降)
        T0 = tau*T0;
%         picture(iterations,1) = iterations; %画图
%         picture(iterations,2) = currentbestValue; %画图
%         iterations = iterations + 1;%画图
    end
%     figure %画图
%     plot(picture(:,1),picture(:,2),'b-.'); %画图
%     title('模拟退火算法TSP搜索优化');%画图
%     xlabel('迭代次数');
%     ylabel('目标函数值');

%     bestPath
%     bestValue
      values(i) = bestValue;
      picture(i,1) = i; %画图
      picture(i,2) = bestValue; %画图
end

    t = toc
    meant = t/run %平均时间
    meanvalues = mean(values) %平均目标函数值
    stdvalues = std(values)
    figure %画图
    plot(picture(:,1),picture(:,2),'b-.'); %画图
    title('模拟退火算法TSP搜索优化');%画图
    xlabel('运行次数');
    ylabel('目标函数值');

