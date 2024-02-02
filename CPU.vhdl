library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CPU is
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
end entity;

architecture behav of CPU is

  component CONTROL is
    port (
      CLK : in std_logic;
      RESET : in std_logic;
      OPCODE : out std_logic_vector(6 downto 0);
      CONTROL_WORD : out std_logic_vector(19 downto 0);
      testing : in std_logic;
      test_DATA_ADDR : in std_logic_vector(7 downto 0);
      test_DATA_IP : in std_logic_vector(15 downto 0);
      test_MW : in std_logic
    );
  end component;

  component DATA_MEMORY is
    port (
      CLK : in std_logic;
      ADDR : in std_logic_vector(7 downto 0);
      DATA_IP : in std_logic_vector(7 downto 0);
      DATA_OP : out std_logic_vector(7 downto 0) := "ZZZZZZZZ";
      MW : in std_logic
    );
  end component;

  component DATAPATH is
    port (
      CLK : in std_logic;
      RW : std_logic;
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

  signal OPCODE : std_logic_vector(6 downto 0);
  signal CONTROL_WORD : std_logic_vector(19 downto 0);

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
  signal V : std_logic;
  signal N : std_logic;
  signal C : std_logic;
  signal Z : std_logic;

begin

  RW <= CONTROL_WORD(0);
  DA <= CONTROL_WORD(15 downto 13);
  AA <= CONTROL_WORD(12 downto 10);
  BA <= CONTROL_WORD(9 downto 7);
  F_SEL <= CONTROL_WORD(5 downto 2);
  MD <= CONTROL_WORD(1);
  MB <= CONTROL_WORD(6);
  CONST <= "0" & OPCODE;

  control_unit : CONTROL port map(
    CLK => CLK,
    RESET => '0',
    OPCODE => OPCODE,
    CONTROL_WORD => CONTROL_WORD,
    testing => testing,
    test_DATA_ADDR => test_DATA_ADDR,
    test_DATA_IP => test_DATA_IP,
    test_MW => test_MW
  );

  data_mem : DATA_MEMORY port map(
    CLK => CLK and GO,
    ADDR => ADDR_OP,
    DATA_IP => DATA_OP,
    DATA_OP => DATA_IP,
    MW => CONTROL_WORD(3)
  );

  datapath_unit : DATAPATH port map(
    CLK => CLK and GO,
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

end architecture;