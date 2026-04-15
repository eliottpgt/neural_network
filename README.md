# Neural Network - Neurone Module (Modelsim Simulation)

## Overview
This branch contains the **neurone simulation** part of the neural network project. It focuses on modeling and testing a single neuron entity using VHDL and Modelsim simulation.

## Project Context (Subject Reference)
This branch corresponds to **Part I - Étude d'une neurone** of the project:
- Modeling under Modelsim
- Analysis of neuron behavior with configurable weights
- Support for different input dimensions (N=4, N=8)
- Testing with testbenches

## Files Description
- `Neurone.vhd` - Neuron entity with parametrizable weights (Wi)
- `pack_neurones.vhd` - Package containing types and constants
- `Neurone_script.do` - Modelsim simulation script for neuron testing
- `Neurone_tb.vhd` - Testbench for neuron validation
- `Neurone2_script.do` - Alternative simulation script (dual neuron)
- `Neurone2_tb.vhd` - Testbench for dual neuron configuration

## Usage
To run simulations in Modelsim:
```bash
vsim -do Neurone_script.do
```

## Related Branches
- `modelsim/network` - Complete neural network with multiple neurons
- `quartus/*` - FPGA synthesis and implementation variants