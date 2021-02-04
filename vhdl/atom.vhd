library ieee;
use ieee.std_logic_1164.all;
 
use ieee.numeric_std.all;
use std.textio.all;
use work.all;

entity atom is 
port ( KeyxDI : in std_logic_vector(0 to 127); 
       IVxDI:   in std_logic_vector(0 to 158); 
       ClkxCI:  in std_logic; 
       ResxRBI: in std_logic; 
       ZxDO:    out std_logic;  
       PGxSO:   out std_logic  );
end entity atom;

architecture behavioural of atom is

 

signal RegxDP,RegxDN,U: std_logic_vector(0 to 158); 
 

signal RoundxDP, RoundxDN: integer range 0 to 511;
 
signal StatxDP, StatxDN: std_logic_vector(0 to 1);

signal Load ,Init : std_logic;

signal GxD,FxD,ZxD,ZUxD, Inp1,Up1,Inp2,Up2,Inp3, Up3,key,PGxS: std_logic;

signal index  : integer range 0 to 127;

signal  ct,ctn,L9B: std_logic_vector(0 to 8); 

signal Counter,Countern: integer range 0 to 511;

begin


--------------------------------------------------------------------------------------------------------------

  p_main : process (RoundxDP,  StatxDP)
           begin
           
 
             StatxDN <= StatxDP;
 
             case RoundxDP is
 
                     
               when 0  =>    if StatxDP = "00" then 
                                RoundxDN <= 0;
                                StatxDN  <= "01";
                             else
                                RoundxDN <= RoundxDP+1 ;
                                StatxDN  <= StatxDP;
                             end if;

               when 510 =>  StatxDN <= "10";
                            RoundxDN<= RoundxDP+1;

               when 511 => RoundxDN<=0;
               when others => RoundxDN <= RoundxDP+1;
                              StatxDN  <= StatxDP;
             end case;    
  end process p_main;
 
Load <='1' when StatxDP="00" else '0';

Init <='1' when StatxDP="01" else '0';

 
 
--------------------------------------------------------------------------------------------------------------

gf01: entity GFunc (gf) port map (RegxDP(0 to 89),GxD);
 
 
FxD<= RegxDP(90) xor  RegxDP(95) xor RegxDP(102) xor RegxDP(112) xor RegxDP(118) xor RegxDP(127) xor RegxDP(135) xor RegxDP(148) ;

hf01: entity HFunc (hf) port map (RegxDP,ZxD);

ZUxD <= ZxD and Init;

ZxDO<=ZxD;

PGxS<= '1' when StatxDP="10" else '0'; 

Up1 <= GxD xor ZUxD xor key xor RegxDP (90) xor KeyxDI(Counter);

Up2 <= FxD;

Up3 <= FxD xor ZUxD;

PGxSO<= PGxS;

key <= PGxS and KeyxDI(index);

index<= to_integer(unsigned(RegxDP(152 to 158)));

Counter  <= RoundxDP mod 128;

ctn<= std_logic_vector(to_unsigned(RoundxDN, 9));

 
--------------------------------------------------------------------------------------------------------------
r1: entity Reg (r) port map (RegxDN, IVxDI, Load, ClkxCI,RegxDP);

RegxDN<= RegxDP(1 to 89) & Inp1 & RegxDP(91 to 149) & Inp3 & L9B; 

 
L9B <= ctn when Init='1' else RegxDP(151 to 158) & Up2;
 

Inp3<= Up3 when Init = '1' else RegxDP(150);

--Inp2<= IvxDI when Load = '1' else Up2;

Inp1<= RegxDP(90) when Load = '1' else Up1;
-------------------------------------------------------------------------------------------------------------- 


  p_clk: process (ResxRBI, ClkxCI)
         begin
           if ResxRBI='0' then
                   RoundxDP  <= 0;
                   StatxDP   <= "00";
 
	     
           elsif ClkxCI'event and ClkxCI ='1' then

		   RoundxDP <= RoundxDN;
 
                   StatxDP <= StatxDN;
           end if;
         end process p_clk;








end architecture behavioural;
