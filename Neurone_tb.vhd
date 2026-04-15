library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurones.all;

entity Neurone_tb is
end Neurone_tb;

architecture architecture_tb of Neurone_tb is

	constant Wi_tb : Tab_int_const := (others => 27);
	signal Xi_tb : Tab_int_const;
	signal Z_tb : natural;

begin
NEURONE_TEST : entity work.Neurone

	generic map(
		Wi => Wi_tb
	)

	port map(
		Xi => Xi_tb,
		Z => Z_tb
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