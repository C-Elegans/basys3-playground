library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity test2 is
  
  port (
    sw  : in  std_logic_vector(4 downto 0);   -- referees
    led : out std_logic_vector(4 downto 0));  -- output

end entity test2;

architecture rtl of test2 is

begin  -- architecture rtl

    led(0) <= sw(0) or sw(1);

end architecture rtl;
