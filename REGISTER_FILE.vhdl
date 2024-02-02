library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity REGISTER_FILE is
  port (
    CLK : std_logic;
    DATA : in std_logic_vector(7 downto 0);
    RW : in std_logic;
    DA : in std_logic_vector(2 downto 0);
    AA : in std_logic_vector(2 downto 0);
    BA : in std_logic_vector(2 downto 0);
    A, B : out std_logic_vector(7 downto 0)
  );
end REGISTER_FILE;

architecture structure of REGISTER_FILE is

  signal REG_0 : std_logic_vector(7 downto 0) := "00000000";
  signal REG_1 : std_logic_vector(7 downto 0) := "00000001";
  signal REG_2 : std_logic_vector(7 downto 0) := "00000010";
  signal REG_3 : std_logic_vector(7 downto 0) := "00000011";
  signal REG_4 : std_logic_vector(7 downto 0) := "00000100";
  signal REG_5 : std_logic_vector(7 downto 0) := "00000101";
  signal REG_6 : std_logic_vector(7 downto 0) := "00000110";
  signal REG_7 : std_logic_vector(7 downto 0) := "00000111";

begin

  with DA & RW select
  REG_0 <= DATA AFTER 10 ns when "0001",
    REG_0 when others;
  with DA & RW select
  REG_1 <= DATA AFTER 10 ns when "0011",
    REG_1 when others;
  with DA & RW select
  REG_2 <= DATA AFTER 10 ns when "0101",
    REG_2 when others;
  with DA & RW select
  REG_3 <= DATA AFTER 10 ns when "0111",
    REG_3 when others;
  with DA & RW select
  REG_4 <= DATA AFTER 10 ns when "1001",
    REG_4 when others;
  with DA & RW select
  REG_5 <= DATA AFTER 10 ns when "1011",
    REG_5 when others;
  with DA & RW select
  REG_6 <= DATA AFTER 10 ns when "1101",
    REG_6 when others;
  with DA & RW select
  REG_7 <= DATA AFTER 10 ns when "1111",
    REG_7 when others;

  process (CLK)
  begin
    if rising_edge(CLK) then
      case AA is
        when "000" =>
          A <= REG_0;
        when "001" =>
          A <= REG_1;
        when "010" =>
          A <= REG_2;
        when "011" =>
          A <= REG_3;
        when "100" =>
          A <= REG_4;
        when "101" =>
          A <= REG_5;
        when "110" =>
          A <= REG_6;
        when "111" =>
          A <= REG_7;
        when others =>
          null;
      end case;

      case BA is
        when "000" =>
          B <= REG_0;
        when "001" =>
          B <= REG_1;
        when "010" =>
          B <= REG_2;
        when "011" =>
          B <= REG_3;
        when "100" =>
          B <= REG_4;
        when "101" =>
          B <= REG_5;
        when "110" =>
          B <= REG_6;
        when "111" =>
          B <= REG_7;
        when others =>
          null;
      end case;
    end if;
  end process;

end architecture structure;