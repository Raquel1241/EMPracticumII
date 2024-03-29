function [X,Y] = ellipse(Amp,Theta,Tau,n)
%ELLIPSE Get X and Y points of an ellipse
%   Make X and Y points of an ellipse with:
%	-----
%	Amp		= Amplitude
%	Theta	= Angle from horizon	[     -pi		  pi]
%	Tau		= Ellipticness			[-0.25*pi	 0.25*pi]
%	n		= Amount of data points 

t		= linspace(0,2*pi,n);
% Tau		= 0.1*pi;
a		= Amp;
b		= a*tan(Tau);

% Theta	= 0.05*pi;
c = cos(Theta);
if c < 1e-16  % to work with the limit
  c = 0;
end

X		= a*cos(t)*c - b*sin(t)*sin(Theta);
Y		= a*cos(t)*sin(Theta) + b*sin(t)*c;

end