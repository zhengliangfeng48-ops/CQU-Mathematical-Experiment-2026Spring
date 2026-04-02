res=0;
for x1=1:6
    for x2=1:6
        for x3=1:6
            for x4=1:6
                for x5=1:6
                    istrue=true;
                    if length(unique([x1,x2,x3,x4,x5]))<3
                        istrue=false;
                    end
                    if(abs(x1-x2)==5||abs(x2-x3)==5||abs(x3-x4)==5||abs(x4-x5)==5)
                        istrue=false;
                    end
                    if istrue
                        res=res+1;
                    end
                end
            end
        end
    end
end
res