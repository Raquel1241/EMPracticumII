function [Erh, Erv, Eh_dir, Ev_dir, Eh_ref, Ev_ref] = recEll(Ah,f,theta_t,tau_t,
                                                             R0,H,eta_0,eta_r)
%RECELL Summary of this function goes here
%   The recieves EM wave properties are calculated here. These are the time
%   sampled values over one full wavelength. From the direc+reflection,
%   direct only and reflection only signals.
th		= atan(R0/(2*H));
[Gh,Gv]	= fRefl(eta_0,eta_r,th);
dR		= 2*sqrt(H^2 + 0.25*R0^2) - R0;

c		= 299792458;				% [m/s]	Lightspeed
lamb	= c/f;						% [m]	Wavelength
k		= 2*pi/lamb;				% []	Using variable
pT		= pRatio(theta_t,tau_t);

omega	= 2*pi*f;
t		= linspace(0,lamb,9000);
Erh		= R0 / (dR+R0) * Ah*exp(-1i*(omega*t-k*R0))*(1+Gh*exp(1i*k*dR));
Erv		= R0 / (dR+R0) * Ah*exp(-1i*(omega*t-k*R0))*(pRatio(theta_t,tau_t) +
        Gv*pRatio(theta_t,tau_t)*exp(1i*k*dR));

Eh_ref	= Ah*exp(-1i*(omega*t-k*R0))*(Gh*exp(1i*k*dR));
Ev_ref	= Ah*exp(-1i*(omega*t-k*R0))*(Gv*pRatio(theta_t,tau_t)*exp(1i*k*dR));

Gh		= 0;
Gv		= 0;
Eh_dir	= Ah*exp(-1i*(omega*t-k*R0));
Ev_dir	= Ah*exp(-1i*(omega*t-k*R0))*pRatio(theta_t,tau_t);

end