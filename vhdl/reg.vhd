library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity Reg is 
port (
Reg1xDN : in std_logic_vector (0 to 158);
Reg2xDN : in std_logic_vector (0 to 158);
SelxSI  : in std_logic;
ClkxCI : in std_logic;
RegxDP : out std_logic_vector (0 to 158));
end entity Reg;


architecture r of Reg is

begin


p_clk: process (SelxSI, ClkxCI)
         begin
           if ClkxCI'event and ClkxCI ='1' then
          if SelxSI ='0' then 

                         RegxDP <= Reg1xDN;
          else
                         RegxDP <= Reg2xDN;
         end if;
                        
           end if;
         end process p_clk;

end architecture r;
