# Language Competition Simulator

This is the repo for programs that simulate competition using evolutionary dynamics. These programs specifically deal with competition between an newly introduced language to a homogeneous population of one language (instead of languages, one can interpret these as oterh traits). These simulations assume that the mutual intelligibility between two languages is proportional to the propability of language acquisition. 

In `PopulationSimulation`, there is a Mathematica file that solves the ODE and plots the population shares over time, assuming that every person in the population communicates with every other. There is a Matlab file that generates random Bernoulli graphs and simulates games on graphs to plot the population shares over time. 

In `GraphEvolutionSimulator`, there is a program that allows the user to modify graphs and perform simulations for evolutionary games on the graph, using the same mathematical model. This is still a work in progress. 
