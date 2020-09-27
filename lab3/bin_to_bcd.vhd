-------------------------------------------------------------------------------
-- Title      : Binary to bcd converter (special purpose)
-- Project    : 
-------------------------------------------------------------------------------
-- File       : bin_to_bcd.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-20
-- Last update: 2020-09-21
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Converts a 5 bit binary number (0-16) to BCD for use with 7
-- segment display
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

entity bin_to_bcd is

  port (
    binary : in std_logic_vector(4 downto 0);
    bcd : out std_logic_vector(7 downto 0)
    );

end entity bin_to_bcd;

-------------------------------------------------------------------------------

architecture rtl of bin_to_bcd is
  signal bin_unsigned : unsigned(4 downto 0);
  signal bin_m_10 : unsigned(4 downto 0);
begin  -- architecture str
  -- I could have made this generic and capable of handling the full complement
  -- of two digit numbers, but that would have required a divide by 10, which
  -- is a pain. Instead, I limit it to only 0-19, which is perfectly sufficient
  -- for this lab and can just use a simple comparator and subtractor

  -- Convenience signals
  bin_unsigned <= unsigned(binary);
  bin_m_10 <= bin_unsigned - 10;
  
  -- Outputs 0 for the top digit and bin[3:0] for the bottom digit when bin < 10,
  -- Otherwise, outputs 1 for the top digit and (bin-10)[3:0]
  bcd <= "0000" & binary(3 downto 0) when bin_unsigned < 10 else
         "0001" & std_logic_vector(bin_m_10(3 downto 0));
end architecture rtl;

-------------------------------------------------------------------------------
