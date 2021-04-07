%%
% 1.1	=>	[p] = pRatio(theta,tau)
% 1.2	=>	[Gamma_H,Gamma_V] = fRefl(E1,E2,Theta_i)
% 1.3	=>	[Pr] = rPol(f,theta_t,tau_t,R0,H,eta_r)
% 1.4	=>	
% 1.5	=>	

% Perm. Free Space
Eta_0		= 8.8541878176*10^-12;	% [F/m]
% Frequency
frequency	= 9.834534138168737e+09;	% [Hz]
% Dielectric perm.
Eta			= 2.099308860651484 - 0.019027161099153i;
% Dist. betw. ant.
dist		= 4.944787189721646;	% [m]
% Reflector height
refl_h		= [0.249086409246808;0.424005836543405;0.598925263840002];

%%
% Good examples (with graphic depictions) to show the working functions.

%%
% Plot Fresnel reflection coefficients vs incident angle for provided
% dielectric permittivity | find the Brewster angle,
% th_i	= -0.25*pi - atan(R0/(2*H));
angle	= linspace(0,0.25*pi,1000);
for i = 1:1000
	[Gamma(i,1),Gamma(i,2)]	= fRefl(Eta_0,Eta,angle(i));
end
Gamma(:,3) = angle;