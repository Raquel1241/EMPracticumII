function [theta_r,tau_r] = rPol(f,theta_t,tau_t,R0,H,eta_r)
%RPOL Calculate the recieved signal polarization with certain parameters
%   EMW frequency, 
%	polarization parameters of transmitted wave, 
%	scene geometry (distance between antennas, 
%	their heights and height of reflection plate, 
%	incident angle) and 
%	related reflection coefficients of the reflection plate
%----------------------------------------------------------------
%	Input options:
%	f,theta_t,tau_t,R0,H,eta_r
c		= 299792458;	% [m/s]	Lightspeed
lamb	= c/f;			% [m]	Wavelength
k		= 2*pi/lamb;	% []	Using variable


end