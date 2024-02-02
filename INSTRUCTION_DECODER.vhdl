library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity INSTRUCTION_DECODER is
  port (
    INST : in std_logic_vector(15 downto 0);
    CONTROL_WORD : out std_logic_vector(19 downto 0)
  );
end entity;

architecture structure of INSTRUCTION_DECODER is
begin
  CONTROL_WORD(19 downto 17) <= INST(8 downto 6);
  CONTROL_WORD(16 downto 14) <= INST(5 downto 3);
  CONTROL_WORD(13 downto 11) <= INST(2 downto 0);
  CONTROL_WORD(10) <= INST(15);
  CONTROL_WORD(9 downto 6) <= INST(12) & INST(11) & INST(10) & INST(9) and not CONTROL_WORD(2);
  CONTROL_WORD(5) <= INST(13);
  CONTROL_WORD(4) <= not INST(14);
  CONTROL_WORD(3) <= INST(14) and not INST(15);
  CONTROL_WORD(2) <= INST(14) and INST(15);
  CONTROL_WORD(1) <= INST(13);
  CONTROL_WORD(0) <= INST(9);
end architecture;