function [ind] = findCell(x,xR)
    ind = zeros(length(x),1);
    
    for i = 1:length(x)
       temp  = xR - x(i);
       ind(i) = find(temp == min(temp(find(temp >= 0))));
    end
    
end