-------------------------------------------------------------------------------
-- Title      : Lab 3 - 16 bit count digits display
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lab4.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-20
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
-- 2020-09-20  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.types.all;
-------------------------------------------------------------------------------

entity lab4 is

  generic (
    CLOCK_FREQUENCY : integer := 100_000_000;
    SWITCH_FREQUENCY : integer := 2000;
    TICK_RATE : integer := 1
    );

  port (
    clk : in std_logic;
    btnC : in std_logic;
    btnD : in std_logic;
    sw : in std_logic_vector(15 downto 0);
    led : out std_logic_vector(15 downto 0);
    seg : out std_logic_vector(7 downto 0);
    an: out std_logic_vector(3 downto 0)
    );

end entity lab4;

-------------------------------------------------------------------------------

architecture rtl of lab4 is

  -- Number of digits to activate
  constant DIGITS : integer := 2;
  constant MAX_COUNT : integer := 20;
  constant COUNTER_BITS : integer := 5;

  signal rst : std_logic;
  -- Flip flop synchronizer for the reset signal
  signal rst_sync : std_logic_vector(2 downto 0) := (others => '1'); 

  signal zero : std_logic;
  signal count : std_logic_vector(COUNTER_BITS-1 downto 0);
  -- bin_to_bcd signals
  signal bcd_digits : std_logic_vector(4*DIGITS-1 downto 0);
  -- baud_generator signals
  signal digit_switch : std_logic;
  -- segment controller signals
  signal digits_sig : digits_t(0 to DIGITS-1);
  signal an_tmp : std_logic_vector(DIGITS-1 downto 0);
  -- decoder_7seg signals
  signal seg_tmp : std_logic_vector(7 downto 0);

begin  -- architecture rtl
  -- purpose: synchronizes the reset signal to the clk clock domain
  -- type   : sequential
  -- inputs : clk, btnD
  -- outputs: rst
  rst_proc: process (clk) is
  begin  -- process rst_proc
    if rising_edge(clk) then
      rst_sync <= rst_sync(1 downto 0) & btnD;
    end if;
  end process rst_proc;
  rst <= rst_sync(2);

  -- No other signals need to be synchronized because no other inputs feed into
  -- flip flops

  timer_1: entity work.timer
    generic map (
      COUNTER_BITS    => COUNTER_BITS,
      MAX_COUNT       => MAX_COUNT,
      CLOCK_FREQUENCY => CLOCK_FREQUENCY,
      TICK_RATE       => TICK_RATE)
    port map (
      clk          => clk,
      rst          => rst,
      pause_resume => btnC,
      count        => count,
      zero         => zero);


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
      en => '1',
      baud_pulse => digit_switch);

  
  decoder_7seg_1: entity work.decoder_7seg
    port map (
      data    => bcd_digits(3 downto 0),
      seg_out => digits_sig(0));

  decoder_7seg_2: entity work.decoder_7seg
    port map (
      data    => bcd_digits(7 downto 4),
      seg_out => digits_sig(1));

  
  segment_controller_1: entity work.segment_controller
    generic map (
      DIGITS => DIGITS)
    port map (
      clk          => clk,
      rst          => rst,
      digit_switch => digit_switch,
      digits_in       => digits_sig,
      digits_out      => seg_tmp,
      an           => an_tmp);
  

  -- decoder_7seg uses active high segments with order abcdefg
  -- basys 3 uses active low segments with order gfedcba
  gen1: for i in 0 to 7 generate
    seg(i) <= not seg_tmp(7-i);
  end generate gen1; 

  -- Combine the an output from segment_controller with the anode disable
  -- signal for the other digits
  an(DIGITS-1 downto 0) <= not an_tmp;
  an(3 downto DIGITS) <= (others => '1');

end architecture rtl;

-------------------------------------------------------------------------------
