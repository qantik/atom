-------------------------------------------------------------------------------
-- Title      : DDBEN
-- Project    : 
-------------------------------------------------------------------------------
-- File       : aes_tb.vhd
-- Author     : Francesco Regazzoni  <regazzoni@alari.ch>
-- Company    : Advanced Learning and Research Insitute, Lugano 
-- Created    : 2013-11-3
-- Last update: 2013-11-3
-- Platform   : ModelSim (simulation), Synopsys (synthesis)
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Test bench for the AES core of Frank 
-------------------------------------------------------------------------------
-- Copyright (c) 2013 Francesco Regazzoni
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
--use work.aes_pack.all;

entity atom_tb is
end atom_tb;


architecture tb of atom_tb is   

signal  KeyxD :   std_logic_vector(0 to 127); 
signal  IVxD:     std_logic_vector(0 to 158); 
signal  ClkxC:    std_logic; 
signal  ResxRB:   std_logic; 
signal  ZxD:      std_logic;  
signal  PGxS:     std_logic;
 

constant freq : time := 10 ns;


  component atom
  port(
       KeyxDI : in std_logic_vector(0 to 127); 
       IVxDI:   in std_logic_vector(0 to 158); 
       ClkxCI:  in std_logic; 
       ResxRBI: in std_logic; 
       ZxDO:    out std_logic;  
       PGxSO:   out std_logic 
  );
  end component;
       


   
begin

  -- Instantiate the module under test (MUT)
  mut: atom
    port map (
       KeyxDI => KeyxD,
       IVxDI  => IVxD,
       ClkxCI => ClkxC,
       ResxRBI=> ResxRB,
       ZxDO   => ZxD,
       PGxSO  => PGxS
  );

  -- Generate the clock
--  ClkxC <= not (ClkxC) after clkphasehigh;


  Tb_clkgen : process
  begin
     ClkxC <= '1';
     wait for freq/2;
     ClkxC <= '0';
     wait for freq/2;
  end process Tb_clkgen;

  -- obtain stimulus and apply it to MUT
  ----------------------------------------------------------------------------
  B1 : block
   begin


  -- timing of clock and simulation events
 


  Tb_stimappli : process
    variable INLine   : line;
    variable temp_p   : STD_LOGIC_VECTOR(0 to 158);
    variable temp_k   : STD_LOGIC_VECTOR(0 to 127); 
    constant clkphasehigh: time:= freq/2;
    constant clkphaselow: time:= freq/2;
 
    constant resetactivetime:         time:= freq/4;

  -- declaration of stimuli, expected responses, and simulation report files
  file stimulifile, simreptfile : text;

  file INPUT_file,keyfile,ptfile : TEXT;

  variable count : integer := 0;

  begin
    -- Opening Input File
    file_open(keyfile, "../vectors/Key.txt", read_mode);
    file_open(ptfile, "../vectors/IV.txt", read_mode);
    -- default values

    -- Reset phase
    -- Reset is active 
    ResxRB      <= '0';
    IVxD <= (others => '0'); 
    KeyxD <= (others => '0');
    
    wait for resetactivetime;
    ResxRB      <= '1';

    -- process until we run out of stimuli
    appli_loop : while count < 50 loop
      readline(keyfile,INLine);
      read(INLine,temp_k);
      KeyxD <= temp_k;
      readline(ptfile,INLine);
      read(INLine,temp_p);

 
         IVxD <= temp_p ;
          

    wait for 2*clkphasehigh*610-resetactivetime ;
    ResxRB      <= '0';
    wait for resetactivetime;
    ResxRB      <= '1';

    count := count + 1;
    end loop appli_loop;
    wait until ClkxC'event and ClkxC = '1';
    file_close(INPUT_file);
    assert false report "tb finished" severity failure;
  end process Tb_stimappli;
end block;
end tb;
