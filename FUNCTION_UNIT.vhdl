library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FUNCTION_UNIT is
  port (
    CLK : in std_logic;
    IP_0, IP_1 : in std_logic_vector(7 downto 0);
    F_SEL : in std_logic_vector(3 downto 0);
    OP : out std_logic_vector(7 downto 0);
    V, C, N, Z : out std_logic
  );
end FUNCTION_UNIT;

architecture structure of FUNCTION_UNIT is
  component ALU is
    port (
      IP_0, IP_1 : in std_logic_vector(7 downto 0);
      C_IN : in std_logic;
      S_0, S_1, S_2 : in std_logic;
      OP : out std_logic_vector(7 downto 0);
      C_OUT : out std_logic
    );
  end component;

  component BARREL_SHIFTER is
    port (
      IP : in std_logic_vector(7 downto 0);
      DIR : in std_logic;
      OP : out std_logic_vector(7 downto 0)
    );
  end component;
  signal ALU_O : std_logic_vector(7 downto 0);
  signal BRL_O : std_logic_vector(7 downto 0);

begin

  alu_0 : ALU port map(IP_0 => IP_0, IP_1 => IP_1, C_IN => F_SEL(0), S_0 => F_SEL(1), S_1 => F_SEL(2), S_2 => F_SEL(3), OP => ALU_O, C_OUT => C);
  brl_0 : BARREL_SHIFTER port map(IP => IP_1, DIR => F_SEL(0), OP => BRL_O);
  nega : N <= OP(7);
  zero : Z <= OP(7) and OP(6) and OP(5) and OP(4) and OP(3) and OP(2) and OP(1) and OP(0);

  with F_SEL(3) and F_SEL(2) select
  OP <= ALU_O when '0',
    BRL_O when others;

  -- process (CLK)
  -- begin
  --   if rising_edge(CLK) then
  --     case F_SEL(3) and F_SEL(2) is
  --       when '0' =>
  --         OP <= ALU_O;
  --       when others =>
  --         OP <= BRL_O;
  --     end case;
  --   end if;
  -- end process;
end architecture structure;