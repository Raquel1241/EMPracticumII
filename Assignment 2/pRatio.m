function [p] = pRatio(theta,tau)
%PRATIO Calculate the polarization ratio from theta and tau.
%   The polarization ratio p is calculated from theta and tau. This ratio
%   is to compute the E-field by setting the horizontal amplitude to 1 and
%   the vertical amplitude to p. This vector is then multiplied by the
%   Ah (horizontal amplitude) and e^(j(omega*t-k*r+delta_h)); or that
%   vector is multiplied by Eh (the horizontal field) and
%   e^(j(omega*t-k*r)).
%	
%	The function returns (-)Inf if theta is .5*pi+k*pi.
%	Theta has to be between		-pi		and		pi
%	Tau has to be between		-.25*pi and		.25*pi.
r_val = [];				% Create the temporary storage of the return value
	% Inf is aproximated by a significantly high value bu the tan()
	% function.
r_val = (tan(theta)+1i*tan(tau))/(1-1i*(tan(theta)*tan(tau)));
p = r_val;
end

function [theta,tau] = revPRatio(p)
%REVPRATIO The reverse operation of pRatio(), returns [theta,tau]

end