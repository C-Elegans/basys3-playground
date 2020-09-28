-------------------------------------------------------------------------------
-- Title      : Testbench for design "bin_to_bcd"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : bin_to_bcd_tb.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-20
-- Last update: 2020-09-20
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-09-20  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity bin_to_bcd_tb is

end entity bin_to_bcd_tb;

-------------------------------------------------------------------------------

architecture tb of bin_to_bcd_tb is

  -- component ports
  signal binary : std_logic_vector(4 downto 0);
  signal bcd    : std_logic_vector(7 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture tb

  -- component instantiation
  DUT: entity work.bin_to_bcd
    port map (
      binary => binary,
      bcd    => bcd);


  -- waveform generation
  WaveGen_Proc: process
  begin
    for i in 0 to 16 loop
      binary <= std_logic_vector(to_unsigned(i, 5));
      wait for 10 ns;
    end loop;  -- i
    wait;
    

  end process WaveGen_Proc;

  

end architecture tb;

