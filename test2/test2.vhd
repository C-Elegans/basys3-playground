library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity test2 is
  
  port (
    sw  : in  std_logic_vector(4 downto 0);   -- referees
    led : out std_logic_vector(2 downto 0));  -- output

end entity test2;

architecture rtl of test2 is
  signal vote_result : std_logic := '0';
  signal tie : std_logic := '0';

begin  -- architecture rtl

  vote_result <= (sw(0) and sw(1)) or (sw(2) and sw(3));

  tie <= (    sw(0) and     sw(1) and not sw(2) and not sw(3)) or
         (not sw(0) and     sw(1) and not sw(2) and     sw(3)) or
         (    sw(0) and not sw(1) and not sw(2) and     sw(3)) or
         (not sw(0) and not sw(1) and     sw(2) and     sw(3)) or
         (not sw(0) and     sw(1) and     sw(2) and not sw(3)) or
         (    sw(0) and not sw(1) and     sw(2) and not sw(3));

  led(0) <= vote_result;
  led(1) <= tie;
  led(2) <= (not tie and vote_result) or (tie and sw(4));

end architecture rtl;
