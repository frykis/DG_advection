function [] = plotDGsol(U,x,xR,xL)


Uplot = zeros(length(x),1);
cellIndexVec = findCell(x,xR);

for i=1:length(x)
       cellIndex = cellIndexVec(i);
       Uplot(i) = U((cellIndex -1)*2 + 1) + U((cellIndex -1)*2 + 2)*(x(i) - xL(cellIndex))/(xR(cellIndex) - xL(cellIndex));
end

% plot(x,Uplot,'*')
plot(x,Uplot)