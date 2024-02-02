library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
  port (
    IP_0, IP_1 : in std_logic_vector(7 downto 0);
    C_IN : in std_logic;
    S_0, S_1, S_2 : in std_logic;
    OP : out std_logic_vector(7 downto 0);
    C_OUT : out std_logic
  );
end ALU;

architecture structure of ALU is
  component ARITHMETIC_UNIT is
    port (
      IP_0, IP_1 : in std_logic_vector(7 downto 0);
      C_IN : in std_logic;
      S_0, S_1 : in std_logic;
      OP : out std_logic_vector(7 downto 0);
      C_OUT : out std_logic
    );
  end component;

  component LOGIC_UNIT is
    port (
      IP_0, IP_1 : in std_logic_vector(7 downto 0);
      S_0, S_1 : in std_logic;
      OP : out std_logic_vector(7 downto 0)
    );
  end component;

  signal AU_O : std_logic_vector(7 downto 0);
  signal LU_O : std_logic_vector(7 downto 0);

begin

  au_0 : ARITHMETIC_UNIT port map(IP_0 => IP_0, IP_1 => IP_1, C_IN => C_IN, S_0 => S_0, S_1 => S_1, OP => AU_O, C_OUT => C_OUT);
  lu_0 : LOGIC_UNIT port map(IP_0 => IP_0, IP_1 => IP_1, S_0 => C_IN, S_1 => S_0, OP => LU_O);

  with S_2 select
    OP <= AU_O when '0',
    LU_O when others;
end architecture structure;