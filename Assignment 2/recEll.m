function [X,Y] = recEll(Ah,f,theta_t,tau_t,R0,H,eta_0,eta_r)
%RECELL Summary of this function goes here
%   Detailed explanation goes here
th		= atan(R0/(2*H));
[Gh,Gv]	= fRefl(eta_0,eta_r,th);
dR		= 2*sqrt(H^2 + 0.25*R0^2) - R0;

c		= 299792458;				% [m/s]	Lightspeed
lamb	= c/f;						% [m]	Wavelength
k		= 2*pi/lamb;				% []	Using variable
pT		= pRatio(theta_t,tau_t);

omega	= 2*pi*f;
t		= linspace(0,lamb,10);
Erh		= Ah*exp(-1i*(omega*t-k*R0))*(Gh*exp(1i*k*dR));
Erv		= Ah*exp(-1i*(omega*t-k*R0))*(pRatio(theta_t,tau_t)+Gv*pRatio(theta_t,tau_t)*exp(1i*k*dR));

X = abs(Erh);
Y = abs(Erv);
end

