library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BARREL_SHIFTER is
  port (
    IP : in std_logic_vector(7 downto 0);
    DIR : in std_logic;
    OP : out std_logic_vector(7 downto 0)
  );
end BARREL_SHIFTER;

architecture structure of BARREL_SHIFTER is
begin

  with DIR select
  OP <= IP(0) & IP(7 downto 1) when '1',
    IP(6 downto 0) & IP(7) when others;
end architecture structure;