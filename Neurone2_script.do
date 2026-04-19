# Modelsim simulation script for two neurons with different weights
# Compares behavior of two neurons fed with the same inputs

# 1. Compile source files
vcom pack_neurone_N4.vhd
vcom Neurone_N4.vhd
vcom Neurone2_tb.vhd

# 2. Start simulation
vsim work.Neurone2_tb

configure wave -namecolwidth 150
configure wave -valuecolwidth 50
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns

# 3. Configure waveform window
add wave -divider "Common Inputs"
add wave /Neurone2_tb/Xi_tb

add wave -divider "Neuron 1 (Arbitrary weights: 18,32,21,45)"
add wave /Neurone2_tb/NEURONE1_TEST/Y
add wave /Neurone2_tb/Z1_tb

add wave -divider "Neuron 2 (Arbitrary weights: 35,20,40,15)"
add wave /Neurone2_tb/NEURONE2_TEST/Y
add wave /Neurone2_tb/Z2_tb

# 4. Run simulation
# Total time: 1 + 6*20 = 121 ns
run 121 ns
wave zoom range 0ns 121ns