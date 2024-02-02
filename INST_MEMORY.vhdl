library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity INST_MEMORY is
  port (
    CLK : in std_logic;
    ADDR : in std_logic_vector(7 downto 0);
    DATA_OP : out std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ";
    test_DATA_IP : in std_logic_vector(15 downto 0);
    test_MW : in std_logic
  );
end INST_MEMORY;

architecture behav of INST_MEMORY is
  subtype WORD is std_logic_vector (15 downto 0); --memory is 8 bit wide
  type MEMORY is array (0 to 255) of word; --depth of memory is 256
  signal RAM : MEMORY;-- := others => "00000000";
begin
  process (CLK)
  begin
    if rising_edge(CLK) then
      -- write
      if test_MW = '1' then
        RAM(to_integer(unsigned(ADDR))) <= test_DATA_IP;
        DATA_OP <= "ZZZZZZZZZZZZZZZZ";
      else
        -- read    
        DATA_OP <= RAM(to_integer(unsigned(ADDR)));
      end if;
    end if;
  end process;
end behav;