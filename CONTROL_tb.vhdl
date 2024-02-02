library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity CONTROL_tb is
end entity;

architecture testbench of CONTROL_tb is
  -- Component declaration
  component CONTROL
    port (
      CLK : in std_logic;
      RESET : in std_logic;
      OPCODE : out std_logic_vector(6 downto 0);
      CONTROL_WORD : out std_logic_vector(19 downto 0)
    );
  end component;

  -- Signals for test bench
  signal CLK : std_logic;
  signal RESET : std_logic;
  signal OPCODE : std_logic_vector(6 downto 0);
  signal CONTROL_WORD : std_logic_vector(19 downto 0);

begin
  -- Instantiate the design under test
  uut : CONTROL
  port map(
    CLK => CLK,
    RESET => RESET,
    OPCODE => OPCODE,
    CONTROL_WORD => CONTROL_WORD
  );
  -- Stimulus process

  clk_process : process
  begin
    -- Initialize clock signal
    while now < 1000 ns loop
      CLK <= '1';
      wait for 5 ns;
      CLK <= '0';
      wait for 5 ns;
    end loop;
    wait;
  end process;

  counter_process : process
  begin

    RESET <= '1';
    wait for 10 ns;

    RESET <= '0';
    wait for 10 ns;

    -- initialize register  0
    -- 0000000000000011

    -- initialize register  1
    -- 0010000000000011

    -- initialize register  2
    -- 0100000000000011

    -- initialize register  3
    -- 0110000000000011

    -- initialize register  4
    -- CONTROL_WORD <= "1000000000000011";
    -- DATA_IP <= "00000100";
    -- wait for 10 ns;

    -- -- initialize register  5
    -- CONTROL_WORD <= "1010000000000011";
    -- DATA_IP <= "00000101";
    -- wait for 10 ns;

    -- -- initialize register  6
    -- CONTROL_WORD <= "1100000000000011";
    -- DATA_IP <= "00000110";
    -- wait for 10 ns;

    -- -- initialize register  7
    -- CONTROL_WORD <= "1110000000000011";
    -- DATA_IP <= "00000111";
    -- wait for 10 ns;

    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    stop(0);
  end process;

end architecture;