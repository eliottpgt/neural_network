# Script .do pour la simulation du Neurone avec N=4

# 1. Compilation des fichiers
vcom pack_neurone_N4.vhd
vcom Neurone_N4.vhd
vcom Neurone_N4_tb.vhd

# 2. Lancement de la simulation
vsim work.Neurone_N4_tb

configure wave -namecolwidth 120
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

# 3. Configuration et ouverture de la fenêtre de chronogramme (Wave)
# Ajoute tous les signaux de l'architecture 'tb_architecture' dans la fenêtre 'wave'
add wave -divider "Entrees"
add wave /Neurone_N4_tb/Xi_tb

# Ajoute les signaux internes
add wave -divider "Internes"
add wave /Neurone_N4_tb/NEURONE_TEST/Y

# Ajoute les signaux de sortie
add wave -divider "Sorties"
add wave /Neurone_N4_tb/Z_tb

# 4. Lancement de la simulation
# Exécute la simulation jusqu'à 100 ns pour couvrir tous les stimuli
run 100 ns
wave zoom range 0ns 100ns