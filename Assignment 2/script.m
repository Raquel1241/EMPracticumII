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
Eta_r		= Eta*Eta_0;
% Dist. betw. ant.
dist		= 4.944787189721646;	% [m]
% Reflector height
refl_h		= [0.249086409246808;0.424005836543405;0.598925263840002];

%% (1.4)
% Good examples (with graphic depictions) to show the working functions.
%	Brewster ange:	R = 5
%					H = 1.7243
%					theta	tau		R	H
%[th,ta,R,H] 
inp			=	   [0,		0,		5,	1.7243;...
					0.5*pi, 0,		5,	1.7243;...
					0,		0.25*pi,5,	1.7243;...
					0.1*pi,		0.2*pi,5,	0.001;...
					0.1*pi,		0.2*pi,5,	1000]; % Create 5 situations.
Ah			= [1,1/1.6331e16,1,1,1]; % Get amplitudes so that A0 is 1
tit			=  ["Horizontally polarized at brewster angle";
				"Vertically polarized at brewster angle";
				"Circularly polarized at brewster angle";
				"Circularly polarized with reflector nearly at transmitter level";
				"Circularly polarized with reflector very far away"]; % make plot titles
for i = 1:5
	recP(i) = rPol(frequency,inp(i,1),inp(i,2),inp(i,3),inp(i,4),Eta_r);
	%--------
	%     RECIEVED		|     DIRECT	|    SENT
	% [Eh_rec,Ev_rec	,Eh_dir,Ev_dir	,Eh_ref,Ev_ref]
	%[E(i,1),E(i,2),E(i,3),E(i,4),E(i,5),E(i,6)] = eRec(Ah(i),frequency,inp(i,1),inp(i,2),inp(i,3),inp(i,4),Eta_0,Eta_r);
	
	[Eh_rec(i,:),Ev_rec(i,:),Eh_dir(i,:),Ev_dir(i,:),Eh_ref(i,:),Ev_ref(i,:)] = recEll(Ah(i),frequency,inp(i,1),inp(i,2),inp(i,3),inp(i,4),Eta_0,Eta_r,0);
	plot(real(Eh_ref(i,:)),real(Ev_ref(i,:)),'-*y','MarkerEdgeColor',[0.8500 0.3250 0.0980]);
	hold on;
	[X,Y] = ellipse(1,inp(i,1),inp(i,2),100);
	plot(X,Y,'-b');
	plot(real(Eh_rec(i,:)),real(Ev_rec(i,:)),'-k');
	legend("Reflected part of the signal","Transmit polarization visualization","Recieve polarization visualization");
	title(tit(i,:));
	grid on;
	xlim([-1.5 1.5]);
	%xlim([-0.5e-16 0.5e-16]);
	xlabel("E_H");
	ylim([-1.5 1.5]);
	ylabel("E_V");
	figure;
end

%% (1.5)
% Plot Fresnel reflection coefficients vs incident angle for provided
% dielectric permittivity | find the Brewster angle,
% th_i	= -0.25*pi - atan(R0/(2*H));
angle	= linspace(0,0.5*pi,1000);
for i = 1:1000
	[Gamma(i,1),Gamma(i,2)]	= fRefl(Eta_0,Eta_r,angle(i)); % [Gh,Gv]
end
Gamma(:,3)	= angle;

[~,i_v]	= min(Gamma(:,2));
ang_brew	= (Gamma(i_v,3)/pi)*180;	% Brewster angle

% Plot the reflection coefficients
plot(Gamma(:,3)/pi,abs(Gamma(:,1)),Gamma(:,3)/pi,abs(Gamma(:,2)),[Gamma(i_v,3)/pi,Gamma(i_v,3)/pi],[0 1],'--k');
legend('Gamma_H','Gamma_V','Brewster angle');
ylim([0 1]);
xlabel('Angle \theta [pi*rad]');
ylabel('Reflection coefficient []');
grid on;

clear i i_v angle;
