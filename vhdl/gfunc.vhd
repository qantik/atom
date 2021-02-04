library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;


entity GFunc is
port ( Inp : in  std_logic_vector(0 to 89);
       Oup : out std_logic );
end entity GFunc;



architecture gf of GFunc is 

begin
Oup<= Inp(0) xor Inp(24) xor Inp(49) xor Inp(79) xor Inp(84) xor (Inp(3) and Inp(59)) xor (Inp(10) and Inp(12)) xor (Inp(15) and Inp(16))
			xor (Inp(25) and Inp(53)) xor (Inp(35) and Inp(42)) xor (Inp(55) and Inp(58)) xor (Inp(60) and Inp(74)) xor (Inp(20) and Inp(22) and Inp(23))
			xor (Inp(62) and Inp(68) and Inp(72)) xor (Inp(77) and Inp(80) and Inp(81) and Inp(83)) ;
 

 

end architecture gf; 
