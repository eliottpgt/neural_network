library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurones.all;

entity Neurone2_tb is
end Neurone2_tb;

architecture architecture_tb of Neurone2_tb is

	constant Wi1_tb : Tab_int_const := (others => 27);
	constant Wi2_tb : Tab_int_const := (0 => 25, 1 => 30, 2 => 35, 3 => 40);
	signal Xi_tb : Tab_int_const;
	signal Z1_tb : natural;
	signal Z2_tb : natural;

begin
NEURONE1_TEST : entity work.Neurone

	generic map(
		Wi => Wi1_tb
	)

	port map(
		Xi => Xi_tb,
		Z => Z1_tb
	);

NEURONE2_TEST : entity work.Neurone

	generic map(
		Wi => Wi2_tb
	)

	port map(
		Xi => Xi_tb,
		Z => Z2_tb
	);


	START_TEST : process
	begin

		wait for 1 ns;
		Xi_tb <= (0 => 1, 1 => 2, 2 => 3, 3 => 2);

		wait for 10 ns;
		Xi_tb <= (0 => 0, 1 => 1, 2 => 0, 3 => 1);
		
		wait;

	end process START_TEST;

end architecture_tb;