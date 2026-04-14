library ieee;
use ieee.std_logic_1164.all;
use work.pack_neurones.all; 
--use work.neurones.all; 

ENTITY Test_network is
   
END Test_network;


ARCHITECTURE arch_test OF Test_network IS

SIGNAL Vect_X_in : Tab_int_const := (others => 0);
SIGNAL Vect_Z_out : Tab_int (1 to 2);

COMPONENT Network is
    GENERIC (Nb_Layers :positive := 3);
    PORT ( Vect_X : IN Tab_int_const:= (others => 1);
           Vect_Z : OUT Tab_int (1 to (N  / (2**(Nb_Layers-1)))));
END COMPONENT;


BEGIN
	Net : Network
	PORT MAP(Vect_X_in, Vect_Z_out);

	PROCESS
		VARIABLE i,j : natural;
		VARIABLE X : short_natural;
	BEGIN
		i := 1; j:=1;
		FOR i in 0 TO 255 LOOP

			Vect_X_in(1) <= (i MOD 2) * 16 ;
			Vect_X_in(2) <= ((i/2) MOD 2) * 16 ;
			Vect_X_in(3) <= ((i/4) MOD 2) * 16 ;
			Vect_X_in(4) <= ((i/8) MOD 2) * 16 ;
			Vect_X_in(5) <= ((i/16) MOD 2) * 16 ;
			Vect_X_in(6) <= ((i/32) MOD 2) * 16 ;
			Vect_X_in(7) <= ((i/64) MOD 2) * 16 ;
			Vect_X_in(8) <= ((i/128) MOD 2) * 16 ;
			WAIT FOR 1 ns;
	
		END LOOP;


	END PROCESS;

END arch_test;