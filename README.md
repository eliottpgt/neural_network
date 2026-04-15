# Neural Network - Complete Network on FPGA (Quartus Synthesis)

## Overview
This branch contains the **complete neural network implementation** for FPGA deployment on real hardware. It integrates synthesized neuron modules into a full network architecture with DE10-Lite FPGA deployment.

## Project Context (Subject Reference)
This branch corresponds to **Part II - Réseaux** of the project:
- Complete neural network FPGA synthesis under Quartus
- Multi-neuron layer integration
- Configurable depth (N=4 or N=8)
- Configurable input dimension
- DE10-Lite board deployment
- Hardware integration with peripherals (UART, LEDs, buttons, etc.)

## Features
- Full network architecture with parameterizable depth
- Optimized neuron modules (pipelined, synchronized)
- Hardware interfaces for FPGA board
- Memory-mapped registers for control and data
- Real-time inference capability

## Generic Parameters
- **Depth** - Neurons per layer (4 or 8)
- **Input_Size** - Network input dimension

## Target Hardware
- **Altera/Intel Cyclone V**: DE10-Lite FPGA board
- Quartus Prime compilation tools
- DE10-Lite Golden Reference Design as base

## Board Integration
- UART for communication
- On-board LEDs for output visualization
- Buttons for control inputs
- 7-segment displays for debug output

## Status
⚠️ **Work in Progress** - Full hardware integration phase

## Related Branches
- `modelsim/network` - Simulation and modeling
- `quartus/neurone-*` - Individual neuron synthesis variants
- `modelsim/neurone` - Neuron simulation reference
- `main` - Project documentation