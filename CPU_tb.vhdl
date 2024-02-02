library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity CPU_tb is
end entity;

architecture testbench of CPU_tb is
  -- Component declaration
  component CPU
    port (
      CLK : in std_logic;
      GO : in std_logic;
      testing : in std_logic;
      test_DATA_ADDR : in std_logic_vector(7 downto 0);
      test_DATA_IP : in std_logic_vector(15 downto 0);
      test_DATA_OP : in std_logic_vector(15 downto 0);
      test_MW : in std_logic;
      PSEUDO_OUT : out std_logic_vector(15 downto 0)
    );
  end component;

  -- Signals for test bench
  signal CLK : std_logic;
  signal GO : std_logic;
  signal testing : std_logic;
  signal test_DATA_ADDR : std_logic_vector(7 downto 0);
  signal test_DATA_IP : std_logic_vector(15 downto 0);
  signal test_DATA_OP : std_logic_vector(15 downto 0);
  signal test_MW : std_logic;
  signal PSEUDO_OUT : std_logic_vector(15 downto 0);

begin
  -- Instantiate the design under test
  uut : CPU
  port map(
    CLK => CLK,
    GO => GO,
    testing => testing,
    test_DATA_ADDR => test_DATA_ADDR,
    test_DATA_IP => test_DATA_IP,
    test_DATA_OP => test_DATA_OP,
    test_MW => test_MW,
    PSEUDO_OUT => PSEUDO_OUT
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

    GO <= '0';
    testing <= '1';
    test_MW <= '1';

    -- test_DATA_ADDR <= "00000000";
    -- test_DATA_IP <= "0000000000000000";
    -- wait for 10 ns;

    -- test_DATA_ADDR <= "00000001";
    -- test_DATA_IP <= "0000000000000001";
    -- wait for 10 ns;

    -- test_DATA_ADDR <= "00000010";
    -- test_DATA_IP <= "0000000000000010";
    -- wait for 10 ns;

    -- test_DATA_ADDR <= "00000011";
    -- test_DATA_IP <= "0000000000000011";
    -- wait for 10 ns;

    
    -- test_DATA_ADDR <= "00000000";
    -- test_DATA_IP <= "0010100110010101";
    -- wait for 10 ns;
    
    -- test_DATA_ADDR <= "00000001";
    -- test_DATA_IP <= "100XXX1100111001";
    -- wait for 10 ns;
    
    -- test_DATA_ADDR <= "00000010";
    -- test_DATA_IP <= "111111XXX0000101";
    -- wait for 10 ns;
    
    -- test_DATA_ADDR <= "00000011";
    -- test_DATA_IP <= "001000XXX1001001";
    -- wait for 10 ns;
    
    -- test_DATA_ADDR <= "00000100";
    -- test_DATA_IP <= "XXXXXX0110XXXXX0";
    -- wait for 10 ns;
    
    -- test_DATA_ADDR <= "00000101";
    -- test_DATA_IP <= "100XXXXXXXXXXX11";
    -- wait for 10 ns;
    
    -- test_DATA_ADDR <= "00000110";
    -- test_DATA_IP <= "1010000000101001";
    -- wait for 10 ns;

    GO <= '1';
    testing <= '0';
    test_MW <= '0';
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
    wait for 10 ns;
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
    stop(0);
  end process;

end architecture;



-- 001 010 011 0 0101 0 1
-- 100 XXX 110 0 1110 0 1
-- 111 111 XXX 0 0001 0 1
-- 001 000 XXX 1 0010 0 1
-- XXX XXX 011 0 XXXX X 0
-- 100 XXX XXX X XXXX 1 1
-- 101 000 000 0 1010 0 1

-- 0010100110010101
-- 100XXX1100111001
-- 111111XXX0000101
-- 001000XXX1001001
-- XXXXXX0110XXXXX0
-- 100XXXXXXXXXXX11
-- 1010000000101001



-- 0010100110010101  2995
-- 1000001100111001  8339
-- 1111110000000101  FC05
-- 0010000001001001  2049
-- 0000000110000000  0180
-- 1000000000000011  8003
-- 1010000000101001  A029


-- 