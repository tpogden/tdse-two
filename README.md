# Time-Dependent Schrödinger Equation Solver for Light Interacting with a Two-Level Atom

by T P Ogden <t.p.ogden@durham.ac.uk>

## What is this?

This Matlab code solves the time-dependent Schrödinger equation for light interacting with a two-level atom in the rotating wave approximation.

Define the Rabi frequency, detuning and pulse duration of the laser and the initial population of atom levels and the code will solve the system with a Runge-Kutta method. It will plot the population vs time and save the data in a CSV file.

## How do I use it?

Open the folder in Matlab and run a test, e.g.

    >> tdse_two_pulse_test_a
	
## Examples

These example tests are included:

- Pulse Test A: 2π pulse
- Pulse Test B: 2π pulse with detuning
- Pulse Test C: ½π pulse

You can make your own tests by copying an existing one and changing the _Parameters_ section.