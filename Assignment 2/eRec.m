function [Eh, Ev, Eh_dir, Ev_dir, Eh_ref, Ev_ref] = eRec(Ah,f,theta_t,tau_t,R0,H,eta_0,eta_r)
%EREC Recieved EMF amplitudes
%   Detailed explanation goes here

th		= atan(R0/(2*H));
[Gh,Gv]	= fRefl(eta_0,eta_r,th)
dR		= 2*sqrt(H^2 + 0.25*R0^2) - R0;

c		= 299792458;				% [m/s]	Lightspeed
lamb	= c/f;						% [m]	Wavelength
k		= 2*pi/lamb;				% []	Using variable
pT		= pRatio(theta_t,tau_t)

Eh		= Ah*(1+Gh*exp(1i*k*(dR)));
Ev		= Ah*pT*(1+Gv*exp(1i*k*(dR)));

Eh_dir	= Ah*1;
Ev_dir	= Ah*pT;

Eh_ref	= Ah*(Gh*exp(1i*k*(dR)));
Ev_ref	= Ah*pT*(Gv*exp(1i*k*(dR)));
end

