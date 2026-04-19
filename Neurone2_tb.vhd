library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurone_N4.all;

-- Testbench comparing two neurons with different weights
-- Both neurons receive the same inputs but produce different outputs based on their weights
entity Neurone2_tb is
end Neurone2_tb;

architecture architecture_tb of Neurone2_tb is

	-- Neuron 1: arbitrary weights (18, 32, 21, 45)
	constant Wi1_tb : Tab_int_const := (0 => 18, 1 => 32, 2 => 21, 3 => 45);
	
	-- Neuron 2: arbitrary weights (35, 20, 40, 15)
	constant Wi2_tb : Tab_int_const := (0 => 35, 1 => 20, 2 => 40, 3 => 15);
	
	-- Common input signal for both neurons
	signal Xi_tb : Tab_int_const;
	
	-- Output signals for neuron 1 and 2
	signal Z1_tb : natural;
	signal Z2_tb : natural;

begin

-- Instantiate first neuron
NEURONE1_TEST : entity work.Neurone_N4
	generic map(
		Wi => Wi1_tb
	)
	port map(
		Xi => Xi_tb,
		Z => Z1_tb
	);

-- Instantiate second neuron
NEURONE2_TEST : entity work.Neurone_N4
	generic map(
		Wi => Wi2_tb
	)
	port map(
		Xi => Xi_tb,
		Z => Z2_tb
	);

	-- Stimulus process: Apply series of test values to both neurons
	START_TEST : process
	begin

		-- Test 1: 
		-- Xi = (1, 2, 3, 2)
		wait for 1 ns;
		Xi_tb <= (0 => 1, 1 => 2, 2 => 3, 3 => 2);
		-- Neuron 1: Y = 18*1 + 32*2 + 21*3 + 45*2 = 18+64+63+90 = 235 > 100 -> Z=16
		-- Neuron 2: Y = 35*1 + 20*2 + 40*3 + 15*2 = 35+40+120+30 = 225 > 100 -> Z=16
		wait for 20 ns;

		-- Test 2:
		-- Xi = (0, 1, 0, 1)
		Xi_tb <= (0 => 0, 1 => 1, 2 => 0, 3 => 1);
		-- Neuron 1: Y = 18*0 + 32*1 + 21*0 + 45*1 = 0+32+0+45 = 77 < 100 -> Z=1
		-- Neuron 2: Y = 35*0 + 20*1 + 40*0 + 15*1 = 0+20+0+15 = 35 < 100 -> Z=1
		wait for 20 ns;

		-- Test 3:
		-- Xi = (2, 0, 1, 2)
		Xi_tb <= (0 => 2, 1 => 0, 2 => 1, 3 => 2);
		-- Neuron 1: Y = 18*2 + 32*0 + 21*1 + 45*2 = 36+0+21+90 = 147 > 100 -> Z=16
		-- Neuron 2: Y = 35*2 + 20*0 + 40*1 + 15*2 = 70+0+40+30 = 140 > 100 -> Z=16
		wait for 20 ns;

		-- Test 4:
		-- Xi = (3, 1, 1, 1)
		Xi_tb <= (0 => 3, 1 => 1, 2 => 1, 3 => 1);
		-- Neuron 1: Y = 18*3 + 32*1 + 21*1 + 45*1 = 54+32+21+45 = 152 > 100 -> Z=16
		-- Neuron 2: Y = 35*3 + 20*1 + 40*1 + 15*1 = 105+20+40+15 = 180 > 100 -> Z=16
		wait for 20 ns;

		-- Test 5:
		-- Xi = (0, 0, 0, 0)
		Xi_tb <= (0 => 0, 1 => 0, 2 => 0, 3 => 0);
		-- Neuron 1: Y = 0 < 100 -> Z=1
		-- Neuron 2: Y = 0 < 100 -> Z=1
		wait for 20 ns;

		-- Test 6:
		-- Xi = (0, 0, 0, 3)
		Xi_tb <= (0 => 0, 1 => 0, 2 => 0, 3 => 3);
		-- Neuron 1: Y = 18*0 + 32*0 + 21*0 + 45*3 = 0+0+0+135 = 135 > 100 -> Z=16 
		-- Neuron 2: Y = 35*0 + 20*0 + 40*0 + 15*3 = 0+0+0+45 = 45 < 100 -> Z=1
		wait for 20 ns;
		
		wait;

	end process START_TEST;

end architecture_tb;