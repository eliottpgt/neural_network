# Neural Network - Complete Network (Modelsim Simulation)

## Overview
This branch contains the **complete neural network simulation** part of the project. It models a multi-layer neural network with configurable architecture using VHDL and Modelsim simulation.

## Project Context (Subject Reference)
This branch corresponds to **Part II - Réseaux** of the project:
- Complete neural network modeling under Modelsim
- Support for configurable depth (N=4 or N=8)
- Support for configurable number of inputs
- Validation through testbenches
- Testing with simulation scripts

## Files Description
- `Network.vhd` - Complete neural network entity with generic parameters
- `Neurone.vhd` - Neuron entity used as building block
- `pack_neurones.vhd` - Package containing types and constants
- `Network_script.do` - Modelsim simulation script for network testing
- `Test_network.vhd` - Network testbench and validation

## Generic Parameters
- **Depth** - Number of neurons per layer (power of 2: 4 or 8)
- **Input_Size** - Number of inputs to the network

## Usage
To run network simulations in Modelsim:
```bash
vsim -do Network_script.do
```

## Related Branches
- `modelsim/neurone` - Single neuron simulation and testing
- `quartus/network` - FPGA synthesis and DE10-Lite deployment
- `quartus/*` - Various synthesis optimization variants