library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity filters is 
port ( KeyxDI : in std_logic_vector(0 to 127); 
       i1:   in std_logic_vector(0 to 8); 
       i2:  in std_logic_vector(0 to 6); 
 
       k1:    out std_logic;  
       k2:   out std_logic  );
end entity filters;

architecture ff of filters is

signal r : integer range 0 to 511;
signal t,Counter : integer range 0 to 127;


begin 

r <= to_integer(unsigned(i1));
Counter  <= r mod 128;
t <= to_integer(unsigned(i2));

k1 <= KeyxDI(Counter);

k2 <= KeyxDI(t);


end architecture ff ;
