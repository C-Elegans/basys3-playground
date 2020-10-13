-------------------------------------------------------------------------------
-- Title      : Celebration 7 seg
-- Project    : 
-------------------------------------------------------------------------------
-- File       : celebration.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-27
-- Last update: 2020-10-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Generates a celebratory pattern on the 7 segment display
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-09-27  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.types.all;

-------------------------------------------------------------------------------

entity celebration is

  
  generic (
    CLOCK_FREQUENCY: integer := 100_000_000; -- Hz
    -- The frequency to update the celebration pattern at
    TICK_RATE: integer := 5 -- Hz
    );
  port (
    clk : in std_logic;
    rst : in std_logic;
    en :  in std_logic;
    digits_celeb : out digits_t(0 to 1)
    );

end entity celebration;

-------------------------------------------------------------------------------

architecture str of celebration is

  signal seg_pattern : digits_t(0 to 1);
  signal baud_pulse : std_logic;
begin  -- architecture str

  baud_generator_1: entity work.baud_generator
    generic map (
      CLOCK_FREQUENCY => CLOCK_FREQUENCY,
      BAUD_RATE       => TICK_RATE)
    port map (
      clk        => clk,
      rst        => rst,
      en         => en,
      baud_pulse => baud_pulse);

  celebrate_proc: process(clk) is
  begin
    if rising_edge(clk) then
      if rst = '1' then
        seg_pattern(0) <= (7 => '1', others => '0');
        seg_pattern(1) <= (7 => '1', others => '0');
      else
        if baud_pulse = '1' then
          -- Cause digits to display a pattern of one segment lit, rotating
          -- about the digit. The two digits rotate in opposite directions

          -- This is essentially a rotate left or rotate right
          seg_pattern(0) <= seg_pattern(0)(2) & seg_pattern(0)(7 downto 3) & "00";
          seg_pattern(1) <= seg_pattern(1)(6 downto 2) & seg_pattern(1)(7) & "00";
        end if;
      end if;
    end if;
  end process celebrate_proc;

  -- Enable the digits when celebration is enabled
  digits_celeb(0) <= seg_pattern(0) when en = '1' else (others => '0');
  digits_celeb(1) <= seg_pattern(1) when en = '1' else (others => '0');
  

end architecture str;

-------------------------------------------------------------------------------
