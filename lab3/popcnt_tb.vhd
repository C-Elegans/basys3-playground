-------------------------------------------------------------------------------
-- Title      : Testbench for design "popcnt"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : popcnt_tb.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-11
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
  signal data  : std_logic_vector(15 downto 0);
  signal count : std_logic_vector(4 downto 0);

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
    data <= X"0000";  wait for 10 ns;
    data <= X"0001";  wait for 10 ns;
    data <= X"0003";  wait for 10 ns;
    data <= X"0007";  wait for 10 ns;
    data <= X"000f";  wait for 10 ns;
    data <= X"001f";  wait for 10 ns;
    data <= X"003f";  wait for 10 ns;
    data <= X"007f";  wait for 10 ns;
    data <= X"00ff";  wait for 10 ns;
    data <= X"01ff";  wait for 10 ns;
    data <= X"03ff";  wait for 10 ns;
    data <= X"07ff";  wait for 10 ns;
    data <= X"0fff";  wait for 10 ns;
    data <= X"1fff";  wait for 10 ns;
    data <= X"3fff";  wait for 10 ns;
    data <= X"7fff";  wait for 10 ns;
    data <= X"ffff";  wait for 10 ns;
    wait;
  end process WaveGen_Proc;

  

end architecture tb;

