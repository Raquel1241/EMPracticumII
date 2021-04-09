%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 2 Part 2 %
%%%%%%%%%%%%%%%%%%%%%%%

%% Garbage collection
close all;
clearvars;

%tau = 0;  % set tau in radians (linear polarization: 0)
%tau = 0.25*pi;  % set tau in radians (circular polarization: 0.25*pi)
tau = 0.15*pi;  % set tau in radians
A_0 = 1;  % transmitted signal amplitude
%phi = 0.5*pi;  % set phi in radians (vertical polarization: 0.5*pi)
%phi = 0;  % set phi in radians (horizontal polarization: 0)
%phi = 0.25*pi;  % set phi in radians
phi = 0.2*pi;  % set phi in radians
eps_0 = 8.8541878176*10^-12;	% free space permittivity [F/m]
n = 100;  % number of data points

multipath = 1;  % switch: direct or multipath
metal = 0;  % switch: dielectric or metal reflector surface
brewster_switch = 1;  % switch: use brewster angle on dielectric plate
                      % with circular polarization

% load the data
load('group-05.mat');
task2 = session2.task2;

f = task2.frequency;  % frequency from measurement data
eps_r = eps_0 * task2.dielectric_prermittivity;  % dielectric permittivity of
                                         % the reflective surface
                                         % from measurement
R_0 = task2.antennas_distance;  % load the distance between antennas

if brewster_switch == 0
  H = task2.reflection_height(1);  % height between line of sight
                                  % and reflection surface
else
  [H,brewster_ang] = brewster(eps_0, eps_r, R_0)
  tau = 0.25*pi;  % set tau in radians (circular polarization: 0.25*pi)
  %tau = 0;
  phi = 0;  % reset phi to 0
  %phi = 0.5*pi;
  multipath = 1;  % switch: direct or multipath (1 for brewster)
  metal = 0;  % switch: dielectric or metal reflector surface (0 for brewster)
end

A_H = A_0/R_0;

if multipath == 0
  [~, ~, Eh_dir, Ev_dir, ~, ~] = recEll(A_H, f, phi, tau, R_0,
                                        H, eps_0, eps_r, metal);
  Erh = Eh_dir;
  Erv = Ev_dir;
else
  [Erh, Erv, Eh_dir, Ev_dir, Eh_ref, Ev_ref] = recEll(A_H, f, phi, tau, R_0,
                                                      H, eps_0, eps_r, metal);
  %Erh = Eh_ref;
  %Erv = Ev_ref;
end

[X, Y] = ellipse(A_0, phi, tau, n);  % obtain ellipse points for input wave

% scaling Erh and Erv based on the dominant component
if (phi > 0.25*pi && phi < 0.75*pi) || (phi < -0.25*pi && phi > -0.75*pi)
  Erh_norm = Erh./max(Erv) * A_H;
  Erv_norm = Erv./max(Erv) * A_H;
else
  Erh_norm = Erh./max(Erh) * A_H;
  Erv_norm = Erv./max(Erh) * A_H;
end

Erh_norm(Erh_norm<1e-16) = 0;  % to work with the limits
Erv_norm(Erv_norm<1e-16) = 0;

% generate plots of polarization patterns of the transmitted and received waves
figure;
hold on;
plot(X, Y, '-b');
hold on;
plot(real(Erh_norm), real(Erv_norm), '-r');
grid on;
hold off;
