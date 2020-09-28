library ieee;
use ieee.std_logic_1164.all;

package types is
  type digits_t is array (natural range <>) of std_logic_vector(7 downto 0);
end package;
