best2num1=0;best2num2=0;
minD=inf;
for num1=1:99
    for num2=1:99
        now=num1/num2;
        D=abs(now-pi);
        if D<minD
            minD=D;
            best2num1=num1;
            best2num2=num2;
        end
    end
end
fprintf('%d/%d\n',best2num1,best2num2);

best3num1=0;best3num2=0;minD=inf;
for num1=1:999
    for num2=1:999
        now=num1/num2;
        D=abs(now-pi);
        if D<minD
            minD=D;
            best3num1=num1;
            best3num2=num2;
        end
    end
end
fprintf('%d/%d\n',best3num1,best3num2);

best4num1=0;best4num2=0;minD=inf;
for num1=1:9999
    for num2=1:9999
        now=num1/num2;
        D=abs(now-pi);
        if D<minD
            minD=D;
            best4num1=num1;
            best4num2=num2;
        end
    end
end
fprintf('%d/%d\n',best4num1,best4num2);