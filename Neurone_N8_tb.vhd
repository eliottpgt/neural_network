library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurone_N8.all;

-- Testbench entity for Neurone_N8
entity Neurone_N8_tb is
end Neurone_N8_tb;

-- Testbench architecture with test stimulus generation
architecture architecture_tb of Neurone_N8_tb is

	-- Weight values for testing
	constant Wi_tb : Tab_int_const := (others => 27);
	-- Input signal
	signal Xi_tb : Tab_int_const;
	-- Output signal
	signal Z_tb : natural;

begin
-- Instantiate the neuron unit under test
NEURONE_TEST : entity work.Neurone_N8
	generic map(
		Wi => Wi_tb
	)
	port map(
		Xi => Xi_tb,
		Z => Z_tb
	);

	-- Process to generate test stimuli
	START_TEST : process
	begin

		-- Test 1: Sum below threshold (Y < T) -> Z should be VMIN = 1
		-- Xi = (0,0,0,2,0,0,0,0) -> Y = 27*2 = 54 < 100 -> Z = 1
		wait for 10 ns;
		Xi_tb <= (0 => 0, 1 => 0, 2 => 0, 3 => 2, 4 => 0, 5 => 0, 6 => 0, 7 => 0);
		wait for 30 ns;

		-- Test 2: Sum above threshold (Y > T) -> Z should be VMAX = 16
		-- Xi = (4,4,4,4,2,2,2,2) -> Y = 27*(16+8) = 27*24 = 648 > 100 -> Z = 16
		Xi_tb <= (0 => 4, 1 => 4, 2 => 4, 3 => 4, 4 => 2, 5 => 2, 6 => 2, 7 => 2);
		wait for 30 ns;
		
		wait;

	end process START_TEST;

end architecture_tb;
