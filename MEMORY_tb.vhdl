library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity MEMORY_tb is
end entity;

architecture testbench of MEMORY_tb is
  -- Component declaration
  component MEMORY
    port (
      CLK : in std_logic;
      ADDR : in std_logic_vector(5 downto 0);
      DATA_IP : in std_logic_vector(15 downto 0);
      DATA_OP : out std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ";
      RW : in std_logic
    );
  end component;

  -- Signals for test bench
  signal CLK : std_logic;
  signal ADDR : std_logic_vector(5 downto 0);
  signal DATA_IP : std_logic_vector(15 downto 0);
  signal DATA_OP : std_logic_vector(15 downto 0);
  signal RW : std_logic;

begin
  -- Instantiate the design under test
  uut : MEMORY
  port map(
    CLK => CLK,
    ADDR => ADDR,
    DATA_IP => DATA_IP,
    DATA_OP => DATA_OP,
    RW => RW
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
    wait for 10 ns;

    ADDR <= "000000";
    DATA_IP <= "0000000000000000";
    RW <= '1';
    wait for 10 ns;

    ADDR <= "000001";
    DATA_IP <= "0000000000000001";
    RW <= '1';
    wait for 10 ns;

    ADDR <= "000010";
    DATA_IP <= "0000000000000010";
    RW <= '1';
    wait for 10 ns;

    ADDR <= "000011";
    DATA_IP <= "0000000000000011";
    RW <= '1';
    wait for 10 ns;

    ADDR <= "000000";
    RW <= '0';
    wait for 10 ns;

    ADDR <= "000001";
    RW <= '0';
    wait for 10 ns;

    ADDR <= "000010";
    RW <= '0';
    wait for 10 ns;

    stop(0);
  end process;

end architecture;