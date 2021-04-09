function [H,ang_brew] = brewster(Eta_0,Eta_r,d)
% brewster - finds the brewster angle and corresponding reflector plate height
% differencefrom the antenna using the Eta_0 (permittivity of free space) and
% Eta_r (absolute permittivity of the reflector plate) and the antenna separation
% as input
% From the code used in (1.5)
% Plot Fresnel reflection coefficients vs incident angle for provided
% dielectric permittivity | find the Brewster angle,
angle	= linspace(0,0.5*pi,1000);

for i = 1:1000
	[Gamma(i,1),Gamma(i,2)]	= fRefl(Eta_0,Eta_r,angle(i)); % [Gh,Gv]
end

Gamma(:,3)	= angle;

[~,i_v]	= min(Gamma(:,2));
ang_brew	= (Gamma(i_v,3)/pi)*180;	% Brewster angle

H = 0.5*d/tan(ang_brew*pi/180);

end
