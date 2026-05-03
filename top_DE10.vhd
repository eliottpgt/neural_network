LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.pack_neurones.ALL;


ENTITY top_DE10 IS
	PORT (
		SW  : IN  std_logic_vector(9 downto 0); 
		LED : OUT std_logic_vector(9 downto 0);
		HEX0 : OUT std_logic_vector(7 downto 0);
		HEX1 : OUT std_logic_vector(7 downto 0)
	);
END top_DE10;



ARCHITECTURE arch_top OF top_DE10 IS

	COMPONENT DCB is
		port (datai : IN std_logic_vector (3 downto 0);
			segm : OUT std_logic_vector (6 downto 0) );
	end COMPONENT; 

	COMPONENT Network is
		GENERIC (Nb_Layers :positive := 3);
		PORT ( Vect_X : IN Tab_int_const:= (others => 1);
			Vect_Z : OUT Tab_int (1 to 2));
	END COMPONENT;

	SIGNAL Vect_X_in : Tab_int_const;
	SIGNAL Vect_Z_out : Tab_int (1 to 2);

	-- Signaux pour afficheurs
	SIGNAL val_hex0 : std_logic_vector(3 downto 0);
	SIGNAL val_hex1 : std_logic_vector(3 downto 0);

BEGIN

	-- 1. Mapping des sw vers Vect_X_in
	GEN_INPUTS: for i in 0 to 7 generate
		Vect_X_in(i+1) <= 16 when SW(i) = '1' else 0;
	end generate;
	
	-- 2. Affichage des sw sur les LEDs
	LED(7 downto 0) <= SW(7 downto 0);
	LED(9 downto 8) <= "00";
	
	-- 3. Instance du network
	NET : Network
		GENERIC MAP (Nb_layers => 3)
		PORT MAP (
			Vect_X => Vect_X_in,
			Vect_Z => Vect_Z_out
		);
		
	-- 4. Conversion des données pour afficheur
	val_hex0 <= "1000" when (Vect_Z_out(1) = 16) else "0000"; -- Affiche 8 ou 0
	val_hex1 <= "1000" when (Vect_Z_out(2) = 16) else "0000"; -- Affiche 8 ou 0
	
	-- 5. Instance des transcodeurs DCB
	DCB_1 : DCB PORT MAP (datai => val_hex0, segm => HEX0(6 downto 0));
	DCB_2 : DCB PORT MAP (datai => val_hex1, segm => HEX1(6 downto 0));
	
	--Gestion des points de l'afficheur
	HEX0(7) <= '1'; -- éteint
	HEX1(7) <= '1'; -- éteint
		
END arch_top;