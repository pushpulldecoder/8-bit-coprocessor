library ieee;
use ieee.std_logic_1164.all;
use std.env.all;

entity FUNCTION_UNIT_tb is
end entity;

architecture testbench of FUNCTION_UNIT_tb is
  -- Component declaration
  component FUNCTION_UNIT
    port (
      IP_0, IP_1 : in std_logic_vector(15 downto 0);
      F_SEL : in std_logic_vector(3 downto 0);
      OP : out std_logic_vector(15 downto 0);
      V, C, N, Z : out std_logic
    );
  end component;

  -- Signals for test bench
  signal IP_0, IP_1 : std_logic_vector(15 downto 0) := "0000000000000000";
  signal F_SEL : std_logic_vector(3 downto 0);
  signal S_0, S_1, S_2 : std_logic;
  signal OP : std_logic_vector(15 downto 0);
  signal V, C, N, Z : std_logic;

begin
  -- Instantiate the design under test
  uut : FUNCTION_UNIT
  port map(
    IP_0 => IP_0,
    IP_1 => IP_1,
    F_SEL => F_SEL,
    OP =>  OP,
    V => V,
    N => N,
    C => C,
    Z => Z
  );
  -- Stimulus process

  counter_process : process
  begin

    wait for 10 ns;
    -- 976D
    IP_0 <= "1001011101101101";
    -- 3ACD / ~C532
    IP_1 <= "0011101011001101";

    -- 0  976D
    F_SEL <= "0000";
    wait for 10 ns;

    -- 1  976E
    F_SEL <= "0001";
    wait for 10 ns;

    -- 2  D23A
    F_SEL <= "0010";
    wait for 10 ns;

    -- 3  D23B
    F_SEL <= "0011";
    wait for 10 ns;

    -- 4  5C9F
    F_SEL <= "0100";
    wait for 10 ns;

    -- 5  5CA0
    F_SEL <= "0101";
    wait for 10 ns;

    -- 6  976C
    F_SEL <= "0110";
    wait for 10 ns;

    -- 7  976D
    F_SEL <= "0111";
    wait for 10 ns;

    -- 8  124D
    F_SEL <= "1000";
    wait for 10 ns;

    -- 9  BFED
    F_SEL <= "1001";
    wait for 10 ns;

    -- A  ADA0
    F_SEL <= "1010";
    wait for 10 ns;

    -- B  6892
    F_SEL <= "1011";
    wait for 10 ns;

    -- C  3ACD
    F_SEL <= "1100";
    wait for 10 ns;

    -- D  9D66
    F_SEL <= "1101";
    wait for 10 ns;

    -- E  759A
    F_SEL <= "1110";
    wait for 10 ns;

    stop(0);
  end process;

end architecture;