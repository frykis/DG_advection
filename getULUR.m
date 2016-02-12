function [UL,UR] = getULUR(Uold)
    UL = Uold(1:2:end-1);
    UR = Uold(1:2:end-1) + Uold(2:2:end);
    
  