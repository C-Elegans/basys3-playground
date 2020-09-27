-------------------------------------------------------------------------------
-- Title      : Population Count
-- Project    : 
-------------------------------------------------------------------------------
-- File       : popcnt.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-11
-- Last update: 2020-09-21
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
    data : in std_logic_vector(15 downto 0);
    count : out std_logic_vector(4 downto 0)
    );

end entity popcnt;

-------------------------------------------------------------------------------

-- This part builds a binary tree of adders to sum up the number of bits
architecture rtl of popcnt is
  -- 8 sums of pairs of bits [0-1], [2-3], [4-5], [6-7], [8-9], [10-11],
  -- [12-13], [14-15]
  signal data_sum2 : std_logic_vector(15 downto 0);
  -- 4 sums of pairs of sums from sum2
  signal data_sum4 : std_logic_vector(11 downto 0);
  -- 2 sums of pairs of sums from sum4
  signal data_sum8 : std_logic_vector(7 downto 0);
  -- sum of pairs of sums from sum8
  signal data_sum16 : std_logic_vector(4 downto 0);

begin  -- architecture rtl

  -- For loop over the pairs of bits
  gen1: for i in 0 to 7 generate
    -- For some reason, I have to create seperate signals for the operands
    -- because you can't add std_logic bits together. Ugh.
    signal op1 : std_logic_vector(1 downto 0);
    signal op2 : std_logic_vector(1 downto 0);
  begin
    -- zero extend the operands
    op1 <= '0' & data(i*2);
    op2 <= '0' & data(i*2+1);
    -- Actually do the addition
    data_sum2(i*2+1 downto i*2) <=
      std_logic_vector(unsigned(op1) + unsigned(op2));
  end generate gen1;

  -- Loop over the pairs of values in data_sum2
  gen2: for i in 0 to 3 generate
    -- Yeah same thing as before
    signal op1 : std_logic_vector(2 downto 0);
    signal op2 : std_logic_vector(2 downto 0);
  begin
    -- zero extend the operands
    op1 <= '0' & data_sum2(i*4+1 downto i*4);
    op2 <= '0' & data_sum2(i*4+3 downto i*4+2);
    -- Do the addition
    data_sum4(i*3+2 downto i*3) <=
      std_logic_vector(unsigned(op1) + unsigned(op2));
  end generate gen2;

  gen3: for i in 0 to 1 generate
    -- Yeah same thing as before
    signal op1 : std_logic_vector(3 downto 0);
    signal op2 : std_logic_vector(3 downto 0);
  begin
    -- zero extend the operands
    op1 <= '0' & data_sum4(i*6+2 downto i*6);
    op2 <= '0' & data_sum4(i*6+5 downto i*6+3);
    -- Do the addition
    data_sum8(i*4+3 downto i*4) <=
      std_logic_vector(unsigned(op1) + unsigned(op2));
  end generate gen3;

  data_sum16 <= std_logic_vector(
    unsigned('0' & data_sum8(3 downto 0)) +
    unsigned('0' & data_sum8(7 downto 4)));

  count <= data_sum16;

end architecture rtl;
