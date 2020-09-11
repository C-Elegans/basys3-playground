-------------------------------------------------------------------------------
-- Title      : Testbench for design "popcnt"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : popcnt_tb.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-11
-- Last update: 2020-09-11
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-09-11  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity popcnt_tb is

end entity popcnt_tb;

-------------------------------------------------------------------------------

architecture tb of popcnt_tb is

  -- component ports
  signal data  : std_logic_vector(7 downto 0);
  signal count : std_logic_vector(3 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture tb

  -- component instantiation
  DUT: entity work.popcnt
    port map (
      data  => data,
      count => count);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    for i in 0 to 255 loop
      data <= std_logic_vector(to_unsigned(i, 8));
      wait for 10 ns;
    end loop;  -- i
    wait;
  end process WaveGen_Proc;

  

end architecture tb;

