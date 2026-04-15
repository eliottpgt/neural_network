library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurones.all;

entity Neurone is
	Generic ( Wi : Tab_int_const := (others => 27));
	Port (
		Xi : in Tab_int_const;
		Z : out natural
    	);

end Neurone;

architecture behaviour of Neurone is
begin
	process(Xi)
		variable Y : natural := 0;
	begin
		Y := 0;
		for i in Xi'range loop
        		Y := Y + (Wi(i) * Xi(i));
    		end loop;

		if Y > T then
			Z <= VMAX;
		else 
			Z <= VMIN;
		end if;
	end process;

end architecture;

