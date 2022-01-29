

%根据传进来的cityNum个交换位置得到ctiyNum个邻域解
function newpath = swap(oldpath,number ,position)
    m = length(oldpath);
    newpath = zeros(number,m);
    for i = 1:number
        newpath(i,:) = oldpath;
        newpath(i,position(i,1)) = oldpath(position(i,2));
        newpath(i,position(i,2)) = oldpath(position(i,1));
    end
    