%%
%Head script for 1D GD for 
close all
clear all

a = 10; %Convection speed
N = 100;
T = 10;
xx = linspace(0,1,N+1);
%xx = xx(1:end-1);
dx = 1/(N);
dt = dx*0.3/abs(a); %CFL-condition

time = linspace(0,T,ceil(T/dt));

%Element index correspons to cell index.
xL = xx(1:end-1);
xR = xx(2:end);

xM = (xL + xR)/2;


%Reach element i coefficients with [U((i-1)*2 +1), U((i-1)*2 + 2)].
U = zeros(2*N,1);
Uold = U;
%Uold(6,1) = 1;
%Uold(7,1) = 1;
%Uold(8,1) = -1;

% Uold(1,1) = 1;

Uold(10) = 1;
Uold(11) = 1;
Uold(12) = -1;


Unew = zeros(2*N,1);
x = linspace(0,1,100);
plotDGsol(Uold,x,xR,xL)
% figure(2)
% hold on

% for i = 1:length(time)
%     update = DG_solver(Uold,xR,xL,xM,a);
%     Unew = Uold + dt*update;
%     Uold = Unew;
% %     pause(0.1)
% %     figure(2)
% %     plotDGsol(Uold,x,xR,xL)
% end
figure(2); hold on
for i = 1:length(time)
    update = DG_solver(Uold,xR,xL,xM,a);
    k1 = Uold + dt*update;
    update = DG_solver(k1,xR,xL,xM,a);
    Unew = 0.5*Uold + 0.5*(k1+dt*update);
    
    Uold = Unew;
    
%     pause(0.1)
    figure(2)
    plotDGsol(Uold,x,xR,xL)
    drawnow
end



figure(3)
hold on
plotDGsol(Uold,x,xR,xL)
%U((cellIndex -1)*2 + 1)
%plot(xx(1:end-1), Uold(1:2:end-1),'*')
% plotDGsol(Uold,x,xR,xL)
