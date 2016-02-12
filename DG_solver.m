function update = DG_solver(Uold,xR,xL,xM,a)
    dx = xR(1) - xL(1);
    N = length(Uold)/2;
    Minv = getMinv(dx);
    Mv = getMv;
    [MsL,MsR] = getMs;
    [fL,fR] = getNumericalFlux(Uold,a);
       
    update = 0*Uold;
    for i = 1:N
        update((i-1)*2 + 1:(i-1)*2 + 2) = Minv*Mv*([a a*(xM(i) - xL(i))/dx]*Uold((i-1)*2+1:(i-1)*2+2))*[1;1] -...
            Minv*(MsL*fL(i)*[1;1] + MsR*fR(i)*[1;1]);        
    end
end