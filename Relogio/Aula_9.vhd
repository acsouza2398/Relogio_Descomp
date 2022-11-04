library ieee;
use ieee.std_logic_1164.all;

entity Aula_9 is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8;
        larguraEnderecos : natural := 9;
		  tamanhoCommando : natural := 2;
		  size : natural := 1;
        simulacao : boolean := TRUE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 SW : in std_logic_vector(9 downto 0);
	 FPGA_RESET_N : in std_logic;
	 LEDR  : out std_logic_vector(9 downto 0);
	 HEX0 : out std_logic_vector(6 downto 0);
	 HEX1 : out std_logic_vector(6 downto 0);
	 HEX2 : out std_logic_vector(6 downto 0);
	 HEX3 : out std_logic_vector(6 downto 0);
	 HEX4 : out std_logic_vector(6 downto 0);
	 HEX5 : out std_logic_vector(6 downto 0)
	 
	 -- Debug
--	 DATA_IN : out std_logic_vector(7 downto 0);
--	 DATA_OUT : out std_logic_vector(7 downto 0);
--	 Instruction_IN : out std_logic_vector(12 downto 0);
--	 ROM_Address : out std_logic_vector(8 downto 0);
--	 flag_ff : out std_logic
	 
	 
  );
end entity;


architecture arquitetura of Aula_9 is

-- Faltam alguns sinais:
  signal proc_out : std_logic_vector (larguraDados-1 downto 0);
  signal Endereco : std_logic_vector (larguraEnderecos-1 downto 0);
  signal CLK : std_logic;
  signal clk_mux : std_logic;
  signal clk_KEY0 : std_logic;
  signal clk_KEY0A : std_logic;
  signal clk_KEY1 : std_logic;
  signal clk_KEY2 : std_logic;
  signal clk_KEY3 : std_logic;
  signal clk_RESET : std_logic;
  signal blocoSaida : std_logic_vector (7 downto 0);
  signal endSaida : std_logic_vector (7 downto 0);
  signal blocoHabLed : std_logic;
  signal addr: std_logic_vector (8 downto 0);
  signal instruction : std_logic_vector (15 downto 0);
  signal ligaLed7 : std_logic_vector (7 downto 0);
  signal ligaLed8 : std_logic;
  signal ligaLed9 : std_logic;
  signal dadoHex0 : std_logic_vector (3 downto 0);
  signal dadoHex1 : std_logic_vector (3 downto 0);
  signal dadoHex2 : std_logic_vector (3 downto 0);
  signal dadoHex3 : std_logic_vector (3 downto 0);
  signal dadoHex4 : std_logic_vector (3 downto 0);
  signal dadoHex5 : std_logic_vector (3 downto 0);
  signal habLeituraMEM : std_logic;
  signal habEscritaMEM : std_logic;
  signal flag_z : std_logic;
  signal saidaLed7 : std_logic;
  signal saidaLed8 : std_logic;
  signal saidaLed9 : std_logic;
  signal saidaHex0 : std_logic;
  signal saidaHex1 : std_logic;
  signal saidaHex2 : std_logic;
  signal saidaHex3 : std_logic;
  signal saidaHex4 : std_logic;
  signal saidaHex5 : std_logic;
  signal saidaSW7 : std_logic;
  signal saidaSW8 : std_logic;
  signal saidaSW9 : std_logic;
  signal saidaKEY0 : std_logic;
  signal saidaKEY1 : std_logic;
  signal saidaKEY2 : std_logic;
  signal saidaKEY3 : std_logic;
  signal saidaRESET : std_logic;
  signal dLeituraRAM : STD_LOGIC_VECTOR (larguraDados-1 downto 0);
  signal clk_ff : std_logic;
  signal entradaKEY0 : std_logic;
  signal entradaKEY1 : std_logic;
  signal entradaKEY2 : std_logic;
  signal entradaKEY3 : std_logic;
  signal entradaRESET : std_logic;
  signal entradaBufKEY0 : std_logic_vector (7 downto 0);
  signal entradaBufKEY1 : std_logic_vector (7 downto 0);
  signal entradaBufKEY2 : std_logic_vector (7 downto 0);
  signal entradaBufKEY3 : std_logic_vector (7 downto 0);
  signal entradaBufRESET : std_logic_vector (7 downto 0);
  signal limpaLeitura : std_logic;
  signal limpaLeitura1 : std_logic;
  signal limpaLeitura2 : std_logic;
  signal limpaLeitura3 : std_logic;
  signal limpaLeituraR : std_logic;

begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
--gravar:  if simulacao generate
--CLK <= KEY(0);
--else generate
--
--
--
--end generate;

CLK <= CLOCK_50;


-- Componentes

ROM1 : entity work.memoriaROM   generic map (dataWidth => 16, addrWidth => 9)
          port map (Endereco => Endereco, Dado => instruction);
					  
memoriaRAM : entity work.memoriaRAM   generic map (dataWidth => 8, addrWidth => 8)
          port map (addr => addr(5 downto 0), we => habEscritaMEM, re => habLeituraMEM, habilita => blocoSaida(0), 
			 dado_in => proc_out, dado_out => dLeituraRAM, clk => CLK);	 
			 
processador : entity work.processador generic map ( larguraDados => larguraDados, larguraEnderecos => 9, tamanhoCommando => 2)
			 port map (CLK => CLK, instruction => instruction, data_in => dLeituraRAM, rd => habLeituraMEM,
						  wr => habEscritaMEM, data_out => proc_out, data_address => addr, rom_address => Endereco, reset => '0');

decoderBloco :  entity work.decoder3x8
        port map(entrada => addr(8 downto 6), saida => blocoSaida);
		  
decoderEnd :  entity work.decoder3x8
        port map(entrada => addr(2 downto 0), saida => endSaida);
		
		
-- Leds (Conferido)
		  
saidaLed7 <= (blocoHabLed AND habEscritaMEM AND endSaida(0) AND NOT (addr(5)));
saidaLed8 <= (blocoHabLed AND habEscritaMEM AND endSaida(1) AND NOT (addr(5)));
saidaLed9 <= (blocoHabLed AND habEscritaMEM AND endSaida(2) AND NOT (addr(5)));
			 	
blocoHabLed <= blocoSaida(4);	

RegLed7 : entity work.registradorGenerico   generic map (larguraDados => 8)
          port map (DIN => proc_out, DOUT => ligaLed7, ENABLE => saidaLed7, CLK => CLK, RST => '0');
			 
ffLed8 : entity work.flipFlop
          port map (DIN => proc_out(0), DOUT => ligaLed8, ENABLE => saidaLed8, CLK => CLK, RST => '0');
			 
ffLed9 : entity work.flipFlop
          port map (DIN => proc_out(0), DOUT => ligaLed9, ENABLE => saidaLed9, CLK => CLK, RST => '0');
		
		
-- Display Hex (Conferido)
	
saidaHex0 <= (blocoHabLed AND habEscritaMEM AND endSaida(0) AND addr(5));
saidaHex1 <= (blocoHabLed AND habEscritaMEM AND endSaida(1) AND addr(5));
saidaHex2 <= (blocoHabLed AND habEscritaMEM AND endSaida(2) AND addr(5));
saidaHex3 <= (blocoHabLed AND habEscritaMEM AND endSaida(3) AND addr(5));
saidaHex4 <= (blocoHabLed AND habEscritaMEM AND endSaida(4) AND addr(5));
saidaHex5 <= (blocoHabLed AND habEscritaMEM AND endSaida(5) AND addr(5));
	
RegHex0 : entity work.registradorGenerico   generic map (larguraDados => 4)
          port map (DIN => proc_out(3 downto 0), DOUT => dadoHex0, ENABLE => saidaHex0, CLK => CLK, RST => '0');

RegHex1 : entity work.registradorGenerico   generic map (larguraDados => 4)
          port map (DIN => proc_out(3 downto 0), DOUT => dadoHex1, ENABLE => saidaHex1, CLK => CLK, RST => '0');
			
RegHex2 : entity work.registradorGenerico   generic map (larguraDados => 4)
          port map (DIN => proc_out(3 downto 0), DOUT => dadoHex2, ENABLE => saidaHex2, CLK => CLK, RST => '0');
			 
RegHex3 : entity work.registradorGenerico   generic map (larguraDados => 4)
          port map (DIN => proc_out(3 downto 0), DOUT => dadoHex3, ENABLE => saidaHex3, CLK => CLK, RST => '0');
			 
RegHex4 : entity work.registradorGenerico   generic map (larguraDados => 4)
          port map (DIN => proc_out(3 downto 0), DOUT => dadoHex4, ENABLE => saidaHex4, CLK => CLK, RST => '0');
			 
RegHex5 : entity work.registradorGenerico   generic map (larguraDados => 4)
          port map (DIN => proc_out(3 downto 0), DOUT => dadoHex5, ENABLE => saidaHex5, CLK => CLK, RST => '0');
			 
ConHex0 :  entity work.conversorHex7Seg
        port map(dadoHex => dadoHex0, apaga =>  '0', negativo => '0', overFlow =>  '0', saida7seg => HEX0);
					  
ConHex1 :  entity work.conversorHex7Seg
        port map(dadoHex => dadoHex1, apaga =>  '0', negativo => '0', overFlow =>  '0', saida7seg => HEX1);
					  
ConHex2 :  entity work.conversorHex7Seg
        port map(dadoHex => dadoHex2, apaga =>  '0', negativo => '0', overFlow =>  '0', saida7seg => HEX2);
					  
ConHex3 :  entity work.conversorHex7Seg
        port map(dadoHex => dadoHex3, apaga =>  '0', negativo => '0', overFlow =>  '0', saida7seg => HEX3);
					  
ConHex4 :  entity work.conversorHex7Seg
        port map(dadoHex => dadoHex4, apaga =>  '0', negativo => '0', overFlow =>  '0', saida7seg => HEX4);
					  
ConHex5 :  entity work.conversorHex7Seg
        port map(dadoHex => dadoHex5, apaga =>  '0', negativo => '0', overFlow =>  '0', saida7seg => HEX5);
		
		
-- Switches

saidaSW7 <= blocoSaida(5) AND habLeituraMEM AND endSaida(0) AND NOT addr(5);
saidaSW8 <= blocoSaida(5) AND habLeituraMEM AND endSaida(1) AND NOT addr(5);
saidaSW9 <= blocoSaida(5) AND habLeituraMEM AND endSaida(2) AND NOT addr(5);
		
BufferSW7 :  entity work.buffer_3_state_8portas
        port map(entrada => SW(7 downto 0), habilita =>  saidaSW7, saida => dLeituraRAM);		
		  
BufferSW8 :  entity work.buffer_3_state
        port map(entrada => SW(8), habilita =>  saidaSW8, saida => dLeituraRAM(0));		
		  
BufferSW9 :  entity work.buffer_3_state
        port map(entrada => SW(9), habilita =>  saidaSW9, saida => dLeituraRAM(0));		
		  
		  
-- Keys

saidaKEY0 <= blocoSaida(5) AND habLeituraMEM AND endSaida(0) AND addr(5);
saidaKEY1 <= blocoSaida(5) AND habLeituraMEM AND endSaida(1) AND addr(5);
saidaKEY2 <= blocoSaida(5) AND habLeituraMEM AND endSaida(2) AND addr(5);
saidaKEY3 <= blocoSaida(5) AND habLeituraMEM AND endSaida(3) AND addr(5);
saidaRESET <= blocoSaida(5) AND habLeituraMEM AND endSaida(4) AND addr(5);
		
BufferKEY0 :  entity work.buffer_3_state
        port map(entrada => entradaKEY0, habilita =>  saidaKEY0, saida => dLeituraRAM(0));		

BufferKEY1 :  entity work.buffer_3_state
        port map(entrada => entradaKEY1, habilita =>  saidaKEY1, saida => dLeituraRAM(0));		

BufferKEY2 :  entity work.buffer_3_state
        port map(entrada => entradaKEY2, habilita =>  saidaKEY2, saida => dLeituraRAM(0));		

BufferKEY3 :  entity work.buffer_3_state
        port map(entrada => entradaKEY3, habilita =>  saidaKEY3, saida => dLeituraRAM(0));		

BufferRESET :  entity work.buffer_3_state
        port map(entrada => entradaRESET, habilita =>  saidaRESET, saida => dLeituraRAM(0));


		-- Debounce KEY0

-- detectorSub0: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => clk_KEY0);

divisorN : entity work.divisorGenerico
            generic map (divisor => 25000000)   -- divide por 25M.
            port map (clk => CLOCK_50, saida_clk => clk_KEY0);
				
divisorA : entity work.divisorGenerico
            generic map (divisor => 100000)   -- divide por 25M.
            port map (clk => CLOCK_50, saida_clk => clk_KEY0A);
				
muxClock :  entity work.muxGenerico2x1 generic map (larguraDados => 1)
        port map( entradaA_MUX(0) => clk_KEY0,
                 entradaB_MUX(0) =>  clk_KEY0A,
                 seletor_MUX => not KEY(0),
                 saida_MUX(0) => clk_mux);

ffKEY0 : entity work.flipFlop
          port map (DIN => '1', DOUT => entradaKEY0, ENABLE => '1', CLK => clk_mux, RST => limpaLeitura);
			 
limpaLeitura <= addr(0) AND addr(1) AND addr(2) AND addr(3) AND addr(4) AND addr(5) AND addr(6) AND addr(7) AND addr(8) AND habEscritaMEM;

		-- Debounce KEY1

detectorSub1: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(1)), saida => clk_KEY1);

ffKEY1 : entity work.flipFlop
          port map (DIN => '1', DOUT => entradaKEY1, ENABLE => '1', CLK => clk_KEY1, RST => limpaLeitura1);
			 
limpaLeitura1 <= NOT(addr(0)) AND addr(1) AND addr(2) AND addr(3) AND addr(4) AND addr(5) AND addr(6) AND addr(7) AND addr(8) AND habEscritaMEM;

		-- Debounce KEY2

detectorSub2: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(2)), saida => clk_KEY2);

ffKEY2 : entity work.flipFlop
          port map (DIN => '1', DOUT => entradaKEY2, ENABLE => '1', CLK => clk_KEY2, RST => limpaLeitura2);
			 
limpaLeitura2 <= addr(0) AND NOT(addr(1)) AND addr(2) AND addr(3) AND addr(4) AND addr(5) AND addr(6) AND addr(7) AND addr(8) AND habEscritaMEM; --509

		-- Debounce KEY3

detectorSub3: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(3)), saida => clk_KEY3);

ffKEY3 : entity work.flipFlop
          port map (DIN => '1', DOUT => entradaKEY3, ENABLE => '1', CLK => clk_KEY3, RST => limpaLeitura3);
			 
limpaLeitura3 <= NOT(addr(0)) AND NOT(addr(1)) AND addr(2) AND addr(3) AND addr(4) AND addr(5) AND addr(6) AND addr(7) AND addr(8) AND habEscritaMEM; --508

		-- Debounce FPGA_RESET

detectorSubR: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not FPGA_RESET_N), saida => clk_RESET);

ffKEYR : entity work.flipFlop
          port map (DIN => '1', DOUT => entradaRESET, ENABLE => '1', CLK => clk_RESET, RST => limpaLeiturar);
			 
limpaLeituraR <= addr(0) AND addr(1) AND NOT(addr(2)) AND addr(3) AND addr(4) AND addr(5) AND addr(6) AND addr(7) AND addr(8) AND habEscritaMEM; --507
	
		
-- Saidas:

LEDR(7 downto 0) <= ligaLed7;
LEDR(8) <= ligaLed8;
LEDR(9) <= ligaLed9;

		-- Debug
--LEDR(9) <= flag_z;
--LEDR(8 downto 0) <= Endereco;
--DATA_IN <= dLeituraRAM;
--DATA_OUT <= proc_out;
--Instruction_IN <= instruction;
--ROM_Address <= Endereco;

end architecture;
