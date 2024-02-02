library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity DATAPATH_tb is
end entity;

architecture testbench of DATAPATH_tb is
  -- Component declaration
  component DATAPATH
    port (
      CLK : in std_logic;
      RW : in std_logic;
      DA : in std_logic_vector(2 downto 0);
      AA : in std_logic_vector(2 downto 0);
      BA : in std_logic_vector(2 downto 0);
      F_SEL : in std_logic_vector(3 downto 0);
      MD : std_logic;
      MB : std_logic;
      CONST : in std_logic_vector(7 downto 0);
      DATA_IP : in std_logic_vector(7 downto 0);
      ADDR_OP : out std_logic_vector(7 downto 0);
      DATA_OP : out std_logic_vector(7 downto 0);
      V, N, C, Z : out std_logic
    );
  end component;

  -- Signals for test bench
  signal CLK : std_logic;

  signal RW : std_logic;
  signal DA : std_logic_vector(2 downto 0);
  signal AA : std_logic_vector(2 downto 0);
  signal BA : std_logic_vector(2 downto 0);
  signal F_SEL : std_logic_vector(3 downto 0);
  signal MD : std_logic;
  signal MB : std_logic;
  signal CONST : std_logic_vector(7 downto 0);
  signal DATA_IP : std_logic_vector(7 downto 0);
  signal ADDR_OP : std_logic_vector(7 downto 0);
  signal DATA_OP : std_logic_vector(7 downto 0);
  signal V, N, C, Z : std_logic;

begin
  -- Instantiate the design under test
  uut : DATAPATH
  port map(
    CLK => CLK,
    RW => RW,
    DA => DA,
    AA => AA,
    BA => BA,
    F_SEL => F_SEL,
    MD => MD,
    MB => MB,
    CONST => CONST,
    DATA_IP => DATA_IP,
    ADDR_OP => ADDR_OP,
    DATA_OP => DATA_OP,
    V => V,
    N => N,
    C => C,
    Z => Z
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

    -- -- initialize register  0
    -- RW <= '1';
    -- DA <= "000";
    -- DATA_IP <= "00000000";
    -- wait for 10 ns;

    -- -- initialize register  1
    -- RW <= '1';
    -- DA <= "001";
    -- DATA_IP <= "00000001";
    -- wait for 10 ns;

    -- -- initialize register  2
    -- RW <= '1';
    -- DA <= "010";
    -- DATA_IP <= "00000010";
    -- wait for 10 ns;

    -- -- initialize register  3
    -- RW <= '1';
    -- DA <= "011";
    -- DATA_IP <= "00000011";
    -- wait for 10 ns;

    -- -- initialize register  4
    -- RW <= '1';
    -- DA <= "100";
    -- DATA_IP <= "00000100";
    -- wait for 10 ns;

    -- -- initialize register  5
    -- RW <= '1';
    -- DA <= "101";
    -- DATA_IP <= "00000101";
    -- wait for 10 ns;

    -- -- initialize register  6
    -- RW <= '1';
    -- DA <= "110";
    -- DATA_IP <= "00000110";
    -- wait for 10 ns;

    -- -- initialize register  7
    -- RW <= '1';
    -- DA <= "111";
    -- DATA_IP <= "00000111";
    -- wait for 10 ns;

    wait for 10 ns;
    wait for 10 ns;
    -- op 1
    -- 001 010 011 0 0101 0 1
    DA <= "001";
    AA <= "010";
    BA <= "011";
    MB <= '0';
    F_SEL <= "0101";
    MD <= '0';
    RW <= '1';
    wait for 10 ns;

    -- op 2
    -- 100 000 110 0 1110 0 1
    DA <= "100";
    AA <= "000";
    BA <= "110";
    MB <= '0';
    F_SEL <= "1110";
    MD <= '0';
    RW <= '1';
    wait for 10 ns;

    -- op 3
    -- 111 111 000 0 0001 0 1
    DA <= "111";
    AA <= "111";
    BA <= "000";
    MB <= '0';
    F_SEL <= "0001";
    MD <= '0';
    RW <= '1';
    wait for 10 ns;

    -- op 4
    -- 001 000 000 1 0010 0 1
    DA <= "001";
    AA <= "000";
    BA <= "XXX";
    MB <= '1';
    F_SEL <= "0010";
    MD <= '0';
    RW <= '1';
    CONST <= "00000010";
    wait for 10 ns;

    -- op 5
    -- XXX XXX 011 0 XXXX X 0
    DA <= "XXX";
    AA <= "XXX";
    BA <= "011";
    MB <= '0';
    F_SEL <= "XXXX";
    MD <= 'X';
    RW <= '0';
    wait for 10 ns;

    -- op 6
    -- 100 XXX XXX X XXXX 1 1
    DA <= "100";
    AA <= "XXX";
    BA <= "XXX";
    MB <= 'X';
    F_SEL <= "XXXX";
    MD <= '1';
    RW <= '1';
    DATA_IP <= "00000010";
    wait for 10 ns;

    -- op 7
    -- 101 000 000 0 1010 0 1
    DA <= "101";
    AA <= "000";
    BA <= "000";
    MB <= '0';
    F_SEL <= "1010";
    MD <= '0';
    RW <= '1';
    wait for 10 ns;

    wait for 10 ns;

    stop(0);
  end process;

end architecture;



-- CONTROL_WORD <= "0000000000000011";
-- DATA_IP <= "00000000";
-- wait for 10 ns;

-- -- initialize register  1
-- CONTROL_WORD <= "0010000000000011";
-- DATA_IP <= "00000001";
-- wait for 10 ns;

-- -- initialize register  2
-- CONTROL_WORD <= "0100000000000011";
-- DATA_IP <= "00000010";
-- wait for 10 ns;

-- -- initialize register  3
-- CONTROL_WORD <= "0110000000000011";
-- DATA_IP <= "00000011";
-- wait for 10 ns;

-- -- initialize register  4
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
