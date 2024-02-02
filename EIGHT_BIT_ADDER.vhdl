library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity EIGHT_BIT_ADDER is
  port (
    IP_0, IP_1 : in std_logic_vector(7 downto 0);
    C_IN : in std_logic;
    OP : out std_logic_vector(7 downto 0);
    C_OUT : out std_logic
  );
end EIGHT_BIT_ADDER;

architecture structure of EIGHT_BIT_ADDER is
  component FULL_ADDER is
    port (
      IP_0, IP_1 : in std_logic;
      C_IN : in std_logic;
      OP : out std_logic;
      C_OUT : out std_logic
    );
  end component;
  signal CARRY : std_logic_vector(6 downto 0);
begin
  a00 : FULL_ADDER port map(IP_0 => IP_0(0), IP_1 => IP_1(0), C_IN => C_IN, OP => OP(0), C_OUT => CARRY(0));
  a01 : FULL_ADDER port map(IP_0 => IP_0(1), IP_1 => IP_1(1), C_IN => CARRY(0), OP => OP(1), C_OUT => CARRY(1));
  a02 : FULL_ADDER port map(IP_0 => IP_0(2), IP_1 => IP_1(2), C_IN => CARRY(1), OP => OP(2), C_OUT => CARRY(2));
  a03 : FULL_ADDER port map(IP_0 => IP_0(3), IP_1 => IP_1(3), C_IN => CARRY(2), OP => OP(3), C_OUT => CARRY(3));
  a04 : FULL_ADDER port map(IP_0 => IP_0(4), IP_1 => IP_1(4), C_IN => CARRY(3), OP => OP(4), C_OUT => CARRY(4));
  a05 : FULL_ADDER port map(IP_0 => IP_0(5), IP_1 => IP_1(5), C_IN => CARRY(4), OP => OP(5), C_OUT => CARRY(5));
  a06 : FULL_ADDER port map(IP_0 => IP_0(6), IP_1 => IP_1(6), C_IN => CARRY(5), OP => OP(6), C_OUT => CARRY(6));
  a07 : FULL_ADDER port map(IP_0 => IP_0(7), IP_1 => IP_1(7), C_IN => CARRY(6), OP => OP(7), C_OUT => C_OUT);
end architecture structure;