library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity LOGIC_UNIT_tb is
end entity;

architecture testbench of LOGIC_UNIT_tb is
  -- Component declaration
  component LOGIC_UNIT
    port (
      IP_0, IP_1 : in std_logic_vector(7 downto 0);
      S_0, S_1 : in std_logic;
      OP : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Signals for test bench
  signal IP_0, IP_1 : std_logic_vector(7 downto 0) := "00000000";
  signal S_0, S_1 : std_logic;
  signal OP : std_logic_vector(7 downto 0);

begin
  -- Instantiate the design under test
  uut : LOGIC_UNIT
  port map(
    IP_0 => IP_0,
    IP_1 => IP_1,
    S_0 => S_0,
    S_1 => S_1,
    OP => OP
  );
  -- Stimulus process

  counter_process : process
  begin

    wait for 10 ns;
    -- F
    IP_0 <= "00101111";
    -- 6
    IP_1 <= "10010110";

    -- OP 6
    S_0 <= '0';
    S_1 <= '0';
    wait for 10 ns;

    -- OP 9
    S_0 <= '0';
    S_1 <= '1';
    wait for 10 ns;

    -- OP F
    S_0 <= '1';
    S_1 <= '0';
    wait for 10 ns;

    -- OP 0
    S_0 <= '1';
    S_1 <= '1';
    wait for 10 ns;

    stop(0);
  end process;

end architecture;