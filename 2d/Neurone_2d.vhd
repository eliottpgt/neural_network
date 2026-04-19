library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurones.all;

-- d) Synchronous neuron with 3-stage pipeline
--    Stage 1: Register input Xi
--    Stage 2: Compute weighted sum Y, register Y
--    Stage 3: Threshold on Y, register output Z
--    Latency: 3 cycles 
--    fmax: ~184 MHz

entity Neurone is
    Generic (
        Wi : Tab_int_const := (others => 27)
    );
    Port (
        Xi : in Tab_int_const;
        clk : in std_logic;
        Z : out short_natural
    );
end Neurone;

architecture behaviour of Neurone is
    signal Xi_reg : Tab_int_const := (others => 0);
    signal Y_reg : long_natural := 0;
    signal Z_reg : short_natural := VMIN;
    
begin

    process(clk)
        variable v_sum : long_natural;
        variable v_z : short_natural;
    begin
        if rising_edge(clk) then
            
            -- Stage 1: Register input
            Xi_reg <= Xi;
            
            -- Stage 2: Accumulate weighted sum
            v_sum := 0;
            for i in Xi_reg'range loop
                v_sum := v_sum + (Wi(i) * Xi_reg(i));
            end loop;
            Y_reg <= v_sum;
            
            -- Stage 3: Threshold comparison
            if Y_reg > T then
                v_z := VMAX;
            else
                v_z := VMIN;
            end if;
            Z_reg <= v_z;
            
        end if;
    end process;
    
    Z <= Z_reg;

end architecture behaviour;