function [ geom ] = poligonos( x, y ) 
%% Calcula el ?rea y centroide de cualquier pol?gono.
%% F?rmula del Area (Gauss)
sum=0;
sum1=0;
for i=1:length(x)
    j=i+1;
    if j==length(x)+1
        j=1;
    end
    sum=sum+x(i)*y(j);
    sum1=sum1+y(i)*x(j);
end
Area=(sum-sum1)/2;
%% Centroides
sum=0;
sum1=0;
sum2=0;
sum3=0;
for i=1:length(x)
    j=i+1;
    if j==length(x)+1
        j=1;
    end
    sum=sum+x(i)*y(j)*(x(i)+x(j));
    sum1=sum1+y(i)*x(j)*(x(i)+x(j));
    
    sum2=sum2+x(i)*y(j)*(y(i)+y(j));
    sum3=sum3+y(i)*x(j)*(y(i)+y(j));
    
end
geom(1)=abs(Area);
geom(2)=(sum-sum1)/(6*Area);
geom(3)=(sum2-sum3)/(6*Area);
end