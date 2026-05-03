library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurones.all;

entity Network is
	Generic (
		Nb_Layers : natural := 3;
		Default_Wi : Tab_int_const := (others => 8)
	);
	Port(
		Vect_X : in Tab_int_const;
		Vect_Z : out Tab_int (1 to (N / (2**(Nb_Layers-1))))
	);
end Network;

architecture Structural of Network is

	component Neurone
		Generic ( Wi : Tab_int_const);
		Port(
			Xi : in Tab_int_const;
			Z : out short_natural
		);
	end component;

	type pipe_matrix is array(0 to Nb_Layers) of Tab_int_const;
	signal pipe : pipe_matrix := (others => (others => 0));

begin

	pipe(0) <= Vect_X;
	
	GEN_LAYERS: for i in 0 to Nb_Layers-1 generate

		constant nb_neurones : natural := N / (2**i);

	begin			
		GEN_NEURONES: for j in 1 to nb_neurones generate
        	begin
            		U_NEURONE : Neurone
                		Generic Map (Wi => Default_Wi)
                		Port Map (
                    			Xi => pipe(i),   
                    			Z  => pipe(i+1)(j)
                		);
        	end generate GEN_NEURONES;
	end generate GEN_LAYERS;
	
	GEN_OUT: for k in 1 to (N / (2**(Nb_Layers-1))) generate
		Vect_Z(k) <= pipe(Nb_Layers)(k);
	end generate GEN_OUT;

end Structural;
