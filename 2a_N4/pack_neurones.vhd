library IEEE;
use IEEE.std_logic_1164.all;

package pack_neurones is

	constant T : natural := 200;
	constant VMAX : natural := 16;
	constant VMIN : natural := 1;
	constant N : positive := 4;
	
	subtype short_natural is natural range 0 to 63;
	subtype long_natural is natural range 0 to N * 63 * 63;


	type Tab_int is array (natural range <>) of short_natural;
	subtype Tab_int_const is Tab_int(1 to N);

end package pack_neurones;