-------------------------------------------------------------------------------
-- Title      : Lab 3 - 16 bit count digits display
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lab3.vhd
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

-------------------------------------------------------------------------------

entity lab3 is

  generic (
    CLOCK_FREQUENCY : integer := 100_000_000;
    SWITCH_FREQUENCY : integer := 2000
    );

  port (
    clk : in std_logic;
    btnC : in std_logic;
    sw : in std_logic_vector(15 downto 0);
    seg : out std_logic_vector(7 downto 0);
    an: out std_logic_vector(3 downto 0)
    );

end entity lab3;

-------------------------------------------------------------------------------

architecture rtl of lab3 is

  constant DIGITS : integer := 2;

  signal rst : std_logic;
  signal rst_sync : std_logic_vector(2 downto 0) := (others => '1'); 

  -- popcnt signals
  signal count : std_logic_vector(4 downto 0);
  -- bin_to_bcd signals
  signal bcd_digits : std_logic_vector(4*DIGITS-1 downto 0);
  -- baud_generator signals
  signal digit_switch : std_logic;
  -- segment controller signals
  signal an_tmp : std_logic_vector(DIGITS-1 downto 0);
  signal bcd_seg : std_logic_vector(3 downto 0);
  -- decoder_7seg signals
  signal seg_tmp : std_logic_vector(7 downto 0);

begin  -- architecture rtl
  -- purpose: synchronizes the reset signal to the clk clock domain
  -- type   : sequential
  -- inputs : clk, btnC
  -- outputs: rst
  rst_proc: process (clk) is
  begin  -- process rst_proc
    if rising_edge(clk) then
      rst_sync <= rst_sync(1 downto 0) & btnC;
    end if;
  end process rst_proc;
  rst <= rst_sync(2);


  popcnt_1: entity work.popcnt
    port map (
      data  => sw,
      count => count);

  bin_to_bcd_1: entity work.bin_to_bcd
    port map (
      binary => count,
      bcd    => bcd_digits);

  baud_generator_1: entity work.baud_generator
    generic map (
      CLOCK_FREQUENCY => CLOCK_FREQUENCY,
      BAUD_RATE       => SWITCH_FREQUENCY)
    port map (
      clk        => clk,
      rst        => rst,
      baud_pulse => digit_switch);

  segment_controller_1: entity work.segment_controller
    generic map (
      DIGITS => DIGITS)
    port map (
      clk          => clk,
      rst          => rst,
      digit_switch => digit_switch,
      bcd_in       => bcd_digits,
      bcd_out      => bcd_seg,
      an           => an_tmp);
  

  decoder_7seg_1: entity work.decoder_7seg
    port map (
      data    => bcd_seg,
      seg_out => seg_tmp);

  gen1: for i in 0 to 7 generate
    seg(i) <= not seg_tmp(7-i);
  end generate gen1; 

  an(DIGITS-1 downto 0) <= not an_tmp;
  an(3 downto DIGITS) <= (others => '1');

end architecture rtl;

-------------------------------------------------------------------------------
