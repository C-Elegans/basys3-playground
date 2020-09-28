-------------------------------------------------------------------------------
-- Title      : 7 segment controller / sequencer
-- Project    : 
-------------------------------------------------------------------------------
-- File       : segment_controller.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-20
-- Last update: 2020-09-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: selects bcd digits and anode outputs from a bcd input and pulse
-- train
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

entity segment_controller is

  generic (
    DIGITS : integer := 2
    );

  port (
    clk : in std_logic;
    rst : in std_logic; -- synchronous reset (active high)
    digit_switch : in std_logic; -- Pulse to switch between digits
    -- bcd numbers for each digit to display
    digits_in : in digits_t(0 to DIGITS-1);

    -- the bcd to feed into the 7 segment decoder for the current digit
    digits_out : out std_logic_vector(7 downto 0);
    -- the anode select pins
    an : out std_logic_vector(DIGITS-1 downto 0)
    );

end entity segment_controller;

-------------------------------------------------------------------------------

architecture rtl of segment_controller is

  signal sel : std_logic_vector(DIGITS-1 downto 0);
begin  -- architecture rtl
  -- purpose: changes digits on every pulse of digit_switch
  -- type   : sequential
  -- inputs : clk, digit_switch
  -- outputs: sel
  sel_proc: process (clk) is
  begin  -- process sel_proc
    if rising_edge(clk) then
      if rst = '1' then
        -- resets sel to 1
        sel <= (0 => '1', others => '0');
      else
        -- On pulse of digit_switch, rotate sel left
        if digit_switch = '1' then
          sel <= sel(DIGITS-2 downto 0) & sel(DIGITS-1);
        end if;
      end if;
    end if;
  end process sel_proc;


  -- purpose: mux to select which bcd digit gets output to bcd_out -- selected using sel as 1-hot selector
  -- type   : combinational
  -- inputs : bcd_in, sel
  -- outputs: bcd_out
  bcd_proc: process (digits_in, sel) is
  begin  -- process bcd_proc
    digits_out <= (others => '0');

    -- Selects the bcd data to output by using sel as a 1-hot mux
    for i in 0 to DIGITS-1 loop
      if sel(i) = '1' then
        digits_out <= digits_in(i);
      end if;
    end loop;  -- i
  end process bcd_proc;

  an <= sel;
end architecture rtl;
