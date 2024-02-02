library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity BARREL_SHIFTER_tb is
end entity;

architecture testbench of BARREL_SHIFTER_tb is
  -- Component declaration
  component BARREL_SHIFTER
    port (
      IP : in std_logic_vector(7 downto 0);
      DIR : in std_logic;
      OP : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Signals for test bench
  signal IP : std_logic_vector(7 downto 0) := "00000000";
  signal DIR : std_logic;
  signal OP : std_logic_vector(7 downto 0);

begin
  -- Instantiate the design under test
  uut : BARREL_SHIFTER
  port map(
    IP => IP,
    DIR => DIR,
    OP => OP
  );
  -- Stimulus process

  counter_process : process
  begin

    wait for 10 ns;
    -- 6
    IP <= "01100110";

    DIR <= '0';
    wait for 10 ns;

    DIR <= '1';
    wait for 10 ns;

    stop(0);
  end process;

end architecture;