function [Pr] = rPol(f,theta_t,tau_t,R0,H,eta_r)
%RPOL Calculate the recieved signal polarization with certain parameters
%(1.3)
%   EMW frequency (f), 
%	polarization parameters of transmitted wave (theta_t,tau_t), 
%	scene geometry (distance between antennas) (R0), 
%	their heights and height of reflection plate (H), 
%	related reflection coefficients of the reflection plate (eta_r)
%----------------------------------------------------------------
%	Input options:
%	f,theta_t,tau_t,R0,H,eta_r
c		= 299792458;				% [m/s]	Lightspeed
lamb	= c/f;						% [m]	Wavelength
k		= 2*pi/lamb;				% []	Using variable
alpha	= 0.5*pi - atan(R0/(2*H));	% [rad]	Incident angle reflector
eta_0	= 8.8541878176*10^-12;		% [F/m]	Free space permittivity
R1		= 2*sqrt(H^2 + 0.25*R0^2);	% [m]	Path length reflection

% Gamma_h	= (cos(theta_t)-sqrt(eta_r/eta_0 - sin(theta_t)^2))/(cos(theta_t)+sqrt(eta_r/eta_0 - sin(theta_t)^2));
% Gamma_v	= -(eta_r*cos(theta_t)-eta_0*sqrt(eta_r/eta_0 - sin(theta_t)^2))/(eta_r*cos(theta_t)+eta_0*sqrt(eta_r/eta_0 - sin(theta_t)^2));

theta_i				= -0.25*pi - atan(R0/(2*H));
[Gamma_h, Gamma_v]	= fRefl(eta_0,eta_1,theta_i);

Pr		= pRatio(theta_t,tau_t) * (1+Gamma_v*e^(1i*k*(R1-R0)))/(1+Gamma_h*e^(1i*k*(R1-R0)));

end