function [noiselevel_value_col,standard_noiselevel_value,noiselevel_level_col,index,Std_level,Std_value,machie_nosiselevel]=Step1(spec,sgept)
[row,col]=size(spec);
for Index = 1 : col
    x=spec(:,Index);
    Std=zeros(row,1);X=zeros(row,1);
    for i = 1 : sgept
        Std(i)=std(x(1:i+sgept));
    end
    for i = sgept+1:row-sgept
        Std(i)=std(x(i-sgept:i+sgept));
    end
    for i = row-sgept+1:row
        Std(i)=std(x(i-sgept:row));
    end
%     Std=spec(:,Index);
    range=-mean(Std):max(2*mean(Std)/100,prctile(Std,50)*2):mean(Std);
    range=[range,mean(Std)];
    for k=range
        M=mean(Std)+k;
        for i = 1 : row
            if Std(i)>M
                X(i)=X(i)+1;
            end
        end
    end
    PM=mode(X);
if PM+2<=length(range)
    P=mean(Std)+range(PM+2);
else
    P=mean(Std)+range(end);
end

    noiselevel_value_col(Index)=P;
    noiselevel_level_col(Index)=PM;
    Std_level(:,Index)=X;
    Std_value(:,Index)=Std;

end
[standard_noiselevel_value,index]=min(noiselevel_value_col);
[machie_nosiselevel]=prctile(min(Std_value),2);