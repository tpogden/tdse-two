function [dphi_dt] = tdse_two(t,phi,p)
% TDSE_TWO  TDSE for a two-level system in the rotating wave approx.  
%
% In:       t               num         time
%           phi             num(1,2)    wavefunction vector    
%           p.Omega_21_f    function(t) Rabi frequency
%           p.Delta_21_f    function(t) Detuning
%           
% Out:      dphi_dt         num(1,4)    TDSE solution vector
%
% Author:   T P Ogden <t.p.ogden@durham.ac.uk>
%
% Notes:    Models  equations for two-level system, with functions
%           of time for Rabi frequency and detuning. See tdse_two_pulse for examples of use.
%
%           -- |2>
%           |
%           | Omega_21
%           |
%           -- |1>
%% Hamiltonian

hbar = 1; % it cancels anyway, but left in H and TDSE below for clarity.

Omega_21 = p.Omega_21_f(t); % Rabi Frequency (function of time)

Delta_21 = p.Delta_21_f(t); % Detuning function (function of time)

H = hbar*[         0 Omega_21/2; 
          Omega_21/2  -Delta_21]; % Hamiltonian

%% Time-dependent Schrödinger Equation

dphi_dt = -1i/hbar*H*phi;