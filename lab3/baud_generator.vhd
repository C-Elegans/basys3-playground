-------------------------------------------------------------------------------
-- Title      : Baud rate generator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : baud_generator.vhd
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

entity baud_generator is

  generic (
    CLOCK_FREQUENCY: integer := 50_000_000; -- Hz
    BAUD_RATE: integer := 200 -- Hz
    );

  port (
    clk: in std_logic;
    rst: in std_logic;
    baud_pulse : out std_logic
    );

end entity baud_generator;

-------------------------------------------------------------------------------

architecture str of baud_generator is

  signal counter : integer := 0;
  constant MAX_COUNT : integer := CLOCK_FREQUENCY / BAUD_RATE - 1;
begin  -- architecture str

  -- purpose: increment the counter and reset if it reaches MAX_COUNT
  -- type   : sequential
  -- inputs : clk, rst
  -- outputs: baud_pulse
count_proc: process (clk) is
  begin  -- process count_proc
   if rising_edge(clk) then  -- rising clock edge
     if rst = '1' then -- reset counter
       counter <= 0;
       baud_pulse <= '0';
     else
       baud_pulse <= '0';
       counter <= counter + 1;
       if counter >= MAX_COUNT then
         counter <= 0;
         baud_pulse <= '1';
       end if;
     end if;
   end if;
  end process count_proc;  

end architecture str;

-------------------------------------------------------------------------------
