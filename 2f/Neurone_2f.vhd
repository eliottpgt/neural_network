library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurones.all;

-- f) Combinatorial neuron with variable weights (learning mode)
--    Like version b) but weights Wi are input ports instead of generic
--    No synchronization (combinatorial logic)

entity Neurone is
    Port (
        Xi : in Tab_short_const;
        Wi : in Tab_short_const;
        Z : out short_natural
    );
end Neurone;

architecture behaviour of Neurone is

begin

    process(Xi, Wi)
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
