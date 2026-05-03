# Script .do pour la simulation du Network

# 1. Lancement de la simulation
vsim work.Test_network_NbLayers_3

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
add wave /Test_network_NbLayers_3/Vect_X_in

add wave -divider "Couches intermédiaires"
add wave /Test_network_NbLayers_3/Net/pipe(1)
add wave /Test_network_NbLayers_3/Net/pipe(2)

# Ajoute les signaux de sortie
add wave -divider "Sorties"
add wave /Test_network_NbLayers_3/Vect_Z_out

# 3. Lancement de la simulation
# Exécute la simulation jusqu'à 300 ns pour couvrir tous les stimuli
run 300 ns
wave zoomfull