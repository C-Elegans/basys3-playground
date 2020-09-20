-------------------------------------------------------------------------------
-- Title      : Binary to bcd converter (special purpose)
-- Project    : 
-------------------------------------------------------------------------------
-- File       : bin_to_bcd.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-20
-- Last update: 2020-09-20
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
  bin_unsigned <= unsigned(binary);
  bin_m_10 <= bin_unsigned - 10;
  
  bcd <= "0000" & binary(3 downto 0) when bin_unsigned < 10 else
         "0001" & std_logic_vector(bin_m_10(3 downto 0));
end architecture rtl;

-------------------------------------------------------------------------------
