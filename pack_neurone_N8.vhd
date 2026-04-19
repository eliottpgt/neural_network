library IEEE;
use IEEE.std_logic_1164.all;

-- Package for neuron with N=8 inputs
package pack_neurone_N8 is

	-- Threshold value
	constant T : natural := 100;
	-- Maximum output value
	constant VMAX : natural := 16;
	-- Minimum output value
	constant VMIN : natural := 1;
	-- Number of inputs
	constant N : positive := 8;

	-- Unconstrained integer array type
	type Tab_int is array (natural range <>) of natural;
	-- Constrained integer array (1 to N elements)
	subtype Tab_int_const is Tab_int(1 to N);

end package pack_neurone_N8;
