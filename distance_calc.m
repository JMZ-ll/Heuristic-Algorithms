
%%计算一堆路径的长度
    function distanV = distance_calc(distmat,path)
    [m,n] = size(path);
    distanV = zeros(1,m);
    for i = 1:m
        for j = 2:n
            distanV(i) = distanV(i)+distmat(path(i,j-1),path(i,j));
        end
        distanV(i) = distanV(i) + distmat(path(i,n),path(i,1));
    end