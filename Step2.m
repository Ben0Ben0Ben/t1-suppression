function [spec2,yasuobili]=Step2(spec,noiselevel_value_col,standard_noiselevel_value,Std_value,machie_nosiselevel)
[row,col]=size(spec);
for k =1:col
    K0=standard_noiselevel_value/noiselevel_value_col(k);
    P0=machie_nosiselevel/noiselevel_value_col(k);
    x=spec(:,k);
    if k==305%
        a=1;
    end
    for i = 1 : row
        w1(i)=Logistic(Std_value(i,k),noiselevel_value_col(k),K0,P0);
        z(i)=x(i)*w1(i);
    end
    spec2(:,k)=z;
    yasuobili(:,k)=w1;
end