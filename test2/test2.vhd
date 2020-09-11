library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity test2 is
  -- I don't particularly want to modify the IO constraints file, so I'm naming
  -- these signals as they are named on the board
  port (
    sw  : in  std_logic_vector(3 downto 0);   -- referees
    led : out std_logic_vector(1 downto 0));  -- output

end entity test2;

architecture rtl of test2 is
  -- The 3 regular referees
  signal referees : std_logic_vector(2 downto 0);
  -- The head referee
  signal head_ref : std_logic;
  -- Whether the 3 regular referees will override the decision of the head ref
  signal override : std_logic;
  -- The overall decision
  signal call : std_logic;

begin  -- architecture rtl
  referees <= sw(2 downto 0);
  head_ref <= sw(3);

  -- The overall call only differs from the head referee when the three regular
  -- referees have the same value, and the head ref is different. This override
  -- signal is only high when the 3 regular referees all agree, and disagree
  -- with head_ref
  override <= (    referees(0) and     referees(1) and     referees(2)
               and not head_ref) or
              (not referees(0) and not referees(1) and not referees(2)
               and     head_ref);
              
  
  -- Since the overall decision is that of the head ref, except when the
  -- regular referees override the head ref (in which case the overall decision
  -- is the opposite of the head ref, an XOR between override and head ref will
  -- do.
  call <= head_ref xor override;

  -- Assigning the output
  led(0) <= call;
  -- I'm not sure what's up, but the leds would not light up if I tried to use
  -- only one of the led outputs. (like making led a std_logic or
  -- std_logic_vector(0 downto 0). As such, I have to have a dummy output of led(1)
  led(1) <= '0';


end architecture rtl;
