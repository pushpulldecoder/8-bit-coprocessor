library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity REGISTER_FILE_tb is
end entity;

architecture testbench of REGISTER_FILE_tb is
  -- Component declaration
  component REGISTER_FILE
    port (
      DATA : in std_logic_vector(7 downto 0);
      RW : in std_logic;
      DA : in std_logic_vector(2 downto 0);
      AA : in std_logic_vector(2 downto 0);
      BA : in std_logic_vector(2 downto 0);
      A, B : out std_logic_vector(7 downto 0)
    );
  end component;

  -- Signals for test bench
  signal DATA : std_logic_vector(7 downto 0) := "00000000";
  signal RW : std_logic;
  signal DA : std_logic_vector(2 downto 0);
  signal AA : std_logic_vector(2 downto 0) := "000";
  signal BA : std_logic_vector(2 downto 0) := "000";
  signal A : std_logic_vector(7 downto 0);
  signal B : std_logic_vector(7 downto 0);

begin
  -- Instantiate the design under test
  uut : REGISTER_FILE
  port map(
    DATA => DATA,
    RW => RW,
    DA => DA,
    AA => AA,
    BA => BA,
    A => A,
    B => B
  );
  -- Stimulus process

  counter_process : process
  begin

    AA <= "111";
    BA <= "111";

    DATA <= "00000000";
    RW <= '1';
    DA <= "000";
    wait for 10 ns;

    DATA <= "00000001";
    RW <= '1';
    DA <= "001";
    wait for 10 ns;

    DATA <= "00000010";
    RW <= '1';
    DA <= "010";
    wait for 10 ns;

    DATA <= "00000011";
    RW <= '1';
    DA <= "011";
    wait for 10 ns;

    DATA <= "00000100";
    RW <= '1';
    DA <= "100";
    wait for 10 ns;

    DATA <= "00000101";
    RW <= '1';
    DA <= "101";
    wait for 10 ns;

    DATA <= "00000110";
    RW <= '1';
    DA <= "110";
    wait for 10 ns;

    DATA <= "00000111";
    RW <= '1';
    DA <= "111";
    wait for 10 ns;

    RW <= '0';
    AA <= "000";
    BA <= "000";
    wait for 10 ns;

    RW <= '0';
    AA <= "001";
    BA <= "001";
    wait for 10 ns;

    RW <= '0';
    AA <= "010";
    BA <= "010";
    wait for 10 ns;

    RW <= '0';
    AA <= "011";
    BA <= "011";
    wait for 10 ns;

    RW <= '0';
    AA <= "100";
    BA <= "100";
    wait for 10 ns;

    RW <= '0';
    AA <= "101";
    BA <= "101";
    wait for 10 ns;

    RW <= '0';
    AA <= "110";
    BA <= "110";
    wait for 10 ns;

    RW <= '0';
    AA <= "111";
    BA <= "111";
    wait for 10 ns;

    stop(0);
  end process;

end architecture;