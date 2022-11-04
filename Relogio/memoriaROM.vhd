library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoriaROM is
   generic (
          dataWidth: natural := 13;
          addrWidth: natural := 9
    );
   port (
          Endereco : in std_logic_vector (addrWidth-1 DOWNTO 0);
          Dado : out std_logic_vector (dataWidth-1 DOWNTO 0)
    );
end entity;

architecture assincrona of memoriaROM is

  type blocoMemoria is array(0 TO 2**addrWidth - 1) of std_logic_vector(dataWidth-1 DOWNTO 0);
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

  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
  begin
			
-- Setup 
tmp(0) := "0100" & "111" & "000000000";	-- LDI $0, R7
tmp(1) := "0101" & "111" & "100100000";	-- STA @HEX0, R7 	#Limpando os 7 segmentos
tmp(2) := "0101" & "111" & "100100001";	-- STA @HEX1, R7
tmp(3) := "0101" & "111" & "100100010";	-- STA @HEX2, R7
tmp(4) := "0101" & "111" & "100100011";	-- STA @HEX3, R7
tmp(5) := "0101" & "111" & "100100100";	-- STA @HEX4, R7
tmp(6) := "0101" & "111" & "100100101";	-- STA @HEX5, R7
tmp(7) := "0101" & "111" & "100000000";	-- STA @LEDR7, R7 	#Limpando os leds
tmp(8) := "0101" & "111" & "100000001";	-- STA @LEDR8, R7
tmp(9) := "0101" & "111" & "100000010";	-- STA @LEDR9, R7
tmp(10) := "0101" & "111" & "000000000";	-- STA @SUNI, R7 	#Limpando os 7 segmentos
tmp(11) := "0101" & "111" & "000000001";	-- STA @SDEC, R7
tmp(12) := "0101" & "111" & "000000010";	-- STA @MUNI, R7
tmp(13) := "0101" & "111" & "000000011";	-- STA @MDEC, R7
tmp(14) := "0101" & "111" & "000000100";	-- STA @HUNI, R7
tmp(15) := "0101" & "111" & "000000101";	-- STA @HDEC, R7
tmp(16) := "0101" & "111" & "111111111";	-- STA @CLR0, R7 	#Limpar KEY0
tmp(17) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(18) := "0101" & "111" & "111111101";	-- STA @CLR2, R7 	#Limpar KEY2
tmp(19) := "0101" & "111" & "111111100";	-- STA @CLR3, R7 	#Limpar KEY3
tmp(20) := "0101" & "111" & "111111011";	-- STA @CLRR, R7 	#Limpar FPGA_RESET
tmp(21) := "0100" & "000" & "000000001";	-- LDI $1, R0
tmp(22) := "0101" & "000" & "000000111";	-- STA @VAR1, R0 	#Inicializando constante com 1
tmp(23) := "0100" & "000" & "000001010";	-- LDI $10, R0
tmp(24) := "0101" & "000" & "000001000";	-- STA @VAR10, R0 	#Inicializando constante com 10
tmp(25) := "0100" & "000" & "000000110";	-- LDI $6, R0
tmp(26) := "0101" & "000" & "000001001";	-- STA @VAR6, R0 	#Inicializando constante com 6
tmp(27) := "0100" & "000" & "000000011";	-- LDI $3, R0
tmp(28) := "0101" & "000" & "000001010";	-- STA @VAR3, R0 	#Inicializando constante com 2
tmp(29) := "0100" & "000" & "000000101";	-- LDI $5, R0
tmp(30) := "0101" & "000" & "000001011";	-- STA @VAR5, R0 	#Inicializando constante com 5
tmp(31) := "0100" & "000" & "000001001";	-- LDI $9, R0
tmp(32) := "0101" & "000" & "000001100";	-- STA @VAR9, R0 	#Inicializando constante com 9
tmp(33) := "0100" & "000" & "000000100";	-- LDI $4, R0
tmp(34) := "0101" & "000" & "000001101";	-- STA @VAR4, R0 	#Inicializando constante com 4
tmp(35) := "0100" & "000" & "000000010";	-- LDI $2, R0
tmp(36) := "0101" & "000" & "000001110";	-- STA @VAR2, R0 	#Inicializando constante com 2

-- Loop 
tmp(37) := "0001" & "000" & "101100000";	-- LDA @KEY0, R0 	#Ler KEY0
tmp(38) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(39) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Comparar com 1
tmp(40) := "0111" & "000" & "000111011";	-- JEQ @HubIncremento 	#Pular pra subrotina de incremento

-- PosIncremento 
tmp(41) := "0001" & "000" & "101100001";	-- LDA @KEY1, R0 	#Ler KEY1
tmp(42) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(43) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Comparar com 1
tmp(44) := "0111" & "000" & "000111101";	-- JEQ @HubLimite 	#Pular pra subrotina de limite

-- PosLimite 
tmp(45) := "1001" & "000" & "011011111";	-- JSR @Verificar 	#Pular pra subrotina de verificar limite
tmp(46) := "0001" & "000" & "000000000";	-- LDA @SUNI, R0 	#Carrega acumulador com valor da unidade dos segundos
tmp(47) := "0101" & "000" & "100100000";	-- STA @HEX0, R0 	#Carrega unidade no HEX0
tmp(48) := "0001" & "000" & "000000001";	-- LDA @SDEC, R0 	#Carrega acumulador com valor da dezena dos segundos
tmp(49) := "0101" & "000" & "100100001";	-- STA @HEX1, R0 	#Carrega unidade no HEX1
tmp(50) := "0001" & "000" & "000000010";	-- LDA @MUNI, R0 	#Carrega acumulador com valor da unidade dos minutos
tmp(51) := "0101" & "000" & "100100010";	-- STA @HEX2, R0 	#Carrega unidade no HEX2
tmp(52) := "0001" & "000" & "000000011";	-- LDA @MDEC, R0 	#Carrega acumulador com valor da dezena dos minutos
tmp(53) := "0101" & "000" & "100100011";	-- STA @HEX3, R0 	#Carrega unidade no HEX3
tmp(54) := "0001" & "000" & "000000100";	-- LDA @HUNI, R0 	#Carrega acumulador com valor da unidade da hora
tmp(55) := "0101" & "000" & "100100100";	-- STA @HEX4, R0 	#Carrega unidade no HEX4
tmp(56) := "0001" & "000" & "000000101";	-- LDA @HDEC, R0 	#Carrega acumulador com valor da dezena da hora
tmp(57) := "0101" & "000" & "100100101";	-- STA @HEX5, R0 	#Carrega unidade no HEX5
tmp(58) := "0110" & "000" & "000100101";	-- JMP @Loop 	#Reiniciar Loop

-- HubIncremento 
tmp(59) := "1001" & "000" & "000111111";	-- JSR @Incremento 	#Para usar RET
tmp(60) := "0110" & "000" & "000101001";	-- JMP @PosIncremento 	#Voltar pro loop

-- HubLimite 
tmp(61) := "1001" & "000" & "001100110";	-- JSR @Limite 	#Para usar RET
tmp(62) := "0110" & "000" & "000101101";	-- JMP @PosLimite 	#Voltar pro loop

-- Incremento 
tmp(63) := "0101" & "111" & "111111111";	-- STA @CLR0, R7
tmp(64) := "0001" & "000" & "000000000";	-- LDA @SUNI, R0 	#Carrega R0 com unidade dos segundos
tmp(65) := "1110" & "000" & "000000001";	-- ADDI $1, R0 	#Soma 1 com R0
tmp(66) := "1000" & "000" & "000001000";	-- CEQ @VAR10, R0 	#Compara com 10
tmp(67) := "0111" & "000" & "001000110";	-- JEQ @SDezena 	#Caso 10, pular pra dezena dos segundos
tmp(68) := "0101" & "000" & "000000000";	-- STA @SUNI, R0 	#Caso contrario, salvar na unidade dos segundos
tmp(69) := "1010" & "000" & "000000000";	-- RET 	#Retornar

-- SDezena 
tmp(70) := "0101" & "111" & "000000000";	-- STA @SUNI, R7 	#Zera unidade dos segundos
tmp(71) := "0001" & "000" & "000000001";	-- LDA @SDEC, R0 	#Carrega dezena dos segundos no R0
tmp(72) := "1110" & "000" & "000000001";	-- ADDI $1, R0 	#Soma 1 com R0
tmp(73) := "1000" & "000" & "000001001";	-- CEQ @VAR6, R0 	#Compara com 6
tmp(74) := "0111" & "000" & "001001101";	-- JEQ @MUnidade 	#Caso 6, pular pra unidade dos minutos
tmp(75) := "0101" & "000" & "000000001";	-- STA @SDEC, R0 	#Caso contrario, salvar na dezena dos minutos
tmp(76) := "1010" & "000" & "000000000";	-- RET 	#Retornar

-- MUnidade 
tmp(77) := "0101" & "111" & "000000001";	-- STA @SDEC, R7 	#Zera dezena dos segundos
tmp(78) := "0001" & "000" & "000000010";	-- LDA @MUNI, R0 	#Carrega unidade dos minutos em R0
tmp(79) := "1110" & "000" & "000000001";	-- ADDI $1, R0 	#Soma 1 com R0
tmp(80) := "1000" & "000" & "000001000";	-- CEQ @VAR10, R0 	#Compara com 10
tmp(81) := "0111" & "000" & "001010100";	-- JEQ @MDezena 	#Caso 10, pular pra dezena dos minutos
tmp(82) := "0101" & "000" & "000000010";	-- STA @MUNI, R0 	#Caso contrario, salvar na centena
tmp(83) := "1010" & "000" & "000000000";	-- RET 	#Retornar

-- MDezena 
tmp(84) := "0101" & "111" & "000000010";	-- STA @MUNI, R7 	#Zera unidade dos minutos
tmp(85) := "0001" & "000" & "000000011";	-- LDA @MDEC, R0 	#Carrega dezena dos minutos em R0
tmp(86) := "1110" & "000" & "000000001";	-- ADDI $1, R0 	#Soma 1 com R0
tmp(87) := "1000" & "000" & "000001001";	-- CEQ @VAR6, R0 	#Compara com 6
tmp(88) := "0111" & "000" & "001011011";	-- JEQ @HUnidade 	#Caso 6, pular pra unidade da hora
tmp(89) := "0101" & "000" & "000000011";	-- STA @MDEC, R0 	#Caso contrario, salvar na dezena dos minutos
tmp(90) := "1010" & "000" & "000000000";	-- RET 	#Retornar

-- HUnidade 
tmp(91) := "0101" & "111" & "000000011";	-- STA @MDEC, R7 	#Zera dezena dos minutos
tmp(92) := "0001" & "000" & "000000100";	-- LDA @HUNI, R0 	#Carrega unidade da hora em R0
tmp(93) := "1110" & "000" & "000000001";	-- ADDI $1, R0 	#Soma 1 com R0
tmp(94) := "1000" & "000" & "000001000";	-- CEQ @VAR10, R0 	#Compara com 10
tmp(95) := "0111" & "000" & "001100010";	-- JEQ @HDezena 	#Caso 10, pular pra dezena da hora
tmp(96) := "0101" & "000" & "000000100";	-- STA @HUNI, R0 	#Caso contrario, salvar na unidade da hora
tmp(97) := "1010" & "000" & "000000000";	-- RET 	#Retornar

-- HDezena 
tmp(98) := "0101" & "111" & "000000100";	-- STA @HUNI, R7 	#Zera unidade da hora
tmp(99) := "0001" & "000" & "000000101";	-- LDA @HDEC, R0 	#Carrega dezena da hora em R0
tmp(100) := "1110" & "000" & "000000001";	-- ADDI $1, R0 	#Soma 1 com R0
tmp(101) := "1010" & "000" & "000000000";	-- RET 	#Retornar

-- Limite 
tmp(102) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(103) := "0100" & "000" & "000000001";	-- LDI $1, R0
tmp(104) := "0101" & "000" & "100000000";	-- STA @LEDR7, R0 	#Liga LEDR0 pra indicar aguardando leitura

-- LimiteSUni 
tmp(105) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(106) := "0001" & "001" & "101000000";	-- LDA @SW7, R1 	#Leitura do SW0-7
tmp(107) := "1011" & "001" & "000001111";	-- ANDI @15, R1 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
tmp(108) := "1100" & "001" & "000001000";	-- CGT @VAR10, R1 	#Verificar overflow do HEX
tmp(109) := "1101" & "000" & "011010011";	-- JGT @LimiteSUniMax 

-- PosLimiteSUni 
tmp(110) := "0101" & "001" & "000000000";	-- STA @SUNI, R1 	#Guarda na memoria valor da unidade do segundo
tmp(111) := "0101" & "001" & "100100000";	-- STA @HEX0, R1 	#Carrega leitura do SW0-7 no HEX0
tmp(112) := "0001" & "000" & "101100001";	-- LDA @KEY1, R0 	#Ler KEY1
tmp(113) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(114) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Ve se KEY1 está apertado
tmp(115) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(116) := "0111" & "000" & "001110110";	-- JEQ @PosLSU 	#Se tiver, guarda e vai embora
tmp(117) := "0110" & "000" & "001101001";	-- JMP @LimiteSUni 	#Caso contrario, faz de novo

-- PosLSU 
tmp(118) := "0100" & "000" & "000000010";	-- LDI $2, R0
tmp(119) := "0101" & "000" & "100000000";	-- STA @LEDR7, R0 	#Liga LEDR1 pra indicar aguardando leitura

-- LimiteSDec 
tmp(120) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(121) := "0001" & "001" & "101000000";	-- LDA @SW7, R1 	#Leitura do SW0-7
tmp(122) := "1011" & "001" & "000000101";	-- ANDI @5, R1 	#Aplicar mascara a leitura do botao para só pegar SW(2 downto 0)
tmp(123) := "1100" & "001" & "000001001";	-- CGT @VAR6, R1 	#Verificar overflow do HEX
tmp(124) := "1101" & "000" & "011010101";	-- JGT @LimiteSDecMax 

-- PosLimiteSDec 
tmp(125) := "0101" & "001" & "000000001";	-- STA @SDEC, R1 	#Guarda na memoria valor da dezena do segundo
tmp(126) := "0101" & "001" & "100100001";	-- STA @HEX1, R1 	#Carrega leitura do SW0-7 no HEX1
tmp(127) := "0001" & "000" & "101100001";	-- LDA @KEY1, R0 	#Ler KEY1
tmp(128) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(129) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Ve se KEY1 está apertado
tmp(130) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(131) := "0111" & "000" & "010000101";	-- JEQ @PosLSD 	#Se tiver, guarda e vai embora
tmp(132) := "0110" & "000" & "001111000";	-- JMP @LimiteSDec 	#Caso contrario, faz de novo

-- PosLSD 
tmp(133) := "0100" & "000" & "000000100";	-- LDI $4, R0
tmp(134) := "0101" & "000" & "100000000";	-- STA @LEDR7, R0 	#Liga LEDR2 pra indicar aguardando leitura

-- LimiteMUni 
tmp(135) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(136) := "0001" & "001" & "101000000";	-- LDA @SW7, R1 	#Leitura do SW0-7
tmp(137) := "1011" & "001" & "000001111";	-- ANDI @15, R1 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
tmp(138) := "1100" & "001" & "000001000";	-- CGT @VAR10, R1 	#Verificar overflow do HEX
tmp(139) := "1101" & "000" & "011010111";	-- JGT @LimiteMUniMax 

-- PosLimiteMUni 
tmp(140) := "0101" & "001" & "000000010";	-- STA @MUNI, R1 	#Guarda na memoria valor da unidade dos minutos
tmp(141) := "0101" & "001" & "100100010";	-- STA @HEX2, R1 	#Carrega leitura do SW0-7 no HEX2
tmp(142) := "0001" & "000" & "101100001";	-- LDA @KEY1, R0 	#Ler KEY1
tmp(143) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(144) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Ve se KEY1 está apertado
tmp(145) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(146) := "0111" & "000" & "010010100";	-- JEQ @PosLMU 	#Se tiver, guarda e vai embora
tmp(147) := "0110" & "000" & "010000111";	-- JMP @LimiteMUni 	#Caso contrario, faz de novo

-- PosLMU 
tmp(148) := "0100" & "000" & "000001000";	-- LDI $8, R0
tmp(149) := "0101" & "000" & "100000000";	-- STA @LEDR7, R0 	#Liga LEDR3 pra indicar aguardando leitura

-- LimiteMDec 
tmp(150) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(151) := "0001" & "001" & "101000000";	-- LDA @SW7, R1 	#Leitura do SW0-7
tmp(152) := "1011" & "001" & "000000101";	-- ANDI @5, R1 	#Aplicar mascara a leitura do botao para só pegar SW(2 downto 0)
tmp(153) := "1100" & "001" & "000001001";	-- CGT @VAR6, R1 	#Verificar overflow do HEX
tmp(154) := "1101" & "000" & "011011001";	-- JGT @LimiteMDecMax 

-- PosLimiteMDec 
tmp(155) := "0101" & "001" & "000000011";	-- STA @MDEC, R1 	#Guarda na memoria valor da dezena dos minutos
tmp(156) := "0101" & "001" & "100100011";	-- STA @HEX3, R1 	#Carrega leitura do SW0-7 no HEX3
tmp(157) := "0001" & "000" & "101100001";	-- LDA @KEY1, R0 	#Ler KEY1
tmp(158) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(159) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Ve se KEY1 está apertado
tmp(160) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(161) := "0111" & "000" & "010100011";	-- JEQ @PosLMD 	#Se tiver, guarda e vai embora
tmp(162) := "0110" & "000" & "010010110";	-- JMP @LimiteMDec 	#Caso contrario, faz de novo

-- PosLMD 
tmp(163) := "0100" & "000" & "000010000";	-- LDI $16, R0
tmp(164) := "0101" & "000" & "100000000";	-- STA @LEDR7, R0 	#Liga LEDR4 pra indicar aguardando leitura

-- LimiteHUni 
tmp(165) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(166) := "0001" & "001" & "101000000";	-- LDA @SW7, R1 	#Leitura do SW0-7
tmp(167) := "1011" & "001" & "000001111";	-- ANDI @15, R1 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
tmp(168) := "1100" & "001" & "000001000";	-- CGT @VAR10, R1 	#Verificar overflow do HEX
tmp(169) := "1101" & "000" & "011011011";	-- JGT @LimiteHUniMax 

-- PosLimiteHUni 
tmp(170) := "0101" & "001" & "000000100";	-- STA @HUNI, R1 	#Guarda na memoria valor da unidade da hora
tmp(171) := "0101" & "001" & "100100100";	-- STA @HEX4, R1 	#Carrega leitura do SW0-7 no HEX4
tmp(172) := "0001" & "000" & "101100001";	-- LDA @KEY1, R0 	#Ler KEY1
tmp(173) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(174) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Ve se KEY1 está apertado
tmp(175) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(176) := "0111" & "000" & "010110010";	-- JEQ @PosLHU 	#Se tiver, guarda e vai embora
tmp(177) := "0110" & "000" & "010100101";	-- JMP @LimiteHUni 	#Caso contrario, faz de novo

-- PosLHU 
tmp(178) := "0100" & "000" & "000100000";	-- LDI $32, R0
tmp(179) := "0101" & "000" & "100000000";	-- STA @LEDR7, R0 	#Liga LEDR5 pra indicar aguardando leitura
tmp(180) := "0101" & "010" & "000000100";	-- STA @HUNI, R2 	#Verificar unidade da hora -> se for maior que 4, nao pode colocar 2 na hora
tmp(181) := "1100" & "010" & "000001011";	-- CGT @VAR5, R2 	#Verificar overflow do HEX
tmp(182) := "1101" & "000" & "011000110";	-- JGT @LimiteHDecRestringe 

-- LimiteHDec 
tmp(183) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(184) := "0001" & "001" & "101000000";	-- LDA @SW7, R1 	#Leitura do SW0-7
tmp(185) := "1011" & "001" & "000000010";	-- ANDI @2, R1 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
tmp(186) := "1100" & "001" & "000001010";	-- CGT @VAR3, R1 	#Verificar overflow do HEX
tmp(187) := "1101" & "000" & "011011101";	-- JGT @LimiteHDecMax 

-- PosLimiteHDec 
tmp(188) := "0101" & "001" & "000000101";	-- STA @HDEC, R1 	#Guarda na memoria valor da unidade da hora
tmp(189) := "0101" & "001" & "100100101";	-- STA @HEX5, R1 	#Carrega leitura do SW0-7 no HEX4
tmp(190) := "0001" & "000" & "101100001";	-- LDA @KEY1, R0 	#Ler KEY1
tmp(191) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(192) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Ve se KEY1 está apertado
tmp(193) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(194) := "0111" & "000" & "011000100";	-- JEQ @PosLHD 	#Se tiver, guarda e vai embora
tmp(195) := "0110" & "000" & "010110111";	-- JMP @LimiteHDec 	#Caso contrario, faz de novo

-- PosLHD 
tmp(196) := "0101" & "111" & "100000000";	-- STA @LEDR7, R7 	#Desliga LEDR0-7
tmp(197) := "1010" & "000" & "000000000";	-- RET

-- LimiteHDecRestringe 
tmp(198) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(199) := "0001" & "001" & "101000000";	-- LDA @SW7, R1 	#Leitura do SW0-7
tmp(200) := "1011" & "001" & "000000001";	-- ANDI @1, R1 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
tmp(201) := "0101" & "001" & "000000101";	-- STA @HDEC, R1 	#Guarda na memoria valor da unidade da hora
tmp(202) := "0101" & "001" & "100100101";	-- STA @HEX5, R1 	#Carrega leitura do SW0-7 no HEX4
tmp(203) := "0001" & "000" & "101100001";	-- LDA @KEY1, R0 	#Ler KEY1
tmp(204) := "1011" & "000" & "000000001";	-- ANDI @1, R0 	#Aplicar máscara a leitura da KEY
tmp(205) := "1000" & "000" & "000000111";	-- CEQ @VAR1, R0 	#Ve se KEY1 está apertado
tmp(206) := "0101" & "111" & "111111110";	-- STA @CLR1, R7 	#Limpar KEY1
tmp(207) := "0111" & "000" & "011010001";	-- JEQ @PosLHDR 	#Se tiver, guarda e vai embora
tmp(208) := "0110" & "000" & "011000110";	-- JMP @LimiteHDecRestringe 	#Caso contrario, faz de novo

-- PosLHDR 
tmp(209) := "0101" & "111" & "100000000";	-- STA @LEDR7, R7 	#Desliga LEDR0-7
tmp(210) := "1010" & "000" & "000000000";	-- RET

-- LimiteSUniMax 
tmp(211) := "0100" & "001" & "000001001";	-- LDI $9, R1 	#Carrega 9 no R1
tmp(212) := "0110" & "000" & "001101110";	-- JMP @PosLimiteSUni 	#Volta

-- LimiteSDecMax 
tmp(213) := "0100" & "001" & "000000101";	-- LDI $5, R1 	#Carrega 5 no R1
tmp(214) := "0110" & "000" & "001111101";	-- JMP @PosLimiteSDec 	#Volta

-- LimiteMUniMax 
tmp(215) := "0100" & "001" & "000001001";	-- LDI $9, R1 	#Carrega 9 no R1
tmp(216) := "0110" & "000" & "010001100";	-- JMP @PosLimiteMUni 	#Volta

-- LimiteMDecMax 
tmp(217) := "0100" & "001" & "000000101";	-- LDI $5, R1 	#Carrega 5 no R1
tmp(218) := "0110" & "000" & "010011011";	-- JMP @PosLimiteMDec 	#Volta

-- LimiteHUniMax 
tmp(219) := "0100" & "001" & "000001001";	-- LDI $9, R1 	#Carrega 9 no R1
tmp(220) := "0110" & "000" & "010101010";	-- JMP @PosLimiteHUni 	#Volta

-- LimiteHDecMax 
tmp(221) := "0100" & "001" & "000000010";	-- LDI $2, R1 	#Carrega 2 no R1
tmp(222) := "0110" & "000" & "010111100";	-- JMP @PosLimiteHDec 	#Volta

-- Verificar 
tmp(223) := "0001" & "011" & "000000000";	-- LDA @SUNI, R3 	#Carrega valor da unidade dos segundos
tmp(224) := "1000" & "011" & "000001100";	-- CEQ @VAR9, R3 	#Compara unidade com o limite
tmp(225) := "0111" & "000" & "011100011";	-- JEQ @VerificarSDec 	#Se estiver no limite, checar dezena
tmp(226) := "1010" & "000" & "000000000";	-- RET

-- VerificarSDec 
tmp(227) := "0001" & "011" & "000000001";	-- LDA @SDEC, R3 	#Carrega valor da dezena
tmp(228) := "1000" & "011" & "000001011";	-- CEQ @VAR5, R3 	#Compara dezena com o limite
tmp(229) := "0111" & "000" & "011100111";	-- JEQ @VerificarMUni 	#Se estiver no limite, checar centena
tmp(230) := "1010" & "000" & "000000000";	-- RET

-- VerificarMUni 
tmp(231) := "0001" & "011" & "000000010";	-- LDA @MUNI, R3 	#Carrega valor da centena
tmp(232) := "1000" & "011" & "000001100";	-- CEQ @VAR9, R3 	#Compara centena com o limite
tmp(233) := "0111" & "000" & "011101011";	-- JEQ @VerificarMDec 	#Se estiver no limite, checar unidade de milhar
tmp(234) := "1010" & "000" & "000000000";	-- RET

-- VerificarMDec 
tmp(235) := "0001" & "011" & "000000011";	-- LDA @MDEC, R3 	#Carrega valor da unidade de milhar
tmp(236) := "1000" & "011" & "000001011";	-- CEQ @VAR5, R3 	#Compara unidade de milhar com o limite
tmp(237) := "0111" & "000" & "011101111";	-- JEQ @VerificarHUni 	#Se estiver no limite, checar dezena de milhar
tmp(238) := "1010" & "000" & "000000000";	-- RET

-- VerificarHUni 
tmp(239) := "0001" & "011" & "000000100";	-- LDA @HUNI, R3 	#Carrega valor da dezena de milhar
tmp(240) := "1000" & "011" & "000001101";	-- CEQ @VAR4, R3 	#Compara dezena de milhar com o limite
tmp(241) := "0111" & "000" & "011110011";	-- JEQ @VerificarHDec 	#Se estiver no limite, checar centena de milhar
tmp(242) := "1010" & "000" & "000000000";	-- RET

-- VerificarHDec 
tmp(243) := "0001" & "011" & "000000101";	-- LDA @HDEC, R3 	#Carrega valor da centena de milhar
tmp(244) := "1000" & "011" & "000001110";	-- CEQ @VAR2, R3 	#Compara centena de milhar com o limite
tmp(245) := "0111" & "000" & "011110111";	-- JEQ @LimiteAtingido 	#Se estiver no limite, pular pra SR de limite atingido
tmp(246) := "1010" & "000" & "000000000";	-- RET

-- LimiteAtingido 
tmp(247) := "0101" & "111" & "000000000";	-- STA @SUNI, R7 	#Limpando os 7 segmentos
tmp(248) := "0101" & "111" & "000000001";	-- STA @SDEC, R7
tmp(249) := "0101" & "111" & "000000010";	-- STA @MUNI, R7
tmp(250) := "0101" & "111" & "000000011";	-- STA @MDEC, R7
tmp(251) := "0101" & "111" & "000000100";	-- STA @HUNI, R7
tmp(252) := "0101" & "111" & "000000101";	-- STA @HDEC, R7

-- Retorno 
tmp(253) := "1010" & "000" & "000000000";	-- RET


        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;