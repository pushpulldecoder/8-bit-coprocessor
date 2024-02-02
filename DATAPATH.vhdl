library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DATAPATH is
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
end DATAPATH;

architecture structure of DATAPATH is
  component REGISTER_FILE is
    port (
      CLK : std_logic;
      DATA : in std_logic_vector(7 downto 0);
      RW : in std_logic;
      DA : in std_logic_vector(2 downto 0);
      AA : in std_logic_vector(2 downto 0);
      BA : in std_logic_vector(2 downto 0);
      A, B : out std_logic_vector(7 downto 0)
    );
  end component;

  component FUNCTION_UNIT is
    port (
      CLK : in std_logic;
      IP_0, IP_1 : in std_logic_vector(7 downto 0);
      F_SEL : in std_logic_vector(3 downto 0);
      OP : out std_logic_vector(7 downto 0);
      V, C, N, Z : out std_logic
    );
  end component;

  -- signal REG_0 : std_logic_vector(7 downto 0) := "11111111";
  -- signal REG_1 : std_logic_vector(7 downto 0) := "11111111";
  -- signal REG_2 : std_logic_vector(7 downto 0) := "11111111";
  -- signal REG_3 : std_logic_vector(7 downto 0) := "11111111";
  -- signal REG_4 : std_logic_vector(7 downto 0) := "11111111";
  -- signal REG_5 : std_logic_vector(7 downto 0) := "11111111";
  -- signal REG_6 : std_logic_vector(7 downto 0) := "11111111";
  -- signal REG_7 : std_logic_vector(7 downto 0) := "11111111";

  -- signal RW : std_logic;
  -- signal DA : std_logic_vector(2 downto 0);
  -- signal AA : std_logic_vector(2 downto 0);
  -- signal BA : std_logic_vector(2 downto 0);

  -- signal MD : std_logic;

  signal REG_IP : std_logic_vector(7 downto 0);
  signal REG_A, REG_B : std_logic_vector(7 downto 0);
  signal FUN_IP_B : std_logic_vector(7 downto 0);
  signal FUNC_OP : std_logic_vector(7 downto 0);

begin

  reg_comp : REGISTER_FILE port map(CLK => CLK, DATA => REG_IP, RW => RW, DA => DA, AA => AA, BA => BA, A => REG_A, B => REG_B);
  fun_comp : FUNCTION_UNIT port map(CLK => CLK, IP_0 => REG_A, IP_1 => FUN_IP_B, F_SEL => F_SEL, OP => FUNC_OP, V => V, N => N, C => C, Z => Z);

  with MB select
  FUN_IP_B <= REG_B when '0',
    CONST when others;

  with MD select
  REG_IP <= FUNC_OP when '0',
    DATA_IP when others;

  ADDR_OP <= REG_A;
  DATA_OP <= FUN_IP_B;

  -- process (CLK)
  -- begin
  --   if rising_edge(CLK) then
  --     if CONTROL_WORD(0) = '1' then
  --       case CONTROL_WORD(15 downto 13) is
  --         when "000" =>
  --           REG_0 <= FUNC_OP when CONTROL_WORD(1) = '0' else DATA_IP;
  --         when "001" =>
  --           REG_1 <= FUNC_OP when CONTROL_WORD(1) = '0' else DATA_IP;
  --         when "010" =>
  --           REG_2 <= FUNC_OP when CONTROL_WORD(1) = '0' else DATA_IP;
  --         when "011" =>
  --           REG_3 <= FUNC_OP when CONTROL_WORD(1) = '0' else DATA_IP;
  --         when "100" =>
  --           REG_4 <= FUNC_OP when CONTROL_WORD(1) = '0' else DATA_IP;
  --         when "101" =>
  --           REG_5 <= FUNC_OP when CONTROL_WORD(1) = '0' else DATA_IP;
  --         when "110" =>
  --           REG_6 <= FUNC_OP when CONTROL_WORD(1) = '0' else DATA_IP;
  --         when "111" =>
  --           REG_7 <= FUNC_OP when CONTROL_WORD(1) = '0' else DATA_IP;
  --         when others =>
  --           null;
  --       end case;
  --     end if;
  --   end if;
  -- end process;

  -- process (CLK)
  -- begin
  --   if rising_edge(CLK) then
  --     case CONTROL_WORD(12 downto 10) is
  --       when "000" =>
  --         REG_A <= REG_0;
  --       when "001" =>
  --         REG_A <= REG_1;
  --       when "010" =>
  --         REG_A <= REG_2;
  --       when "011" =>
  --         REG_A <= REG_3;
  --       when "100" =>
  --         REG_A <= REG_4;
  --       when "101" =>
  --         REG_A <= REG_5;
  --       when "110" =>
  --         REG_A <= REG_6;
  --       when "111" =>
  --         REG_A <= REG_7;
  --       when others =>
  --         null;
  --     end case;
  --   end if;
  -- end process;

  -- process (CLK)
  -- begin
  --   if rising_edge(CLK) then
  --     case CONTROL_WORD(9 downto 7) is
  --       when "000" =>
  --         REG_B <= REG_0;
  --       when "001" =>
  --         REG_B <= REG_1;
  --       when "010" =>
  --         REG_B <= REG_2;
  --       when "011" =>
  --         REG_B <= REG_3;
  --       when "100" =>
  --         REG_B <= REG_4;
  --       when "101" =>
  --         REG_B <= REG_5;
  --       when "110" =>
  --         REG_B <= REG_6;
  --       when "111" =>
  --         REG_B <= REG_7;
  --       when others =>
  --         null;
  --     end case;
  --   end if;
  -- end process;

  -- process (CLK)
  -- begin
  --   if rising_edge(CLK) then
  --     if CONTROL_WORD(6) = '0' then
  --       FUN_IP_B <= REG_B;
  --     else
  --       FUN_IP_B <= CONST;
  --     end if;
  --   end if;
  -- end process;

end architecture structure;