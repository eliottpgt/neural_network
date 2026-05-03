# Script .do pour la simulation du Network

# 1. Lancement de la simulation
vsim work.test_network

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
add wave /test_network/Vect_X_in

add wave -divider "Poids Couche 1"
add wave -label "Neurone 1" /Test_network/Net/GEN_LAYERS(0)/GEN_NEURONES(1)/U_NEURONE/Wi
add wave -label "Neurone 2" /Test_network/Net/GEN_LAYERS(0)/GEN_NEURONES(2)/U_NEURONE/Wi
add wave -label "Neurone 3" /Test_network/Net/GEN_LAYERS(0)/GEN_NEURONES(3)/U_NEURONE/Wi
add wave -label "Neurone 4" /Test_network/Net/GEN_LAYERS(0)/GEN_NEURONES(4)/U_NEURONE/Wi
add wave -label "Neurone 5" /Test_network/Net/GEN_LAYERS(0)/GEN_NEURONES(5)/U_NEURONE/Wi
add wave -label "Neurone 6" /Test_network/Net/GEN_LAYERS(0)/GEN_NEURONES(6)/U_NEURONE/Wi
add wave -label "Neurone 7" /Test_network/Net/GEN_LAYERS(0)/GEN_NEURONES(7)/U_NEURONE/Wi
add wave -label "Neurone 8" /Test_network/Net/GEN_LAYERS(0)/GEN_NEURONES(8)/U_NEURONE/Wi

add wave -divider "Couche 1"
add wave /Test_network/Net/pipe(1)

add wave -divider "Poids Couche 2"
add wave -label "Neurone 1" /Test_network/Net/GEN_LAYERS(1)/GEN_NEURONES(1)/U_NEURONE/Wi
add wave -label "Neurone 2" /Test_network/Net/GEN_LAYERS(1)/GEN_NEURONES(2)/U_NEURONE/Wi
add wave -label "Neurone 3" /Test_network/Net/GEN_LAYERS(1)/GEN_NEURONES(3)/U_NEURONE/Wi
add wave -label "Neurone 4" /Test_network/Net/GEN_LAYERS(1)/GEN_NEURONES(4)/U_NEURONE/Wi

add wave -divider "Couche 2"
add wave /Test_network/Net/pipe(2)

# Ajoute les signaux de sortie
add wave -divider "Sorties"
add wave /test_network/Vect_Z_out

# 3. Lancement de la simulation
# Exécute la simulation jusqu'à 300 ns pour couvrir tous les stimuli
run 300 ns
wave zoomfull