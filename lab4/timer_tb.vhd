-------------------------------------------------------------------------------
-- Title      : Testbench for design "timer"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : timer_tb.vhd
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

entity timer_tb is

end entity timer_tb;

-------------------------------------------------------------------------------

architecture tb of timer_tb is

  -- component generics
  constant COUNTER_BITS    : integer := 5;
  constant MAX_COUNT       : integer := 20;
  constant CLOCK_FREQUENCY : integer := 100_000_000;
  constant TICK_RATE       : integer := 20_000_000;

  -- component ports
  signal clk          : std_logic := '1';
  signal rst          : std_logic := '1';
  signal pause_resume : std_logic := '0';
  signal count        : std_logic_vector(COUNTER_BITS-1 downto 0);
  signal zero         : std_logic;


begin  -- architecture tb

  -- component instantiation
  DUT: entity work.timer
    generic map (
      COUNTER_BITS    => COUNTER_BITS,
      MAX_COUNT       => MAX_COUNT,
      CLOCK_FREQUENCY => CLOCK_FREQUENCY,
      TICK_RATE       => TICK_RATE)
    port map (
      clk          => clk,
      rst          => rst,
      pause_resume => pause_resume,
      count        => count,
      zero         => zero);

  -- clock generation
  clk <= not clk after 5 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    rst <= '1';
    wait for 10 ns;
    rst <= '0';

    -- start
    pause_resume <= '1';
    wait for 40 ns;
    pause_resume <= '0';

    wait for 500 ns;

    -- pause
    pause_resume <= '1';
    wait for 40 ns;
    pause_resume <= '0';

    wait for 200 ns;

    -- resume
    pause_resume <= '1';
    wait for 40 ns;
    pause_resume <= '0';

    
    wait;
  end process WaveGen_Proc;

  

end architecture tb;

