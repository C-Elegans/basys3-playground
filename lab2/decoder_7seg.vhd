-------------------------------------------------------------------------------
-- Title      : LCD decoder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : decoder_7seg.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-11
-- Last update: 2020-09-11
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Decodes lcds
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-09-11  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity decoder_7seg is

  port (
    data : in std_logic_vector(3 downto 0);
    -- LCD segments abcdefgdp - active high
    seg_out : out std_logic_vector(7 downto 0)
    );

end entity decoder_7seg;

-------------------------------------------------------------------------------

architecture str of decoder_7seg is

begin  -- architecture str
  with data select
    seg_out <= "01100000" when "0001",  -- 1
               "11011010" when "0010",  -- 2
               "11110010" when "0011",  -- 3
               "01100110" when "0100",  -- 4
               "10110110" when "0101",  -- 5
               "10111110" when "0110",  -- 6
               "11100000" when "0111",  -- 7
               "11111110" when "1000",  -- 8
               "11110110" when "1001",  -- 9
               "11111100" when others;  -- 0
end architecture str;

-------------------------------------------------------------------------------
