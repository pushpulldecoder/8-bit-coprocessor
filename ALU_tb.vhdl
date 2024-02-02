library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity ALU_tb is
end entity;

architecture testbench of ALU_tb is
  -- Component declaration
  component ALU
    port (
      IP_0, IP_1 : in std_logic_vector(7 downto 0);
      C_IN : in std_logic;
      S_0, S_1, S_2 : in std_logic;
      OP : out std_logic_vector(7 downto 0);
      C_OUT : out std_logic
    );
  end component;

  -- Signals for test bench
  signal IP_0, IP_1 : std_logic_vector(7 downto 0) := "00000000";
  signal C_IN : std_logic;
  signal S_0, S_1, S_2 : std_logic;
  signal OP : std_logic_vector(7 downto 0);
  signal C_OUT : std_logic;

begin
  -- Instantiate the design under test
  uut : ALU
  port map(
    IP_0 => IP_0,
    IP_1 => IP_1,
    C_IN => C_IN,
    S_0 => S_0,
    S_1 => S_1,
    S_2 => S_2,
    OP => OP,
    C_OUT => C_OUT
  );
  -- Stimulus process

  counter_process : process
  begin

    wait for 10 ns;
    -- D
    IP_0 <= "00101101";
    -- 6
    IP_1 <= "10010110";

    -- OP D
    C_IN <= '0';
    S_0 <= '0';
    S_1 <= '0';
    S_2 <= '0';
    wait for 10 ns;

    -- OP E
    C_IN <= '1';
    S_0 <= '0';
    S_1 <= '0';
    S_2 <= '0';
    wait for 10 ns;

    -- OP 3
    C_IN <= '0';
    S_0 <= '1';
    S_1 <= '0';
    S_2 <= '0';
    wait for 10 ns;

    -- OP 4
    C_IN <= '1';
    S_0 <= '1';
    S_1 <= '0';
    S_2 <= '0';
    wait for 10 ns;

    -- OP 6
    C_IN <= '0';
    S_0 <= '0';
    S_1 <= '1';
    S_2 <= '0';
    wait for 10 ns;

    -- OP 7
    C_IN <= '1';
    S_0 <= '0';
    S_1 <= '1';
    S_2 <= '0';
    wait for 10 ns;

    -- OP C
    C_IN <= '0';
    S_0 <= '1';
    S_1 <= '1';
    S_2 <= '0';
    wait for 10 ns;

    -- OP D
    C_IN <= '1';
    S_0 <= '1';
    S_1 <= '1';
    S_2 <= '0';
    wait for 10 ns;

    -- 2F
    IP_0 <= "00101111";
    -- 96
    IP_1 <= "10010110";

    -- OP 6
    C_IN <= '0';
    S_0 <= '0';
    S_1 <= '0';
    S_2 <= '1';
    wait for 10 ns;

    -- OP 6
    C_IN <= '0';
    S_0 <= '0';
    S_1 <= '1';
    S_2 <= '1';
    wait for 10 ns;

    -- OP F
    C_IN <= '1';
    S_0 <= '0';
    S_1 <= '0';
    S_2 <= '1';
    wait for 10 ns;

    -- OP F
    C_IN <= '1';
    S_0 <= '0';
    S_1 <= '1';
    S_2 <= '1';
    wait for 10 ns;

    -- OP 9
    C_IN <= '0';
    S_0 <= '1';
    S_1 <= '0';
    S_2 <= '1';
    wait for 10 ns;

    -- OP 9
    C_IN <= '0';
    S_0 <= '1';
    S_1 <= '1';
    S_2 <= '1';
    wait for 10 ns;

    -- OP 9
    C_IN <= '1';
    S_0 <= '1';
    S_1 <= '0';
    S_2 <= '1';
    wait for 10 ns;

    -- OP 9
    C_IN <= '1';
    S_0 <= '1';
    S_1 <= '1';
    S_2 <= '1';
    wait for 10 ns;

    stop(0);
  end process;

end architecture;