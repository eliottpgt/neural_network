library IEEE;
use IEEE.std_logic_1164.all;

package pack_neurones is

	constant T : natural := 200;
	constant VMAX : natural := 16;
	constant VMIN : natural := 1;
	constant N : positive := 8;
	
	subtype short_natural is natural range 0 to 63;
	subtype long_natural is natural range 0 to N * 63 * 63;


	type Tab_int is array (natural range <>) of short_natural;
	subtype Tab_int_const is Tab_int(1 to N);

	TYPE Quad_Tab_const is array( 1 TO 4, 1 TO 8)  of Tab_int_const; 
   	CONSTANT  Wi_LUT : Quad_Tab_const := ( ((1,1,5,5,5,5,1,1),(1,0,3,5,3,5,0,7),(0,1,6,5,4,5,2,1), (8,0,5,0,5,5,0,1), 
						(4,4,4,4,2,2,2,2),(4,3,5,0,0,5,3,4),(3,3,3,3,3,3,3,3),(1,2,3,6,6,3,2,1)), 
						((4,6,0,3,1,0,6,4),(5,5,1,1,1,1,5,5),(3,3,3,3,3,3,3,3),(0,1,3,8,8,3,1,0), 
						(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0), (0,0,0,0,0,0,0,0)), 
						((0,9,9,0,0,0,0,0),(6,6,6,6,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0), 
						(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0), (0,0,0,0,0,0,0,0)), 
					OTHERS => (OTHERS => (OTHERS => 0))); 

end package pack_neurones;