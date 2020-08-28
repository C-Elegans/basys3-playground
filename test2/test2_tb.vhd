-------------------------------------------------------------------------------
-- Title      : Testbench for design "test2"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : test2_tb.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-08-28
-- Last update: 2020-08-28
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-08-28  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity test2_tb is

end entity test2_tb;

-------------------------------------------------------------------------------

architecture tb of test2_tb is

  -- component ports
  signal sw  : std_logic_vector(4 downto 0);
  signal led : std_logic_vector(2 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture tb

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
    sw <= "00000"; wait for 10 ns;
    sw <= "00001"; wait for 10 ns;
    sw <= "00010"; wait for 10 ns;
    sw <= "00011"; wait for 10 ns;
    sw <= "00100"; wait for 10 ns;
    sw <= "00101"; wait for 10 ns;
    sw <= "00110"; wait for 10 ns;
    sw <= "00111"; wait for 10 ns;
    sw <= "01000"; wait for 10 ns;
    sw <= "01001"; wait for 10 ns;
    sw <= "01010"; wait for 10 ns;
    sw <= "01011"; wait for 10 ns;
    sw <= "01100"; wait for 10 ns;
    sw <= "01101"; wait for 10 ns;
    sw <= "01110"; wait for 10 ns;
    sw <= "01111"; wait for 10 ns;
    sw <= "10000"; wait for 10 ns;
    sw <= "10001"; wait for 10 ns;
    sw <= "10010"; wait for 10 ns;
    sw <= "10011"; wait for 10 ns;
    sw <= "10100"; wait for 10 ns;
    sw <= "10101"; wait for 10 ns;
    sw <= "10110"; wait for 10 ns;
    sw <= "10111"; wait for 10 ns;
    sw <= "11000"; wait for 10 ns;
    sw <= "11001"; wait for 10 ns;
    sw <= "11010"; wait for 10 ns;
    sw <= "11011"; wait for 10 ns;
    sw <= "11100"; wait for 10 ns;
    sw <= "11101"; wait for 10 ns;
    sw <= "11110"; wait for 10 ns;
    sw <= "11111"; wait for 10 ns;

    wait;
  end process WaveGen_Proc;

  

end architecture tb;

-------------------------------------------------------------------------------

configuration test2_tb_tb_cfg of test2_tb is
  for tb
  end for;
end test2_tb_tb_cfg;

-------------------------------------------------------------------------------
