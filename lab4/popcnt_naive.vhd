library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity popcnt is

  port (
    data  : in  std_logic_vector(15 downto 0);
    count : out std_logic_vector(4 downto 0));

end entity popcnt;

architecture rtl of popcnt is
begin  -- architecture rtl

  count_proc: process (data) is
    variable count_tmp : integer range 0 to 16 := 0;
  begin  -- process count_proc
    count_tmp := 0;
    for i in data'low to data'high loop
      if data(i) = '1' then
        count_tmp := count_tmp + 1;
      end if;
    end loop;  -- i
    count <= std_logic_vector(to_unsigned(count_tmp, 5));
  end process count_proc;

  

end architecture rtl;
