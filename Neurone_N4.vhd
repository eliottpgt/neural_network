library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurone_N4.all;

-- Artificial neuron entity with 4 inputs
-- Performs weighted sum of inputs and applies threshold function
entity Neurone_N4 is
	-- Generic parameter: weights for each input
	Generic ( Wi : Tab_int_const := (others => 27));
	Port (
		-- Input vector
		Xi : in Tab_int_const;
		-- Output after thresholding
		Z : out natural
    	);

end Neurone_N4;

-- Architecture implementing the neuron behavior
architecture behaviour of Neurone_N4 is
	-- Internal signal: weighted sum before thresholding
	signal Y : natural := 0;
begin
	process(Xi)
		-- Temporary variable for calculating weighted sum
		variable Y_calc : natural := 0;
	begin
		-- Initialize calculation
		Y_calc := 0;
		-- Calculate weighted sum: Y = Σ(Wi * Xi)
		for i in Xi'range loop
        		Y_calc := Y_calc + (Wi(i) * Xi(i));
    		end loop;
		-- Assign result to output signal
		Y <= Y_calc;

		-- Apply threshold function
		if Y_calc > T then
			Z <= VMAX;  -- Output high if sum exceeds threshold
		else 
			Z <= VMIN;  -- Output low otherwise
		end if;
	end process;

end architecture;

