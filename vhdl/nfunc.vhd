library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;


entity nfunc is
port ( x0,x1,x2,x3,x4,x5,x6,x7,x8 : in  std_logic;
       Oup : out std_logic );
end entity nfunc;



architecture nf of nfunc is 

signal a,b,c,d,e,f,g,h,i: std_logic;

begin
 
  

  a <= (x0 and x1 and x2 and x7 and x8) xor (x0 and x1 and x2 and x7) xor (x0 and x1 and x2 and x8) xor (x0 and x1 and x2) xor (x0 and x1 and x3 and x7 and x8)
		xor (x0 and x1 and x3 and x7) xor (x0 and x1 and x4 and x7 and x8) xor (x0 and x1 and x4 and x7) xor (x0 and x1 and x4 and x8) xor (x0 and x1 and x4)
		xor (x0 and x1 and x5 and x7 and x8) xor (x0 and x1 and x5 and x7) xor (x0 and x1 and x6 and x7 and x8) xor (x0 and x1 and x6 and x8);

	 b <= (x0 and x1 and x7 and x8) xor (x0 and x1 and x8) xor (x0 and x2 and x3 and x7 and x8) xor (x0 and x2 and x3 and x7) xor (x0 and x2 and x3 and x8)
		xor (x0 and x2 and x3) xor (x0 and x2 and x4 and x7 and x8) xor (x0 and x2 and x4 and x8) xor (x0 and x2 and x5 and x7 and x8) xor (x0 and x2 and x5 and x7)
		xor (x0 and x2 and x5 and x8) xor (x0 and x2 and x5) xor (x0 and x2 and x6 and x7 and x8) xor (x0 and x2 and x6 and x8) xor (x0 and x2 and x7 and x8);

	 c <= (x0 and x2 and x8) xor (x0 and x3 and x4 and x7 and x8) xor (x0 and x3 and x4 and x7) xor (x0 and x3 and x5 and x7 and x8) xor (x0 and x3 and x5 and x7)
		xor (x0 and x3 and x6 and x7 and x8) xor (x0 and x3 and x6 and x7) xor (x0 and x3 and x8) xor (x0 and x3) xor (x0 and x4 and x5 and x7 and x8)
		xor (x0 and x4 and x5 and x7) xor (x0 and x4 and x6 and x7 and x8) xor (x0 and x4 and x6 and x8) xor (x0 and x4 and x7) xor (x0 and x4);

	 d <= (x0 and x5 and x6 and x7 and x8) xor (x0 and x5 and x6 and x7) xor (x0 and x5 and x7 and x8) xor (x0 and x5 and x7) xor (x0 and x6 and x7)
		xor (x0 and x6 and x8) xor (x0 and x7 and x8) xor (x1 and x2 and x3 and x7 and x8) xor (x1 and x2 and x4 and x7 and x8) xor (x1 and x2 and x4 and x8)
		xor (x1 and x2 and x5 and x7 and x8) xor (x1 and x2 and x6 and x7 and x8) xor (x1 and x2 and x6 and x8) xor (x1 and x2 and x7) xor (x1 and x2 and x8);

	 e <= (x1 and x2) xor (x1 and x3 and x4 and x7 and x8) xor (x1 and x3 and x5 and x7 and x8) xor (x1 and x3 and x6 and x7 and x8) xor (x1 and x3 and x7)
		xor (x1 and x4 and x5 and x7 and x8) xor (x1 and x4 and x5 and x8) xor (x1 and x4 and x6 and x7 and x8) xor (x1 and x4 and x7) xor (x1 and x4)
		xor (x1 and x5 and x6 and x7 and x8) xor (x1 and x5 and x6 and x7) xor (x1 and x5 and x7 and x8) xor (x1 and x5 and x7) xor (x1 and x5 and x8);

	 f <= (x1 and x6 and x7) xor (x1 and x8) xor x1 xor (x2 and x3 and x4 and x7 and x8) xor (x2 and x3 and x5 and x7 and x8) xor (x2 and x3 and x6 and x7 and x8)
		xor (x2 and x4 and x5 and x7 and x8) xor (x2 and x4 and x5 and x8) xor (x2 and x4 and x6 and x7 and x8) xor (x2 and x4 and x7 and x8) xor (x2 and x4 and x8)
		xor (x2 and x5 and x6 and x7 and x8) xor (x2 and x5 and x6 and x8) xor (x2 and x5 and x8) xor (x2 and x6 and x7 and x8) xor (x2 and x6 and x8);

	 g <= (x2 and x7 and x8) xor x2 xor (x3 and x4 and x5 and x7 and x8) xor (x3 and x4 and x5 and x7) xor (x3 and x4 and x6 and x7 and x8)
		xor (x3 and x4 and x6 and x7) xor (x3 and x5 and x6 and x7 and x8) xor (x3 and x5 and x7 and x8) xor (x3 and x6 and x7 and x8) xor (x3 and x6 and x7)
		xor (x3 and x7) xor x3 xor (x4 and x5 and x6 and x7 and x8) xor (x4 and x5 and x6 and x8) xor (x4 and x6 and x7 and x8) xor (x4 and x6 and x8);

	 i <= (x4 and x7) xor (x5 and x7 and x8) xor x5 xor x6 xor (x7 and x8) xor x7 xor x8 xor '1';

	Oup <= a xor b xor c xor d xor e xor f xor g xor i;

end architecture nf; 
