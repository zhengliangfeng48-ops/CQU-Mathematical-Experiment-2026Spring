for i=3:6
    begnum=10^(i-1);
    endnum=10^i-1;
    for x=begnum:endnum
        digits=num2str(x)-'0';
        nowsum=sum(digits.^i);
        if nowsum==x
            fprintf('%d\n',x);
        end
    end
end

    