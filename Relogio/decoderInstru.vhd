library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( opcode : in std_logic_vector(3 downto 0);
         saida : out std_logic_vector(13 downto 0)
  );
end entity;

architecture comportamento of decoderInstru is

  constant NOP   : std_logic_vector(3 downto 0) := "0000";
  constant LDA   : std_logic_vector(3 downto 0) := "0001";
  constant SOMA  : std_logic_vector(3 downto 0) := "0010";
  constant SUB   : std_logic_vector(3 downto 0) := "0011";
  constant LDI   : std_logic_vector(3 downto 0) := "0100";
  constant STA   : std_logic_vector(3 downto 0) := "0101";
  constant JMP   : std_logic_vector(3 downto 0) := "0110";
  constant JEQ   : std_logic_vector(3 downto 0) := "0111";
  constant CEQ   : std_logic_vector(3 downto 0) := "1000";
  constant JSR   : std_logic_vector(3 downto 0) := "1001";
  constant RET   : std_logic_vector(3 downto 0) := "1010";
  constant ANDI  : std_logic_vector(3 downto 0) := "1011";
  constant CGT   : std_logic_vector(3 downto 0) := "1100";
  constant JGT   : std_logic_vector(3 downto 0) := "1101";
  constant ADDI  : std_logic_vector(3 downto 0) := "1110";
  constant SUBI  : std_logic_vector(3 downto 0) := "1111";
  
  
  alias habEscritaMEM : std_logic is saida(0);
  alias habLeituraMEM : std_logic is saida(1);
  alias habFlagIgual : std_logic is saida(2);
  alias operacao : std_logic_vector(1 downto 0) is saida(4 downto 3);
  alias habA : std_logic is saida(5);
  alias SelMUX : std_logic is saida(6);
  alias JEQ_c : std_logic is saida(7);
  alias JSR_c : std_logic is saida(8);
  alias RET_c : std_logic is saida(9);
  alias JMP_c : std_logic is saida(10);
  alias habEscritaRetorno : std_logic is saida(11);
  alias habFlagMaior : std_logic is saida(12);
  alias JGT_c : std_logic is saida(13);

  begin
  
  habEscritaMEM <= '1' when (opcode = STA) else '0';
  habLeituraMEM <= '1' when (opcode = LDA) or (opcode = SOMA) or (opcode = SUB) or (opcode = CEQ) or (opcode = CGT) or (opcode = ANDI) else '0';
  habFlagIgual <= '1' when (opcode = CEQ) else '0';
  operacao <= "01" when (opcode = SOMA) or (opcode = ADDI) else "00" when (opcode = SUB) or (opcode = SUBI) else "11" when (opcode = ANDI) else "10";
  habA <= '1' when (opcode = LDA) or (opcode = SOMA) or (opcode = SUB) or (opcode = LDI) or (opcode = ANDI) or (opcode = SUBI) or (opcode = ADDI) else '0';
  SelMUX <= '1' when (opcode = LDI) or (opcode = ANDI) or (opcode = ADDI) or (opcode = SUBI) else '0';
  JEQ_c <= '1' when (opcode = JEQ) else '0';
  JSR_c <= '1' when (opcode = JSR) else '0';
  RET_c <= '1' when (opcode = RET) else '0';
  JMP_c <= '1' when (opcode = JMP) else '0';
  habEscritaRetorno <= '1' when (opcode = JSR) else '0';
  habFlagMaior <= '1' when (opcode = CGT) else '0';
  JGT_c <= '1' when (opcode = JGT) else '0';

end architecture;