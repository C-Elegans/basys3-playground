-------------------------------------------------------------------------------
-- Title      : Lab 2 top module
-- Project    : 
-------------------------------------------------------------------------------
-- File       : lab2.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-11
-- Last update: 2020-09-14
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

entity lab2 is

  port (
    sw : in std_logic_vector(7 downto 0);
    seg : out std_logic_vector(7 downto 0);
    an: out std_logic_vector(3 downto 0)
    );

end entity lab2;

-------------------------------------------------------------------------------

architecture str of lab2 is

constant AN_DIGIT_1 : std_logic_vector(3 downto 0) := "1110";
  -----------------------------------------------------------------------------
  -- Internal signal declarations
  -----------------------------------------------------------------------------

  signal switch_count : std_logic_vector(3 downto 0);
  signal seg_temp : std_logic_vector(7 downto 0);
begin  -- architecture str

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------
  -- Since this whole thing is essentially counting the number of bits high
  -- from the switches, and then displaying that on the LCD, it makes sense to
  -- me to break it up into population count and doing the decoding

  -- instance "popcnt_1"
  popcnt_1: entity work.popcnt
    port map (
      data  => sw,
      count => switch_count);

  -- instance "decoder_7seg_1"
  decoder_7seg_1: entity work.decoder_7seg
    port map (
      data    => switch_count,
      seg_out => seg_temp);

  -- Connect up the segment signals to the LEDs. Since I chose conventional
  -- order, active high for my decoder, and the basys 3 has reversed order
  -- active low segments, we need to reverse and invert the segment bits.
  gen1: for i in 0 to 7 generate
    seg(i) <= not seg_temp(7-i);
  end generate gen1; 

  an <= AN_DIGIT_1;

end architecture str;

-------------------------------------------------------------------------------
