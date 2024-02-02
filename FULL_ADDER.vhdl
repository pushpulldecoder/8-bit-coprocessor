library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FULL_ADDER is
  port (
    IP_0, IP_1 : in std_logic;
    C_IN : in std_logic;
    OP : out std_logic;
    C_OUT : out std_logic
  );
end FULL_ADDER;

architecture dataflow of FULL_ADDER is
begin
  OP <= IP_0 xor IP_1 xor C_IN;
  C_OUT <= (IP_0 and IP_1) or (IP_1 and C_IN) or (C_IN and IP_0);
end architecture dataflow;