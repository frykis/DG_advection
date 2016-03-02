function [fL,fR] = getNumericalFlux(Uold,a)
    [UL,UR] = getULUR(Uold);
    
%     fL = a*(UL  + circshift(UR,1))/2 + a*(-UL + circshift(UR,1))/2;
%     fR = a*(UR  + circshift(UL,-1))/2 + a*(UR - circshift(UL,-1))/2;
%     
   fL = a*circshift(UR,1);
   fR = a*UR;
end