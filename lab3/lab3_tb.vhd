-------------------------------------------------------------------------------
-- Title      : Testbench for design "lab3"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lab3_tb.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-20
-- Last update: 2020-09-23
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

entity lab3_tb is

end entity lab3_tb;

-------------------------------------------------------------------------------

architecture tb of lab3_tb is

  -- component generics
  constant CLOCK_FREQUENCY  : integer := 100_000_000;
  constant SWITCH_FREQUENCY : integer := 20_000_000;

  -- component ports
  signal clk  : std_logic := '0';
  signal btnC : std_logic := '1';
  signal sw   : std_logic_vector(15 downto 0) := (others => '0');
  signal seg  : std_logic_vector(7 downto 0);
  signal an   : std_logic_vector(3 downto 0);
  signal led : std_logic_vector(15 downto 0);

  -- clock
  signal rst : std_logic := '1';

begin  -- architecture tb
  btnC <= rst;

  -- component instantiation
  DUT: entity work.lab3
    generic map (
      CLOCK_FREQUENCY  => CLOCK_FREQUENCY,
      SWITCH_FREQUENCY => SWITCH_FREQUENCY)
    port map (
      clk  => clk,
      btnC => btnC,
      sw   => sw,
      seg  => seg,
      an   => an,
      led => led);

  -- clock generation
  clk <= not clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
    variable shift_temp : unsigned(16 downto 0);
  begin
    -- insert signal assignments here
    rst <= '1';
    wait for 20 ns;
    wait until clk = '1';
    rst <= '0';
    for i in 0 to 16 loop
      shift_temp := shift_left(to_unsigned(1, 17), i) - 1;
      sw <= std_logic_vector(shift_temp(15 downto 0));
      wait for 500 ns;
    end loop;  -- i
    wait;
    
  end process WaveGen_Proc;

  

end architecture tb;

