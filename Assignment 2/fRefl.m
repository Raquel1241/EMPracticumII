function [Gamma_H,Gamma_V] = fRefl(E1,E2,Theta_i)
%FREFL Fresnel reflection coefficients. [Gamma_H, Gamma_V] from E1, E2 and
%Theta_i (1.2)
%   Using the incident angle (Theta_i) and the permativities from the
%   media. Assumed is that the dielectrics are nonmagnetic. 
%	
%	Theta_i is between 0 and 0.5*pi
Ed = E2/E1;
sq = sqrt(Ed-sin(Theta_i)^2);
Gamma_H = (cos(Theta_i)-sq)/(cos(Theta_i)+sq);
Gamma_V = -(E2*cos(Theta_i)-E1*sq)/(E2*cos(Theta_i)+E1*sq);
end