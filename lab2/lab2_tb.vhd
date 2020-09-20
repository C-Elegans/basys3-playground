-------------------------------------------------------------------------------
-- Title      : Testbench for design "lab2"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lab2_tb.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-11
-- Last update: 2020-09-15
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

entity lab2_tb is

end entity lab2_tb;

-------------------------------------------------------------------------------

architecture tb of lab2_tb is

  -- component ports
  signal data  : std_logic_vector(7 downto 0);
  signal seg : std_logic_vector(7 downto 0);
  signal an : std_logic_vector(3 downto 0);

  signal A : std_logic_vector(7 downto 0) := "01110010";
  signal B : std_logic_vector(4 to 7) := "1000";
  signal C : std_logic := '0';


begin  -- architecture tb

  -- component instantiation
  lab2_1: entity work.lab2
    port map (
      sw  => data,
      seg => seg,
      an  => an);

  -- waveform generation
  WaveGen_Proc: process
  begin
    report "A: " & to_hstring(C & B & A & C) & "h";
    for i in 0 to 255 loop
      data <= std_logic_vector(to_unsigned(i, 8));
      wait for 10 ns;
    end loop;  -- i
    wait;
  end process WaveGen_Proc;

  

end architecture tb;

