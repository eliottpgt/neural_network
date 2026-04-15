# Neural Network - DE10-Lite FPGA Deployment

## Overview

This branch is dedicated to the **DE10-Lite FPGA platform deployment** of the complete neural network.

## Project Context (Subject Reference)

This branch corresponds to **Part II - 2. Intégration du réseau sur plateforme DE10-Lite** of the project:

- Porting the neural network to real FPGA hardware
- Integration with DE10-Lite board peripherals
- Hardware interface design with switches and displays

## TODO - Implementation Roadmap

- [ ] Create Top-level module with network instance
- [ ] Integrate dual DCB transcoders for output display
- [ ] Map SW(0-7) inputs: each provides MSB of Xi (values: 0 or 16)
- [ ] LED display for input visualization (SW states)
- [ ] Map 7-segment displays for output neurons (MSB only: 0 or 8)
- [ ] Hardware validation and testing
- [ ] Timing closure and optimization

## Target Hardware

- Altera/Intel Cyclone V: DE10-Lite FPGA board
- Quartus Prime compilation tools

## Related Branches

- `modelsim/network` - Network simulation and validation
- `quartus/neurone-*` - Individual neuron synthesis variants
- `modelsim/neurone` - Neuron simulation
