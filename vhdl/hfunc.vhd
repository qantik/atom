library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;


entity HFunc is
port ( Inp : in  std_logic_vector(0 to 158);
       Oup : out std_logic );
end entity HFunc;



architecture hf of HFunc is 

signal N:  std_logic_vector(0 to 89);
signal L:  std_logic_vector(0 to 68);

signal o1,o2: std_logic;

begin
 
N <= Inp(0 to 89);
L <= Inp(90 to 158);

o1 <= N(1) xor N(5) xor N(11) xor N(22) xor N(36) xor N(53) xor N(72) xor N(80) xor N(84) xor (L(5) and L(16))

		xor (L(13) and L(15)) xor (L(30) and L(42)) xor (L(67) and L(22));

f: entity nfunc (nf) port map(L(7), L(33), L(38), L(50), L(59), L(62), N(85), N(41), N(9),o2);

 
Oup <= o1 xor o2;

end architecture hf;   
