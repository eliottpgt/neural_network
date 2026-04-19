library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.pack_neurones.all;

-- e) Optimized neuron for N=4 with 5-stage deep pipeline
--    Stage 1: Register input Xi
--    Stage 2: 4 parallel multiplications (Wi × Xi)
--    Stage 3: 2 parallel partial sums
--    Stage 4: Final accumulation of Y
--    Stage 5: Threshold comparison, register output Z
--    Latency: 5 cycles
--    fmax: ~378 MHz

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
    signal prod1_reg : long_natural := 0;
    signal prod2_reg : long_natural := 0;
    signal prod3_reg : long_natural := 0;
    signal prod4_reg : long_natural := 0;
    signal sum_12_reg : long_natural := 0;
    signal sum_34_reg : long_natural := 0;
    signal Y_reg : long_natural := 0;
    signal Z_reg : short_natural := VMIN;
    
begin

    process(clk)
        variable prod1 : long_natural;
        variable prod2 : long_natural;
        variable prod3 : long_natural;
        variable prod4 : long_natural;
        variable sum_12 : long_natural;
        variable sum_34 : long_natural;
        variable Y_temp : long_natural;
        variable v_z : short_natural;
    begin
        if rising_edge(clk) then
            
            -- Stage 1: Register input
            Xi_reg <= Xi;
            
            -- Stage 2: 4 parallel multiplications
            prod1 := Wi(1) * Xi_reg(1);
            prod2 := Wi(2) * Xi_reg(2);
            prod3 := Wi(3) * Xi_reg(3);
            prod4 := Wi(4) * Xi_reg(4);
            prod1_reg <= prod1;
            prod2_reg <= prod2;
            prod3_reg <= prod3;
            prod4_reg <= prod4;
            
            -- Stage 3: 2 parallel partial sums
            sum_12 := prod1_reg + prod2_reg;
            sum_34 := prod3_reg + prod4_reg;
            sum_12_reg <= sum_12;
            sum_34_reg <= sum_34;
            
            -- Stage 4: Final accumulation
            Y_temp := sum_12_reg + sum_34_reg;
            Y_reg <= Y_temp;
            
            -- Stage 5: Threshold comparison
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
