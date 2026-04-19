library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurones.all;

-- b) Basic combinatorial neuron with 6-bit data types
--    Xi, Z: 6-bit (short_natural) 
--    Y: 14-bit (long_natural)
--    Weights: generic constant | No synchronization

entity Neurone is
    Generic (
        Wi : Tab_int_const := (others => 27)
    );
    Port (
        Xi : in Tab_int_const;
        Z : out short_natural
    );
end Neurone;

architecture behaviour of Neurone is

begin

    process(Xi)
        variable v_sum : long_natural;
        variable v_z : short_natural;
    begin

        -- Accumulate weighted sum
        v_sum := 0;
        for i in Xi'range loop
            v_sum := v_sum + (Wi(i) * Xi(i));
        end loop;
        
        -- Threshold: Z = VMAX if Y > T else VMIN
        if v_sum > T then
            v_z := VMAX;
        else
            v_z := VMIN;
        end if;
        
        Z <= v_z;
        
    end process;

end architecture behaviour;
