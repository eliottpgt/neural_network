library IEEE;
use IEEE.std_logic_1164.all;

package pack_neurones is

	constant T : natural := 100;
	constant VMAX : natural := 16;
	constant VMIN : natural := 1;
	constant N : positive := 4;

	type Tab_int is array (natural range <>) of natural;
	subtype Tab_int_const is Tab_int(1 to N);

end package pack_neurones;