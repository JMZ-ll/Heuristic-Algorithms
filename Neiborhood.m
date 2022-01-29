
%产生一组2-opt邻域交换位置,位置对数量同城市数量，交换两个城市得到邻域解，cityNum个邻域解
function newpaths = Neiborhood(oldpath,cityNum,neiborNum)
    m = length(oldpath);
    newpaths = zeros(neiborNum,m);
    ik = 1;
    NB = zeros(neiborNum,2);
    while ik<=neiborNum
        M = ceil(cityNum*rand(1,2));
        if M(1) ~=M(2)
            NB(ik,1) = min(M);
            NB(ik,2) = max(M);
            if ik ==1
                isdel = 0;
            else 
                for jk = 1:ik-1
                    if NB(ik,1) == NB(jk,1)&&NB(ik,2) == NB(jk,2)
                        isdel = 1;
                        break;
                    else
                        isdel = 0;
                    end
                end
            end
            if ~isdel
                newpaths(ik,:) = oldpath;
                newpaths(ik,NB(ik,1)) = oldpath(NB(ik,2));
                newpaths(ik,NB(ik,2)) = oldpath(NB(ik,1));
                ik = ik+1;
            else
                continue;
            end
        else
            continue;
        end
    end