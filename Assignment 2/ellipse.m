function [X,Y] = ellipse(Amp,Theta,Tau,n)
%ELLIPSE Get X and Y points of an ellipse
%   Make X and Y points of an ellipse with:
%	-----
%	Amp		= Amplitude
%	Theta	= Angle from horizon	[0		2*pi]
%	Tau		= Ellipticness			[0	 0.25*pi]
%	n		= Amount of data points 

t		= linspace(0,2*pi,n);
% Tau		= 0.1*pi;
a		= Amp;
b		= a*tan(Tau);
% Theta	= 0.05*pi;
X		= a*cos(t)*cos(Theta) - b*sin(t)*sin(Theta);
Y		= a*cos(t)*sin(Theta) + b*sin(t)*cos(Theta);

end

