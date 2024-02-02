library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CONTROL is
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
end entity;

architecture behav of CONTROL is

  component INSTRUCTION_DECODER is
    port (
      INST : in std_logic_vector(15 downto 0);
      CONTROL_WORD : out std_logic_vector(19 downto 0)
    );
  end component;

  component INST_MEMORY is
    port (
      CLK : in std_logic;
      ADDR : in std_logic_vector(7 downto 0);
      DATA_OP : out std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ";
      test_DATA_IP : in std_logic_vector(15 downto 0);
      test_MW : in std_logic
    );
  end component;

  signal COUNTER : std_logic_vector(5 downto 0) := "000000";
  signal INSTR : std_logic_vector(15 downto 0);

  signal ADDR : std_logic_vector(7 downto 0);

begin

  mem : INST_MEMORY port map(CLK => CLK, ADDR => ADDR, DATA_OP => INSTR, test_DATA_IP => test_DATA_IP, test_MW => test_MW);
  inst : INSTRUCTION_DECODER port map(INST => INSTR, CONTROL_WORD => CONTROL_WORD);

  OPCODE <= INSTR(15 downto 9);

  with testing select
    ADDR <= test_DATA_ADDR when '1',
    "00" & COUNTER when others;
  process (CLK)
  begin
    if rising_edge(CLK) then
      if RESET = '1' then
        COUNTER <= "000000";
      else
        COUNTER <= COUNTER + 1;
      end if;
    end if;
  end process;
end architecture;