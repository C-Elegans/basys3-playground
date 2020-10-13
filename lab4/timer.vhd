-------------------------------------------------------------------------------
-- Title      : A countdown timer from 20
-- Project    : 
-------------------------------------------------------------------------------
-- File       : timer.vhd
-- Author     :   <mnolan@trillian>
-- Company    : 
-- Created    : 2020-09-27
-- Last update: 2020-10-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-09-27  1.0      mnolan	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity timer is

  generic (
    COUNTER_BITS : integer := 5;
    MAX_COUNT : integer := 20;
    CLOCK_FREQUENCY: integer := 100_000_000; -- Hz
    TICK_RATE: integer := 200 -- Hz
    );

  port (
    clk : in std_logic;
    rst : in std_logic;
    pause_resume : in std_logic;

    count : out std_logic_vector(COUNTER_BITS-1 downto 0);
    zero : out std_logic
    );

end entity timer;

-------------------------------------------------------------------------------

architecture str of timer is
signal pause_res_sync : std_logic_vector(2 downto 0);
signal running : std_logic;
signal baud_pulse : std_logic;
signal count_tmp : unsigned(COUNTER_BITS-1 downto 0);
begin  -- architecture str
  -- purpose: synchronizes pause_resume to the clk clock domain
  -- type   : sequential
  -- inputs : clk, pause_resume
  -- outputs: pause_res_sync
  pause_resume_sync_proc: process (clk) is
  begin  -- process pause_resume_sync_proc
    if rising_edge(clk) then
      if rst = '1' then
        pause_res_sync <= (others => '0');
      else
        pause_res_sync <= pause_res_sync(1 downto 0) & pause_resume;
        end if;
    end if;
  end process pause_resume_sync_proc;

  -- baud_generator generates a pulse every second to cause the timer to count
  -- down
  baud_generator_1: entity work.baud_generator
    generic map (
      CLOCK_FREQUENCY => CLOCK_FREQUENCY,
      BAUD_RATE       => TICK_RATE)
    port map (
      clk        => clk,
      rst        => rst,
      en         => running,
      baud_pulse => baud_pulse);
  
  -- purpose: Counts down the timer on every tick of baud_pulse, pauses and resumes the timer when pause_res is pressed
  -- type   : sequential
  -- inputs : clk, rst, pause_res_sync, baud_pulse
  -- outputs: count_tmp
  timer_proc: process (clk) is
  begin  -- process timer_proc
    if rising_edge(clk) then
      if rst = '1' then
        count_tmp <= to_unsigned(MAX_COUNT, COUNTER_BITS);
        running <= '0';
      else
        -- handle running signal - toggle on rising edge of pause_res_sync
        if pause_res_sync(2 downto 1) = "01" then
          running <= not running;
        end if;


        -- count down timer every time baud_generator outputs a pulse
        if baud_pulse = '1' then
          if count_tmp /= 0 then
            count_tmp <= count_tmp - 1;
          end if;
        end if;

      end if;
    end if;
  end process timer_proc;

  count <= std_logic_vector(count_tmp);
  zero <= '1' when count_tmp = 0 else '0';

end architecture str;

-------------------------------------------------------------------------------
