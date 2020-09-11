-------------------------------------------------------------------------------
-- Title      : Population Count
-- Project    : 
-------------------------------------------------------------------------------
-- File       : popcnt.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-11
-- Last update: 2020-09-11
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Counts the number of bits in the input 
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

entity popcnt is

  port (
    data : in std_logic_vector(7 downto 0);
    count : out std_logic_vector(3 downto 0)
    );

end entity popcnt;

-------------------------------------------------------------------------------

architecture rtl of popcnt is
  signal data_sum2 : std_logic_vector(7 downto 0);
  signal data_sum4 : std_logic_vector(5 downto 0);
  signal data_sum8 : std_logic_vector(3 downto 0);

begin  -- architecture rtl
  gen1: for i in 0 to 3 generate
    signal op1 : std_logic_vector(1 downto 0);
    signal op2 : std_logic_vector(1 downto 0);
  begin
    op1 <= '0' & data(i*2);
    op2 <= '0' & data(i*2+1);
    data_sum2(i*2+1 downto i*2) <=
      std_logic_vector(unsigned(op1) + unsigned(op2));
  end generate gen1;

  gen2: for i in 0 to 1 generate
    signal op1 : std_logic_vector(2 downto 0);
    signal op2 : std_logic_vector(2 downto 0);
  begin
    op1 <= '0' & data_sum2(i*4+1 downto i*4);
    op2 <= '0' & data_sum2(i*4+3 downto i*4+2);
    data_sum4(i*3+2 downto i*3) <= std_logic_vector(unsigned(op1) + unsigned(op2));
  end generate gen2;

  data_sum8 <= std_logic_vector(
    unsigned('0' & data_sum4(2 downto 0)) +
    unsigned('0' & data_sum4(5 downto 3)));

  count <= data_sum8;

end architecture rtl;

-------------------------------------------------------------------------------
