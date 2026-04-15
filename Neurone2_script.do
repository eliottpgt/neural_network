# Script .do pour la simulation du Noeud (node_tb)

# 1. Lancement de la simulation
vsim work.Neurone2_tb

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

# 2. Configuration et ouverture de la fenêtre de chronogramme (Wave)
# Ajoute tous les signaux de l'architecture 'tb_architecture' dans la fenêtre 'wave'
add wave -divider "Entrees"
add wave /Neurone2_tb/Xi_tb

# Ajoute les signaux de sortie
add wave -divider "Sorties"
add wave /Neurone2_tb/Z1_tb
add wave /Neurone2_tb/Z2_tb

# 3. Lancement de la simulation
# Exécute la simulation jusqu'à 300 ns pour couvrir tous les stimuli
run 300 ns
wave zoom range 0ns 300ns