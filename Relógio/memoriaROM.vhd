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
  constant NOP  : std_logic_vector(3 downto 0) := "0000";
  constant LDA  : std_logic_vector(3 downto 0) := "0001";
  constant SOMA : std_logic_vector(3 downto 0) := "0010";
  constant SUB  : std_logic_vector(3 downto 0) := "0011";
  constant LDI  : std_logic_vector(3 downto 0) := "0100";
  constant STA  : std_logic_vector(3 downto 0) := "0101";
  constant JMP  : std_logic_vector(3 downto 0) := "0110";
  constant JEQ  : std_logic_vector(3 downto 0) := "0111";
  constant CEQ  : std_logic_vector(3 downto 0) := "1000";
  constant JSR  : std_logic_vector(3 downto 0) := "1001";
  constant RET  : std_logic_vector(3 downto 0) := "1010";
  constant ANDI  : std_logic_vector(3 downto 0) := "1011";

  function initMemory
        return blocoMemoria is variable tmp : blocoMemoria := (others => (others => '0'));
  begin
			-- Setup
			tmp(0) := "0100" & '0' &  x"00";	-- LDI $0 	#Limpando os 7 segmentos
			tmp(1) := "0101" & '1' &  x"20";	-- STA @HEX0
			tmp(2) := "0101" & '1' &  x"21";	-- STA @HEX1
			tmp(3) := "0101" & '1' &  x"22";	-- STA @HEX2
			tmp(4) := "0101" & '1' &  x"23";	-- STA @HEX3
			tmp(5) := "0101" & '1' &  x"24";	-- STA @HEX4
			tmp(6) := "0101" & '1' &  x"25";	-- STA @HEX5
			tmp(7) := "0101" & '1' &  x"00";	-- STA @LEDR7 	#Limpando os leds
			tmp(8) := "0101" & '1' &  x"01";	-- STA @LEDR8
			tmp(9) := "0101" & '1' &  x"02";	-- STA @LEDR9
			tmp(10) := "0101" & '0' &  x"00";	-- STA @UNI 	#Inicializando variaveis com 0
			tmp(11) := "0101" & '0' &  x"01";	-- STA @DEC
			tmp(12) := "0101" & '0' &  x"02";	-- STA @CEN
			tmp(13) := "0101" & '0' &  x"03";	-- STA @MUNI
			tmp(14) := "0101" & '0' &  x"04";	-- STA @MDEC
			tmp(15) := "0101" & '0' &  x"05";	-- STA @MCEN
			tmp(16) := "0100" & '0' &  x"09";	-- LDI $9
			tmp(17) := "0101" & '0' &  x"0A";	-- STA @LIMU 	#Inicializando limites com 9
			tmp(18) := "0101" & '0' &  x"0B";	-- STA @LIMD
			tmp(19) := "0101" & '0' &  x"0C";	-- STA @LIMC
			tmp(20) := "0101" & '0' &  x"0D";	-- STA @LIMMU
			tmp(21) := "0101" & '0' &  x"0E";	-- STA @LIMMD
			tmp(22) := "0101" & '0' &  x"0F";	-- STA @LIMMC
			tmp(23) := "0100" & '0' &  x"00";	-- LDI $0
			tmp(24) := "0101" & '0' &  x"06";	-- STA @VAR0 	#Inicializando constante com 0
			tmp(25) := "0100" & '0' &  x"01";	-- LDI $1
			tmp(26) := "0101" & '0' &  x"07";	-- STA @VAR1 	#Inicializando constante com 1
			tmp(27) := "0100" & '0' &  x"0A";	-- LDI $10
			tmp(28) := "0101" & '0' &  x"08";	-- STA @VAR10 	#Inicializando constante com 10
			tmp(29) := "0100" & '0' &  x"0B";	-- LDI $11
			tmp(30) := "0101" & '0' &  x"10";	-- STA @VAR11 	#Inicializando constante com 11
			tmp(31) := "0100" & '0' &  x"0C";	-- LDI $12
			tmp(32) := "0101" & '0' &  x"11";	-- STA @VAR12 	#Inicializando constante com 12
			tmp(33) := "0100" & '0' &  x"0D";	-- LDI $13
			tmp(34) := "0101" & '0' &  x"12";	-- STA @VAR13 	#Inicializando constante com 13
			tmp(35) := "0100" & '0' &  x"0E";	-- LDI $14
			tmp(36) := "0101" & '0' &  x"13";	-- STA @VAR14 	#Inicializando constante com 14
			tmp(37) := "0100" & '0' &  x"0F";	-- LDI $15
			tmp(38) := "0101" & '0' &  x"14";	-- STA @VAR15 	#Inicializando constante com 15
			tmp(39) := "0101" & '1' &  x"FF";	-- STA @CLR 	#Limpar KEY0
			tmp(40) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(41) := "0101" & '1' &  x"FD";	-- STA @509 	#Limpar KEY2
			tmp(42) := "0101" & '1' &  x"FC";	-- STA @508 	#Limpar KEY3
			tmp(43) := "0101" & '1' &  x"FB";	-- STA @507 	#Limpar FPGA_RESET

			-- Loop
			tmp(44) := "0001" & '1' &  x"60";	-- LDA @KEY0 	#Ler KEY0
			tmp(45) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(46) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Comparar com 1
			tmp(47) := "0111" & '0' &  x"4A";	-- JEQ @HubIncremento 	#Pular pra subrotina de incremento

			-- PosIncremento
			tmp(48) := "0001" & '1' &  x"61";	-- LDA @KEY1 	#Ler KEY1
			tmp(49) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(50) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Comparar com 1
			tmp(51) := "0111" & '0' &  x"4C";	-- JEQ @HubLimite 	#Pular pra subrotina de limite

			-- PosLimite
			tmp(52) := "1001" & '1' &  x"72";	-- JSR @Verificar 	#Pular pra subrotina de verificar limite
			tmp(53) := "0001" & '1' &  x"62";	-- LDA @KEY2 	#Ler KEY1
			tmp(54) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(55) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Comparar com 1
			tmp(56) := "0111" & '0' &  x"4E";	-- JEQ @HubDecremento 	#Pular pra subrotina de Decremento

			-- PosDecremento
			tmp(57) := "0001" & '1' &  x"64";	-- LDA @FPGA_RESET 	#Ler FPGA_RESET
			tmp(58) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(59) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Comparar com 1
			tmp(60) := "0111" & '0' &  x"50";	-- JEQ @HubReset 	#Pular pra subrotina de reset

			-- PosReset
			tmp(61) := "0001" & '0' &  x"00";	-- LDA @UNI 	#Carrega acumulador com valor da unidade
			tmp(62) := "0101" & '1' &  x"20";	-- STA @HEX0 	#Carrega unidade no HEX0
			tmp(63) := "0001" & '0' &  x"01";	-- LDA @DEC 	#Carrega acumulador com valor da dezena
			tmp(64) := "0101" & '1' &  x"21";	-- STA @HEX1 	#Carrega unidade no HEX1
			tmp(65) := "0001" & '0' &  x"02";	-- LDA @CEN 	#Carrega acumulador com valor da centena
			tmp(66) := "0101" & '1' &  x"22";	-- STA @HEX2 	#Carrega unidade no HEX2
			tmp(67) := "0001" & '0' &  x"03";	-- LDA @MUNI 	#Carrega acumulador com valor da unidade de milhar
			tmp(68) := "0101" & '1' &  x"23";	-- STA @HEX3 	#Carrega unidade no HEX3
			tmp(69) := "0001" & '0' &  x"04";	-- LDA @MDEC 	#Carrega acumulador com valor da dezena de milhar
			tmp(70) := "0101" & '1' &  x"24";	-- STA @HEX4 	#Carrega unidade no HEX4
			tmp(71) := "0001" & '0' &  x"05";	-- LDA @MCEN 	#Carrega acumulador com valor da centena de milhar
			tmp(72) := "0101" & '1' &  x"25";	-- STA @HEX5 	#Carrega unidade no HEX5
			tmp(73) := "0110" & '0' &  x"2C";	-- JMP @Loop 	#Reiniciar Loop

			-- HubIncremento
			tmp(74) := "1001" & '0' &  x"52";	-- JSR @Incremento 	#Para usar RET
			tmp(75) := "0110" & '0' &  x"30";	-- JMP @PosIncremento 	#Voltar pro loop

			-- HubLimite
			tmp(76) := "1001" & '0' &  x"88";	-- JSR @Limite 	#Para usar RET
			tmp(77) := "0110" & '0' &  x"34";	-- JMP @PosLimite 	#Voltar pro loop

			-- HubDecremento
			tmp(78) := "1001" & '1' &  x"35";	-- JSR @Decremento 	#Para usar RET
			tmp(79) := "0110" & '0' &  x"39";	-- JMP @PosDecremento 	#Voltar pro loop

			-- HubReset
			tmp(80) := "1001" & '1' &  x"8E";	-- JSR @Reset 	#Para usar RET
			tmp(81) := "0110" & '0' &  x"3D";	-- JMP @PosReset 	#Voltar pro loop

			-- Incremento
			tmp(82) := "0101" & '1' &  x"FF";	-- STA @CLR
			tmp(83) := "0001" & '0' &  x"07";	-- LDA @VAR1 	#Verificar overflow
			tmp(84) := "1000" & '0' &  x"09";	-- CEQ @FLAG
			tmp(85) := "0111" & '1' &  x"A1";	-- JEQ @Retorno
			tmp(86) := "0001" & '0' &  x"00";	-- LDA @UNI 	#Carrega acumulador unidade
			tmp(87) := "0010" & '0' &  x"07";	-- SOMA @VAR1 	#Soma memoria com acumulador
			tmp(88) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Compara com 10
			tmp(89) := "0111" & '0' &  x"5C";	-- JEQ @Dezena 	#Caso 10, pular pra dezena
			tmp(90) := "0101" & '0' &  x"00";	-- STA @UNI 	#Caso contrario, salvar na unidade
			tmp(91) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- Dezena
			tmp(92) := "0100" & '0' &  x"00";	-- LDI $0 	#Carrega acumulador com 0
			tmp(93) := "0101" & '0' &  x"00";	-- STA @UNI 	#Zera unidade
			tmp(94) := "0001" & '0' &  x"01";	-- LDA @DEC 	#Carrega acumulador dezena
			tmp(95) := "0010" & '0' &  x"07";	-- SOMA @VAR1 	#Soma memoria com acumulador
			tmp(96) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Compara com 10
			tmp(97) := "0111" & '0' &  x"64";	-- JEQ @Centena 	#Caso 10, pular pra centena
			tmp(98) := "0101" & '0' &  x"01";	-- STA @DEC 	#Caso contrario, salvar na unidade
			tmp(99) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- Centena
			tmp(100) := "0100" & '0' &  x"00";	-- LDI $0 	#Carrega acumulador com 0
			tmp(101) := "0101" & '0' &  x"01";	-- STA @DEC 	#Zera dezena
			tmp(102) := "0001" & '0' &  x"02";	-- LDA @CEN 	#Carrega acumulador centena
			tmp(103) := "0010" & '0' &  x"07";	-- SOMA @VAR1 	#Soma memoria com acumulador
			tmp(104) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Compara com 10
			tmp(105) := "0111" & '0' &  x"6C";	-- JEQ @UniMilhar 	#Caso 10, pular pra unidade de milhar
			tmp(106) := "0101" & '0' &  x"02";	-- STA @CEN 	#Caso contrario, salvar na centena
			tmp(107) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- UniMilhar
			tmp(108) := "0100" & '0' &  x"00";	-- LDI $0 	#Carrega acumulador com 0
			tmp(109) := "0101" & '0' &  x"02";	-- STA @CEN 	#Zera centena
			tmp(110) := "0001" & '0' &  x"03";	-- LDA @MUNI 	#Carrega acumulador unidade de milhar
			tmp(111) := "0010" & '0' &  x"07";	-- SOMA @VAR1 	#Soma memoria com acumulador
			tmp(112) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Compara com 10
			tmp(113) := "0111" & '0' &  x"74";	-- JEQ @DecMilhar 	#Caso 10, pular pra dezena de milhar
			tmp(114) := "0101" & '0' &  x"03";	-- STA @MUNI 	#Caso contrario, salvar na unidade de milhar
			tmp(115) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- DecMilhar
			tmp(116) := "0100" & '0' &  x"00";	-- LDI $0 	#Carrega acumulador com 0
			tmp(117) := "0101" & '0' &  x"03";	-- STA @MUNI 	#Zera unidade de milhar
			tmp(118) := "0001" & '0' &  x"04";	-- LDA @MDEC 	#Carrega acumulador dezena de milhar
			tmp(119) := "0010" & '0' &  x"07";	-- SOMA @VAR1 	#Soma memoria com acumulador
			tmp(120) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Compara com 10
			tmp(121) := "0111" & '0' &  x"7C";	-- JEQ @CenMilhar 	#Caso 10, pular pra centena de milhar
			tmp(122) := "0101" & '0' &  x"04";	-- STA @MDEC 	#Caso contrario, salvar na dezena de milhar
			tmp(123) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- CenMilhar
			tmp(124) := "0100" & '0' &  x"00";	-- LDI $0 	#Carrega acumulador com 0
			tmp(125) := "0101" & '0' &  x"04";	-- STA @MDEC 	#Zera dezena de milhar
			tmp(126) := "0001" & '0' &  x"05";	-- LDA @MCEN 	#Carrega acumulador centena de milhar
			tmp(127) := "0010" & '0' &  x"07";	-- SOMA @VAR1 	#Soma memoria com acumulador
			tmp(128) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Compara com 10
			tmp(129) := "0111" & '0' &  x"84";	-- JEQ @Overflow 	#Caso 10, pular pra Overflow
			tmp(130) := "0101" & '0' &  x"05";	-- STA @MCEN 	#Caso contrario, salvar na Centena de milhar
			tmp(131) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- Overflow
			tmp(132) := "0001" & '0' &  x"07";	-- LDA @VAR1 	#Carrega 1
			tmp(133) := "0101" & '1' &  x"02";	-- STA @LEDR9 	#Led overflow
			tmp(134) := "0101" & '0' &  x"09";	-- STA @FLAG 	#Flag inibir
			tmp(135) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- Limite
			tmp(136) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(137) := "0100" & '0' &  x"00";	-- LDI $0 	#Limpando os 7 segmentos para mostrar o limite
			tmp(138) := "0101" & '1' &  x"20";	-- STA @HEX0
			tmp(139) := "0101" & '1' &  x"21";	-- STA @HEX1
			tmp(140) := "0101" & '1' &  x"22";	-- STA @HEX2
			tmp(141) := "0101" & '1' &  x"23";	-- STA @HEX3
			tmp(142) := "0101" & '1' &  x"24";	-- STA @HEX4
			tmp(143) := "0101" & '1' &  x"25";	-- STA @HEX5
			tmp(144) := "0100" & '0' &  x"01";	-- LDI $1
			tmp(145) := "0101" & '1' &  x"00";	-- STA @LEDR7 	#Liga LEDR0 pra indicar aguardando leitura

			-- LimiteUni
			tmp(146) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(147) := "0001" & '1' &  x"40";	-- LDA @SW7 	#Leitura do SW0-7
			tmp(148) := "1011" & '0' &  x"0F";	-- ANDI @15 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
			tmp(149) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(150) := "0111" & '1' &  x"29";	-- JEQ @LimiteUniMax
			tmp(151) := "1000" & '0' &  x"10";	-- CEQ @VAR11 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(152) := "0111" & '1' &  x"29";	-- JEQ @LimiteUniMax
			tmp(153) := "1000" & '0' &  x"11";	-- CEQ @VAR12 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(154) := "0111" & '1' &  x"29";	-- JEQ @LimiteUniMax
			tmp(155) := "1000" & '0' &  x"12";	-- CEQ @VAR13 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(156) := "0111" & '1' &  x"29";	-- JEQ @LimiteUniMax
			tmp(157) := "1000" & '0' &  x"13";	-- CEQ @VAR14 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(158) := "0111" & '1' &  x"29";	-- JEQ @LimiteUniMax
			tmp(159) := "1000" & '0' &  x"14";	-- CEQ @VAR15 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(160) := "0111" & '1' &  x"29";	-- JEQ @LimiteUniMax

			-- PosLimiteUni
			tmp(161) := "0101" & '0' &  x"0A";	-- STA @LIMU 	#Guarda na memoria o limite da unidade
			tmp(162) := "0101" & '1' &  x"20";	-- STA @HEX0 	#Carrega leitura do SW0-7 no HEX0
			tmp(163) := "0001" & '1' &  x"61";	-- LDA @KEY1 	#Ler KEY1
			tmp(164) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(165) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Ve se KEY1 está apertado
			tmp(166) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(167) := "0111" & '0' &  x"A9";	-- JEQ @PosLU 	#Se tiver, guarda e vai embora
			tmp(168) := "0110" & '0' &  x"92";	-- JMP @LimiteUni 	#Caso contrario, faz de novo

			-- PosLU
			tmp(169) := "0100" & '0' &  x"02";	-- LDI $2
			tmp(170) := "0101" & '1' &  x"00";	-- STA @LEDR7 	#Liga LEDR1 pra indicar aguardando leitura

			-- LimiteDec
			tmp(171) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(172) := "0001" & '1' &  x"40";	-- LDA @SW7 	#Leitura do SW0-7
			tmp(173) := "1011" & '0' &  x"0F";	-- ANDI @15 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
			tmp(174) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(175) := "0111" & '1' &  x"2B";	-- JEQ @LimiteDecMax
			tmp(176) := "1000" & '0' &  x"10";	-- CEQ @VAR11 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(177) := "0111" & '1' &  x"2B";	-- JEQ @LimiteDecMax
			tmp(178) := "1000" & '0' &  x"11";	-- CEQ @VAR12 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(179) := "0111" & '1' &  x"2B";	-- JEQ @LimiteDecMax
			tmp(180) := "1000" & '0' &  x"12";	-- CEQ @VAR13 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(181) := "0111" & '1' &  x"2B";	-- JEQ @LimiteDecMax
			tmp(182) := "1000" & '0' &  x"13";	-- CEQ @VAR14 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(183) := "0111" & '1' &  x"2B";	-- JEQ @LimiteDecMax
			tmp(184) := "1000" & '0' &  x"14";	-- CEQ @VAR15 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(185) := "0111" & '1' &  x"2B";	-- JEQ @LimiteDecMax

			-- PosLimiteDec
			tmp(186) := "0101" & '0' &  x"0B";	-- STA @LIMD 	#Guarda na memoria o limite da dezena
			tmp(187) := "0101" & '1' &  x"21";	-- STA @HEX1 	#Carrega leitura do SW0-7 no HEX1
			tmp(188) := "0001" & '1' &  x"61";	-- LDA @KEY1 	#Ler KEY1
			tmp(189) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(190) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Ve se KEY1 está apertado
			tmp(191) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(192) := "0111" & '0' &  x"C2";	-- JEQ @PosLD 	#Se tiver, guarda e vai embora
			tmp(193) := "0110" & '0' &  x"AB";	-- JMP @LimiteDec 	#Caso contrario, faz de novo

			-- PosLD
			tmp(194) := "0100" & '0' &  x"04";	-- LDI $4
			tmp(195) := "0101" & '1' &  x"00";	-- STA @LEDR7 	#Liga LEDR2 pra indicar aguardando leitura

			-- LimiteCen
			tmp(196) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(197) := "0001" & '1' &  x"40";	-- LDA @SW7 	#Leitura do SW0-7
			tmp(198) := "1011" & '0' &  x"0F";	-- ANDI @15 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
			tmp(199) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(200) := "0111" & '1' &  x"2D";	-- JEQ @LimiteCenMax
			tmp(201) := "1000" & '0' &  x"10";	-- CEQ @VAR11 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(202) := "0111" & '1' &  x"2D";	-- JEQ @LimiteCenMax
			tmp(203) := "1000" & '0' &  x"11";	-- CEQ @VAR12 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(204) := "0111" & '1' &  x"2D";	-- JEQ @LimiteCenMax
			tmp(205) := "1000" & '0' &  x"12";	-- CEQ @VAR13 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(206) := "0111" & '1' &  x"2D";	-- JEQ @LimiteCenMax
			tmp(207) := "1000" & '0' &  x"13";	-- CEQ @VAR14 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(208) := "0111" & '1' &  x"2D";	-- JEQ @LimiteCenMax
			tmp(209) := "1000" & '0' &  x"14";	-- CEQ @VAR15 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(210) := "0111" & '1' &  x"2D";	-- JEQ @LimiteCenMax

			-- PosLimiteCen
			tmp(211) := "0101" & '0' &  x"0C";	-- STA @LIMC 	#Guarda na memoria o limite da centena
			tmp(212) := "0101" & '1' &  x"22";	-- STA @HEX2 	#Carrega leitura do SW0-7 no HEX2
			tmp(213) := "0001" & '1' &  x"61";	-- LDA @KEY1 	#Ler KEY1
			tmp(214) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(215) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Ve se KEY1 está apertado
			tmp(216) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(217) := "0111" & '0' &  x"DB";	-- JEQ @PosLC 	#Se tiver, guarda e vai embora
			tmp(218) := "0110" & '0' &  x"C4";	-- JMP @LimiteCen 	#Caso contrario, faz de novo

			-- PosLC
			tmp(219) := "0100" & '0' &  x"08";	-- LDI $8
			tmp(220) := "0101" & '1' &  x"00";	-- STA @LEDR7 	#Liga LEDR3 pra indicar aguardando leitura

			-- LimiteMUni
			tmp(221) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(222) := "0001" & '1' &  x"40";	-- LDA @SW7 	#Leitura do SW0-7
			tmp(223) := "1011" & '0' &  x"0F";	-- ANDI @15 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
			tmp(224) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(225) := "0111" & '1' &  x"2F";	-- JEQ @LimiteMUniMax
			tmp(226) := "1000" & '0' &  x"10";	-- CEQ @VAR11 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(227) := "0111" & '1' &  x"2F";	-- JEQ @LimiteMUniMax
			tmp(228) := "1000" & '0' &  x"11";	-- CEQ @VAR12 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(229) := "0111" & '1' &  x"2F";	-- JEQ @LimiteMUniMax
			tmp(230) := "1000" & '0' &  x"12";	-- CEQ @VAR13 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(231) := "0111" & '1' &  x"2F";	-- JEQ @LimiteMUniMax
			tmp(232) := "1000" & '0' &  x"13";	-- CEQ @VAR14 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(233) := "0111" & '1' &  x"2F";	-- JEQ @LimiteMUniMax
			tmp(234) := "1000" & '0' &  x"14";	-- CEQ @VAR15 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(235) := "0111" & '1' &  x"2F";	-- JEQ @LimiteMUniMax

			-- PosLimiteMUni
			tmp(236) := "0101" & '0' &  x"0D";	-- STA @LIMMU 	#Guarda na memoria o limite da unidade de milhar
			tmp(237) := "0101" & '1' &  x"23";	-- STA @HEX3 	#Carrega leitura do SW0-7 no HEX3
			tmp(238) := "0001" & '1' &  x"61";	-- LDA @KEY1 	#Ler KEY1
			tmp(239) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(240) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Ve se KEY1 está apertado
			tmp(241) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(242) := "0111" & '0' &  x"F4";	-- JEQ @PosLMU 	#Se tiver, guarda e vai embora
			tmp(243) := "0110" & '0' &  x"DD";	-- JMP @LimiteMUni 	#Caso contrario, faz de novo

			-- PosLMU
			tmp(244) := "0100" & '0' &  x"10";	-- LDI $16
			tmp(245) := "0101" & '1' &  x"00";	-- STA @LEDR7 	#liga LEDR4 pra indicar aguardando leitura

			-- LimiteMDec
			tmp(246) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(247) := "0001" & '1' &  x"40";	-- LDA @SW7 	#Leitura do SW0-7
			tmp(248) := "1011" & '0' &  x"0F";	-- ANDI @15 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
			tmp(249) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(250) := "0111" & '1' &  x"31";	-- JEQ @LimiteMDecMax
			tmp(251) := "1000" & '0' &  x"10";	-- CEQ @VAR11 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(252) := "0111" & '1' &  x"31";	-- JEQ @LimiteMDecMax
			tmp(253) := "1000" & '0' &  x"11";	-- CEQ @VAR12 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(254) := "0111" & '1' &  x"31";	-- JEQ @LimiteMDecMax
			tmp(255) := "1000" & '0' &  x"12";	-- CEQ @VAR13 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(256) := "0111" & '1' &  x"31";	-- JEQ @LimiteMDecMax
			tmp(257) := "1000" & '0' &  x"13";	-- CEQ @VAR14 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(258) := "0111" & '1' &  x"31";	-- JEQ @LimiteMDecMax
			tmp(259) := "1000" & '0' &  x"14";	-- CEQ @VAR15 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(260) := "0111" & '1' &  x"31";	-- JEQ @LimiteMDecMax

			-- PosLimiteMDec
			tmp(261) := "0101" & '0' &  x"0E";	-- STA @LIMMD 	#Guarda na memoria o limite da dezena de milhar
			tmp(262) := "0101" & '1' &  x"24";	-- STA @HEX4 	#Carrega leitura do SW0-7 no HEX4
			tmp(263) := "0001" & '1' &  x"61";	-- LDA @KEY1 	#Ler KEY1
			tmp(264) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(265) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Ve se KEY1 está apertado
			tmp(266) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(267) := "0111" & '1' &  x"0D";	-- JEQ @PosLMD 	#Se tiver, guarda e vai embora
			tmp(268) := "0110" & '0' &  x"F6";	-- JMP @LimiteMDec 	#Caso contrario, faz de novo

			-- PosLMD
			tmp(269) := "0100" & '0' &  x"20";	-- LDI $32
			tmp(270) := "0101" & '1' &  x"00";	-- STA @LEDR7 	#Liga LEDR5 pra indicar aguardando leitura

			-- LimiteMCen
			tmp(271) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(272) := "0001" & '1' &  x"40";	-- LDA @SW7 	#Leitura do SW0-7
			tmp(273) := "1011" & '0' &  x"0F";	-- ANDI @15 	#Aplicar mascara a leitura do botao para só pegar SW(3 downto 0)
			tmp(274) := "1000" & '0' &  x"08";	-- CEQ @VAR10 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(275) := "0111" & '1' &  x"33";	-- JEQ @LimiteMCenMax
			tmp(276) := "1000" & '0' &  x"10";	-- CEQ @VAR11 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(277) := "0111" & '1' &  x"33";	-- JEQ @LimiteMCenMax
			tmp(278) := "1000" & '0' &  x"11";	-- CEQ @VAR12 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(279) := "0111" & '1' &  x"33";	-- JEQ @LimiteMCenMax
			tmp(280) := "1000" & '0' &  x"12";	-- CEQ @VAR13 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(281) := "0111" & '1' &  x"33";	-- JEQ @LimiteMCenMax
			tmp(282) := "1000" & '0' &  x"13";	-- CEQ @VAR14 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(283) := "0111" & '1' &  x"33";	-- JEQ @LimiteMCenMax
			tmp(284) := "1000" & '0' &  x"14";	-- CEQ @VAR15 	#Verificar overflow do HEX (ele aceita de 10-15, mas o contador não)
			tmp(285) := "0111" & '1' &  x"33";	-- JEQ @LimiteMCenMax

			-- PosLimiteMCen
			tmp(286) := "0101" & '0' &  x"0F";	-- STA @LIMMC 	#Guarda na memoria o limite da centena de milhar
			tmp(287) := "0101" & '1' &  x"25";	-- STA @HEX5 	#Carrega leitura do SW0-7 no HEX5
			tmp(288) := "0001" & '1' &  x"61";	-- LDA @KEY1 	#Ler KEY1
			tmp(289) := "1011" & '0' &  x"01";	-- ANDI @1 	#Aplicar máscara a leitura da KEY
			tmp(290) := "1000" & '0' &  x"07";	-- CEQ @VAR1 	#Ve se KEY1 está apertado
			tmp(291) := "0101" & '1' &  x"FE";	-- STA @510 	#Limpar KEY1
			tmp(292) := "0111" & '1' &  x"26";	-- JEQ @PosLMC 	#Se tiver, guarda e vai embora
			tmp(293) := "0110" & '1' &  x"0F";	-- JMP @LimiteMCen 	#Caso contrario, faz de novo

			-- PosLMC
			tmp(294) := "0100" & '0' &  x"00";	-- LDI $0
			tmp(295) := "0101" & '1' &  x"00";	-- STA @LEDR7 	#Desliga LEDR0-7
			tmp(296) := "1010" & '0' &  x"00";	-- RET

			-- LimiteUniMax
			tmp(297) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega 9 no imediato
			tmp(298) := "0110" & '0' &  x"A1";	-- JMP @PosLimiteUni 	#Volta

			-- LimiteDecMax
			tmp(299) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega 9 no imediato
			tmp(300) := "0110" & '0' &  x"BA";	-- JMP @PosLimiteDec 	#Volta

			-- LimiteCenMax
			tmp(301) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega 9 no imediato
			tmp(302) := "0110" & '0' &  x"D3";	-- JMP @PosLimiteCen 	#Volta

			-- LimiteMUniMax
			tmp(303) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega 9 no imediato
			tmp(304) := "0110" & '0' &  x"EC";	-- JMP @PosLimiteMUni 	#Volta

			-- LimiteMDecMax
			tmp(305) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega 9 no imediato
			tmp(306) := "0110" & '1' &  x"05";	-- JMP @PosLimiteMDec 	#Volta

			-- LimiteMCenMax
			tmp(307) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega 9 no imediato
			tmp(308) := "0110" & '1' &  x"1E";	-- JMP @PosLimiteMCen 	#Volta

			-- Decremento
			tmp(309) := "0101" & '1' &  x"FD";	-- STA @509 	#Limpa KEY2
			tmp(310) := "0001" & '0' &  x"06";	-- LDA @VAR0 	#Abaixar overflow
			tmp(311) := "0101" & '0' &  x"09";	-- STA @FLAG
			tmp(312) := "0101" & '1' &  x"02";	-- STA @LEDR9 	#Desligar Led Overflow
			tmp(313) := "0101" & '1' &  x"01";	-- STA @LEDR8 	#Desligar Led Limite
			tmp(314) := "0001" & '0' &  x"00";	-- LDA @UNI 	#Carrega acumulador unidade
			tmp(315) := "1000" & '0' &  x"06";	-- CEQ @VAR0 	#Compara com 0
			tmp(316) := "0111" & '1' &  x"40";	-- JEQ @Dezena_Sub 	#Caso 0, pular pra dezena
			tmp(317) := "0011" & '0' &  x"07";	-- SUB @VAR1 	#Subtrai memoria com acumulador
			tmp(318) := "0101" & '0' &  x"00";	-- STA @UNI 	#Caso contrario, salvar na unidade
			tmp(319) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- Dezena_Sub
			tmp(320) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega acumulador com 9
			tmp(321) := "0101" & '0' &  x"00";	-- STA @UNI 	#Coloca 9 na unidade
			tmp(322) := "0001" & '0' &  x"01";	-- LDA @DEC 	#Carrega acumulador dezena
			tmp(323) := "1000" & '0' &  x"06";	-- CEQ @VAR0 	#Compara com 0
			tmp(324) := "0111" & '1' &  x"48";	-- JEQ @Centena_Sub 	#Caso 0, pular pra centena
			tmp(325) := "0011" & '0' &  x"07";	-- SUB @VAR1 	#Subtrai memoria com acumulador
			tmp(326) := "0101" & '0' &  x"01";	-- STA @DEC 	#Caso contrario, salvar na unidade
			tmp(327) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- Centena_Sub
			tmp(328) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega acumulador com 9
			tmp(329) := "0101" & '0' &  x"01";	-- STA @DEC 	#Coloca 9 na dezena
			tmp(330) := "0001" & '0' &  x"02";	-- LDA @CEN 	#Carrega acumulador centena
			tmp(331) := "1000" & '0' &  x"06";	-- CEQ @VAR0 	#Compara com 0
			tmp(332) := "0111" & '1' &  x"50";	-- JEQ @UniMilhar_Sub 	#Caso 0, pular pra unidade de milhar
			tmp(333) := "0011" & '0' &  x"07";	-- SUB @VAR1 	#Subtrai memoria com acumulador
			tmp(334) := "0101" & '0' &  x"02";	-- STA @CEN 	#Caso contrario, salvar na centena
			tmp(335) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- UniMilhar_Sub
			tmp(336) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega acumulador com 9
			tmp(337) := "0101" & '0' &  x"02";	-- STA @CEN 	#Coloca 9 centena
			tmp(338) := "0001" & '0' &  x"03";	-- LDA @MUNI 	#Carrega acumulador unidade de milhar
			tmp(339) := "1000" & '0' &  x"06";	-- CEQ @VAR0 	#Compara com 0
			tmp(340) := "0111" & '1' &  x"58";	-- JEQ @DecMilhar_Sub 	#Caso 0, pular pra dezena de milhar
			tmp(341) := "0011" & '0' &  x"07";	-- SUB @VAR1 	#Soma memoria com acumulador
			tmp(342) := "0101" & '0' &  x"03";	-- STA @MUNI 	#Caso contrario, salvar na unidade de milhar
			tmp(343) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- DecMilhar_Sub
			tmp(344) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega acumulador com 9
			tmp(345) := "0101" & '0' &  x"03";	-- STA @MUNI 	#Zera unidade de milhar
			tmp(346) := "0001" & '0' &  x"04";	-- LDA @MDEC 	#Carrega acumulador dezena de milhar
			tmp(347) := "1000" & '0' &  x"06";	-- CEQ @VAR0 	#Compara com 0
			tmp(348) := "0111" & '1' &  x"60";	-- JEQ @CenMilhar_Sub 	#Caso 0, pular pra centena de milhar
			tmp(349) := "0011" & '0' &  x"07";	-- SUB @VAR1 	#Subtrai memoria com acumulador
			tmp(350) := "0101" & '0' &  x"04";	-- STA @MDEC 	#Caso contrario, salvar na dezena de milhar
			tmp(351) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- CenMilhar_Sub
			tmp(352) := "0100" & '0' &  x"09";	-- LDI $9 	#Carrega acumulador com 9
			tmp(353) := "0101" & '0' &  x"04";	-- STA @MDEC 	#Carrega dezena de milhar
			tmp(354) := "0001" & '0' &  x"05";	-- LDA @MCEN 	#Carrega acumulador centena de milhar
			tmp(355) := "1000" & '0' &  x"06";	-- CEQ @VAR0 	#Compara com 0
			tmp(356) := "0111" & '1' &  x"68";	-- JEQ @Zerar 	#Caso 0, pular pra Zerar
			tmp(357) := "0011" & '0' &  x"07";	-- SUB @VAR1 	#Subtrai memoria com acumulador
			tmp(358) := "0101" & '0' &  x"05";	-- STA @MCEN 	#Caso contrario, salvar na Centena de milhar
			tmp(359) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- Zerar
			tmp(360) := "0001" & '0' &  x"06";	-- LDA @VAR0 	#Carrega 0
			tmp(361) := "0101" & '1' &  x"02";	-- STA @LEDR9 	#Apaga Led overflow
			tmp(362) := "0101" & '0' &  x"09";	-- STA @FLAG 	#Abaixa Flag inibir
			tmp(363) := "0101" & '0' &  x"00";	-- STA @UNI 	#Zerando variaveis
			tmp(364) := "0101" & '0' &  x"01";	-- STA @DEC
			tmp(365) := "0101" & '0' &  x"02";	-- STA @CEN
			tmp(366) := "0101" & '0' &  x"03";	-- STA @MUNI
			tmp(367) := "0101" & '0' &  x"04";	-- STA @MDEC
			tmp(368) := "0101" & '0' &  x"05";	-- STA @MCEN
			tmp(369) := "1010" & '0' &  x"00";	-- RET 	#Retornar

			-- Verificar
			tmp(370) := "0001" & '0' &  x"00";	-- LDA @UNI 	#Carrega valor da unidade
			tmp(371) := "1000" & '0' &  x"0A";	-- CEQ @LIMU 	#Compara unidade com o limite
			tmp(372) := "0111" & '1' &  x"76";	-- JEQ @VerificarDec 	#Se estiver no limite, checar dezena
			tmp(373) := "1010" & '0' &  x"00";	-- RET

			-- VerificarDec
			tmp(374) := "0001" & '0' &  x"01";	-- LDA @DEC 	#Carrega valor da dezena
			tmp(375) := "1000" & '0' &  x"0B";	-- CEQ @LIMD 	#Compara dezena com o limite
			tmp(376) := "0111" & '1' &  x"7A";	-- JEQ @VerificarCen 	#Se estiver no limite, checar centena
			tmp(377) := "1010" & '0' &  x"00";	-- RET

			-- VerificarCen
			tmp(378) := "0001" & '0' &  x"02";	-- LDA @CEN 	#Carrega valor da centena
			tmp(379) := "1000" & '0' &  x"0C";	-- CEQ @LIMC 	#Compara centena com o limite
			tmp(380) := "0111" & '1' &  x"7E";	-- JEQ @VerificarMUni 	#Se estiver no limite, checar unidade de milhar
			tmp(381) := "1010" & '0' &  x"00";	-- RET

			-- VerificarMUni
			tmp(382) := "0001" & '0' &  x"03";	-- LDA @MUNI 	#Carrega valor da unidade de milhar
			tmp(383) := "1000" & '0' &  x"0D";	-- CEQ @LIMMU 	#Compara unidade de milhar com o limite
			tmp(384) := "0111" & '1' &  x"82";	-- JEQ @VerificarMDec 	#Se estiver no limite, checar dezena de milhar
			tmp(385) := "1010" & '0' &  x"00";	-- RET

			-- VerificarMDec
			tmp(386) := "0001" & '0' &  x"04";	-- LDA @MDEC 	#Carrega valor da dezena de milhar
			tmp(387) := "1000" & '0' &  x"0E";	-- CEQ @LIMMD 	#Compara dezena de milhar com o limite
			tmp(388) := "0111" & '1' &  x"86";	-- JEQ @VerificarMCen 	#Se estiver no limite, checar centena de milhar
			tmp(389) := "1010" & '0' &  x"00";	-- RET

			-- VerificarMCen
			tmp(390) := "0001" & '0' &  x"05";	-- LDA @MCEN 	#Carrega valor da centena de milhar
			tmp(391) := "1000" & '0' &  x"0F";	-- CEQ @LIMMC 	#Compara centena de milhar com o limite
			tmp(392) := "0111" & '1' &  x"8A";	-- JEQ @LimiteAtingido 	#Se estiver no limite, pular pra SR de limite atingido
			tmp(393) := "1010" & '0' &  x"00";	-- RET

			-- LimiteAtingido
			tmp(394) := "0001" & '0' &  x"07";	-- LDA @VAR1 	#Carrega 1
			tmp(395) := "0101" & '1' &  x"01";	-- STA @LEDR8 	#Led Limite
			tmp(396) := "0101" & '0' &  x"09";	-- STA @FLAG 	#Flag inibir
			tmp(397) := "1010" & '0' &  x"00";	-- RET

			-- Reset
			tmp(398) := "0101" & '1' &  x"FB";	-- STA @507 	#Limpar FPGA_RESET
			tmp(399) := "0001" & '0' &  x"06";	-- LDA @VAR0 	#Carregar 0
			tmp(400) := "0101" & '0' &  x"09";	-- STA @FLAG 	#Abaixando flag
			tmp(401) := "0101" & '1' &  x"01";	-- STA @LEDR8 	#Desligando Led Limite
			tmp(402) := "0101" & '1' &  x"02";	-- STA @LEDR9 	#Desligando Led Overflow
			tmp(403) := "0101" & '0' &  x"00";	-- STA @UNI 	#Zerando as variáveis
			tmp(404) := "0101" & '0' &  x"01";	-- STA @DEC
			tmp(405) := "0101" & '0' &  x"02";	-- STA @CEN
			tmp(406) := "0101" & '0' &  x"03";	-- STA @MUNI
			tmp(407) := "0101" & '0' &  x"04";	-- STA @MDEC
			tmp(408) := "0101" & '0' &  x"05";	-- STA @MCEN
			tmp(409) := "0100" & '0' &  x"09";	-- LDI $9
			tmp(410) := "0101" & '0' &  x"0A";	-- STA @LIMU 	#Limpando limites
			tmp(411) := "0101" & '0' &  x"0B";	-- STA @LIMD
			tmp(412) := "0101" & '0' &  x"0C";	-- STA @LIMC
			tmp(413) := "0101" & '0' &  x"0D";	-- STA @LIMMU
			tmp(414) := "0101" & '0' &  x"0E";	-- STA @LIMMD
			tmp(415) := "0101" & '0' &  x"0F";	-- STA @LIMMC
			tmp(416) := "1010" & '0' &  x"00";	-- RET

			-- Retorno
			tmp(417) := "1010" & '0' &  x"00";	-- RET

        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;