# Implémentation d'un Réseau Neuronal en Couches sur FPGA

## 1. Présentation du projet
Ce projet porte sur la modélisation et l'intégration matérielle d'un réseau de neurones artificiels organisé en couches. L'architecture est conçue pour traiter des données entières et s'adapter à une configuration multicouche où chaque étage réduit progressivement le nombre de données traitées.

### Principes du réseau :
*   **Organisation en couches** : Chaque neurone d'une couche donnée reçoit l'intégralité des sorties de la couche précédente.
*   **Structure pyramidale** : Pour un nombre d'entrées $N$, le nombre de neurones par couche diminue ($N \rightarrow N/2 \rightarrow N/4$). Les entrées non connectées sont traitées comme nulles.
*   **Modélisation** : Développement et validation du comportement logique sous l'environnement **ModelSim**.

---

## 2. Intégration sur plateforme DE10-Lite
L'étape finale consiste au portage du réseau sur une carte **FPGA Intel MAX 10**. Le fichier `top_DE10.vhd` assure l'interface entre les calculs numériques et les composants physiques.

### Spécifications de l'interface :
*   **Entrées (SW)** : Les switchs `SW(0..7)` pilotent les 8 entrées du réseau. Chaque switch simule le bit de poids fort de l'entrée $X_i$ (valeur **16** si activé, **0** sinon).
*   **Contrôle visuel (LED)** : Les LEDs de la carte affichent l'état direct des switchs d'entrée.
*   **Sorties (HEX)** : Les deux neurones de la couche de sortie sont reliés à des afficheurs 7 segments via des transcodeurs DCB.
    *   L'affichage exploite le bit de poids fort des sorties du réseau.
    *   **Résultat visuel** : **8** (activé) ou **0** (inactif).

---

## 3. Architecture des fichiers
Le dépôt est organisé selon la structure suivante, conformément aux fichiers sources du projet :

*   **`Neurone.vhd`** : Modélisation unitaire du neurone (somme pondérée et seuillage).
*   **`Network.vhd`** : Instanciation structurelle des différentes couches du réseau.
*   **`pack_neurones.vhd`** : Définition des constantes ($N$, seuil $T$) et des types de données.
*   **`top_DE10.vhd`** : Unité de haut niveau (Top Entity) pour l'intégration matérielle.
*   **`DCB.vhd`** : Transcodeur binaire vers 7 segments pour l'affichage.
*   **`pin_assignment_DE10-Lite.tcl`** : Script d'assignation des broches pour le FPGA.
*   **`neural_network.qar`** : Archive complète du projet pour Quartus Prime.
*   **`.gitignore`** : Fichier de configuration pour l'exclusion des fichiers temporaires de compilation.

---
