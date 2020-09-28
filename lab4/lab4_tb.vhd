-------------------------------------------------------------------------------
-- Title      : Testbench for design "lab4"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lab4_tb.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-27
-- Last update: 2020-09-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-09-27  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity lab4_tb is

end entity lab4_tb;

-------------------------------------------------------------------------------

architecture tb of lab4_tb is

  -- component generics
  constant CLOCK_FREQUENCY  : integer := 100_000_000;
  constant SWITCH_FREQUENCY : integer := 50_000_000;
  constant TICK_RATE        : integer := 10_000_000;

  -- component ports
  signal btnC : std_logic := '0';
  signal btnD : std_logic := '0';
  signal sw   : std_logic_vector(15 downto 0);
  signal led  : std_logic_vector(15 downto 0);
  signal seg  : std_logic_vector(7 downto 0);
  signal an   : std_logic_vector(3 downto 0);

  -- clock
  signal clk : std_logic := '1';

begin  -- architecture tb

  -- component instantiation
  DUT: entity work.lab4
    generic map (
      CLOCK_FREQUENCY  => CLOCK_FREQUENCY,
      SWITCH_FREQUENCY => SWITCH_FREQUENCY,
      TICK_RATE        => TICK_RATE)
    port map (
      clk  => clk,
      btnC => btnC,
      btnD => btnD,
      sw   => sw,
      led  => led,
      seg  => seg,
      an   => an);

  -- clock generation
  clk <= not clk after 5 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    btnD <= '1';
    wait for 10 ns;
    btnD <= '0';
    wait for 100 ns;
    btnC <= '1';
    wait for 40 ns;
    btnC <= '0';
    wait;
  end process WaveGen_Proc;

  

end architecture tb;

-------------------------------------------------------------------------------

configuration lab4_tb_tb_cfg of lab4_tb is
  for tb
  end for;
end lab4_tb_tb_cfg;

-------------------------------------------------------------------------------
