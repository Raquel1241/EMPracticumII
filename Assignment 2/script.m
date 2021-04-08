%% Setup of variables
% 1.1	=>	[p] = pRatio(theta,tau)
% 1.2	=>	[Gamma_H,Gamma_V] = fRefl(E1,E2,Theta_i)
% 1.3	=>	[Pr] = rPol(f,theta_t,tau_t,R0,H,eta_r)

clear;
close all;

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

%% (1.4)
% Good examples (with graphic depictions) to show the working functions.


%% (1.5)
% Plot Fresnel reflection coefficients vs incident angle for provided
% dielectric permittivity | find the Brewster angle,
% th_i	= -0.25*pi - atan(R0/(2*H));
angle	= linspace(0,0.5*pi,1000);
for i = 1:1000
	[Gamma(i,1),Gamma(i,2)]	= fRefl(Eta_0,Eta*Eta_0,angle(i)); % [Gh,Gv]
end
Gamma(:,3)	= angle;

[~,i_v]	= min(Gamma(:,2));
ang_brew	= (Gamma(i_v,3)/pi)*180;	% Brewster angle

% Plot the reflection coeefficients
plot(Gamma(:,3)/pi,abs(Gamma(:,1)),Gamma(:,3)/pi,abs(Gamma(:,2)),[Gamma(i_v,3)/pi,Gamma(i_v,3)/pi],[0 1],'--k');
legend('Gamma_H','Gamma_V','Brewster angle');
ylim([0 1]);
xlabel('Angle [pi*rad]');
ylabel('Reflection coefficient []');
grid on;

%% Assignment 2 Part 2
%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 2 Part 2 %
%%%%%%%%%%%%%%%%%%%%%%%

%% Garbage collection
close;