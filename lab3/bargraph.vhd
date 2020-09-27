-------------------------------------------------------------------------------
-- Title      : Bar Graph
-- Project    : 
-------------------------------------------------------------------------------
-- File       : bargraph.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-22
-- Last update: 2020-09-22
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Creates a bar graph representing the number input
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-09-22  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity bargraph is

  generic (
    NUM_BITS : integer := 16;
    INPUT_BITS : integer := 5
    );

  port (
    count : in std_logic_vector(INPUT_BITS-1 downto 0);
    bargraph : out std_logic_vector(NUM_BITS-1 downto 0)
    );

end entity bargraph;

-------------------------------------------------------------------------------

architecture str of bargraph is
begin  -- architecture str
  bargraph_gen: for i in bargraph'low to bargraph'high generate
    bargraph(i) <= '1' when unsigned(count) > i else '0';
  end generate bargraph_gen;
end architecture str;

-------------------------------------------------------------------------------
