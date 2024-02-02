library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity LOGIC_UNIT is
  port (
    IP_0, IP_1 : in std_logic_vector(7 downto 0);
    S_0, S_1 : in std_logic;
    OP : out std_logic_vector(7 downto 0)
  );
end LOGIC_UNIT;

architecture structure of LOGIC_UNIT is
begin
  with S_1 & S_0 select
  OP <= IP_0 and IP_1 when "00",
    IP_0 or IP_1 when "01",
    IP_0 xor IP_1 when "10",
    not IP_0(7) & not IP_0(6) & not IP_0(5) & not IP_0(4) & not IP_0(3) & not IP_0(2) & not IP_0(1) & not IP_0(0) when others;
end architecture structure;