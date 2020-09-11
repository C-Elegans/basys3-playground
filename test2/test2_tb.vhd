-------------------------------------------------------------------------------
-- Title      : Testbench for design "test2"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : test2_tb.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-05
-- Last update: 2020-09-06
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-09-05  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity test2_tb is

end entity test2_tb;

-------------------------------------------------------------------------------

architecture test2_tb of test2_tb is

  -- component ports
  signal sw  : std_logic_vector(3 downto 0);
  signal led : std_logic_vector(1 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture test2_tb

  -- component instantiation
  DUT: entity work.test2
    port map (
      sw  => sw,
      led => led);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation

  WaveGen_Proc: process
  begin
    -- insert signal assignments here
    sw <= "0000"; wait for 10 ns;
    sw <= "0001"; wait for 10 ns;
    sw <= "0010"; wait for 10 ns;
    sw <= "0011"; wait for 10 ns;
    sw <= "0100"; wait for 10 ns;
    sw <= "0101"; wait for 10 ns;
    sw <= "0110"; wait for 10 ns;
    sw <= "0111"; wait for 10 ns;
    sw <= "1000"; wait for 10 ns;
    sw <= "1001"; wait for 10 ns;
    sw <= "1010"; wait for 10 ns;
    sw <= "1011"; wait for 10 ns;
    sw <= "1100"; wait for 10 ns;
    sw <= "1101"; wait for 10 ns;
    sw <= "1110"; wait for 10 ns;
    sw <= "1111"; wait for 10 ns;

    wait;
  end process WaveGen_Proc;

  

end architecture test2_tb;

