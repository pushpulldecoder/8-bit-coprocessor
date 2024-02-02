library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ARITHMETIC_UNIT is
  port (
    IP_0, IP_1 : in std_logic_vector(7 downto 0);
    C_IN : in std_logic;
    S_0, S_1 : in std_logic;
    OP : out std_logic_vector(7 downto 0);
    C_OUT : out std_logic
  );
end ARITHMETIC_UNIT;

architecture structure of ARITHMETIC_UNIT is
  component EIGHT_BIT_ADDER is
    port (
      IP_0, IP_1 : in std_logic_vector(7 downto 0);
      C_IN : in std_logic;
      OP : out std_logic_vector(7 downto 0);
      C_OUT : out std_logic
    );
  end component;

  signal Y : std_logic_vector(7 downto 0);

begin

  adder_0 : EIGHT_BIT_ADDER port map(IP_0 => IP_0, IP_1 => Y, C_IN => C_IN, OP => OP, C_OUT => C_OUT);

  with S_0 & S_1 select
  Y <= "00000000" when "00",
    IP_1 when "10",
    not IP_1(7) & not IP_1(6) & not IP_1(5) & not IP_1(4) & not IP_1(3) & not IP_1(2) & not IP_1(1) & not IP_1(0) when "01",
    "11111111" when others;
end architecture structure;