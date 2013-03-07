function [t,phi] = tdse_two_pulse(p_in)
% TDSE_TWO_PULSE  Solves the TDSE in a square-pulsed laser field with detuning using tdse_two.  
%
% In:       p_in.init_pop       num(2,1)    [] Initial wavefunction
%           p_in.Omega_21       num         [2pi MHz] Rabi frequency coupling states
%           p_in.Delta_21       num         [2pi MHz] Detuning
%           p_in.pulse_duration num         [탎] Duration of the pulse
%           p_in.duration       num         [탎] Duration of the solution
%           
% Out:      t                   num(1,:)    [탎] Time vector 
%           phi                 num(2,:)    [] Wavefunction in two-state basis
 
%% Rabi frequency and detuning as functions of time

p.Omega_21_f = @(t) p_in.Omega_21*(t <= p_in.pulse_duration); % Rabi frequency, square pulse
p.Delta_21_f = @(t) p_in.Delta_21; % detuning, constant

%% Set time domain and initial conditions
t_span = [0 p_in.duration]; % [탎]

init_cond = [p_in.init_pop(1) p_in.init_pop(2)]'; % initial populations

options = odeset('RelTol',1e-5);

%% Solve ODE with Runge-Kutta method

[t,phi] = ode23s(@(t,y) tdse_two(t,y,p), t_span, init_cond, options);