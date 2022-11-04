library ieee;
use ieee.std_logic_1164.all;

entity processador is
  -- Total de bits das entradas e saidas
  generic ( larguraDados : natural := 8;
        larguraEnderecos : natural := 9;
		  tamanhoCommando : natural := 2
  );
  port   (
    CLK : in std_logic;
	 reset : in std_logic;
	 instruction : in std_logic_vector(15 downto 0);
	 data_in : in std_logic_vector(7 downto 0);
	 
	 rd : out std_logic;
	 wr : out std_logic;
	 data_out : out std_logic_vector(7 downto 0);
	 data_address : out std_logic_vector(8 downto 0);
	 rom_address : out std_logic_vector(8 downto 0)
  );
end entity;


architecture arquitetura of processador is

  signal MUX_REG1 : std_logic_vector (larguraDados-1 downto 0);
  signal MUX_REGJ : std_logic_vector (larguraEnderecos-1 downto 0);
  signal REG1_ULA_A : std_logic_vector (larguraDados-1 downto 0);
  signal Saida_ULA : std_logic_vector (larguraDados-1 downto 0);
  signal Sinais_Controle : std_logic_vector (13 downto 0);
  signal Endereco : std_logic_vector (larguraEnderecos-1 downto 0);
  signal proxPC : std_logic_vector (larguraEnderecos-1 downto 0);
  signal SelMUXjmp : std_logic_vector (1 downto 0);
  signal Operacao_ULA : std_logic_vector (tamanhoCommando-1 downto 0);
  signal REG_Eq_S : std_logic;
  signal REG_Gt_S : std_logic;
  signal flag_Z : std_logic;
  signal flag_G : std_logic;
  signal endRetorno : STD_LOGIC_VECTOR (larguraEnderecos-1 downto 0);

begin

-- Instanciando os componentes:

-- O port map completo do MUX.
MUX1 :  entity work.muxGenerico2x1  generic map (larguraDados => larguraDados)
        port map( entradaA_MUX => data_in,
                 entradaB_MUX => instruction(7 downto 0),
                 seletor_MUX => Sinais_Controle(6),
                 saida_MUX => MUX_REG1);
					  
MUXJMP :  entity work.muxGenerico4x1  generic map (larguraDados => larguraEnderecos)
        port map( entradaA_MUX => proxPC,
						entradaB_MUX => instruction(8 downto 0),
						entradaC_MUX => endRetorno,
                  seletor_MUX => SelMUXjmp,
                  saida_MUX => MUX_REGJ);

-- O port map completo do Acumulador.
--REGA : entity work.registradorGenerico   generic map (larguraDados => larguraDados)
--          port map (DIN => Saida_ULA,
--							DOUT => REG1_ULA_A, 
--							ENABLE => Sinais_Controle(5), 
--							CLK => CLK, 
--							RST => '0');
			 
-- arquitetura memoria registrador
bancoReg : entity work.bancoRegistradoresArqRegMem   generic map (larguraDados => larguraDados, larguraEndBancoRegs => 3)
          port map ( clk => CLK,
              endereco => instruction(11 downto 9),
              dadoEscrita => Saida_ULA,
              habilitaEscrita => Sinais_Controle(5),
              saida  => REG1_ULA_A);

-- O port map completo do Program Counter.
PC : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
          port map (DIN => MUX_REGJ, DOUT => Endereco, ENABLE => '1', CLK => CLK, RST => reset);

incrementaPC :  entity work.somaConstante  generic map (larguraDados => larguraEnderecos, constante => 1)
        port map( entrada => Endereco, saida => proxPC);
		  
regRet : entity work.registradorGenerico   generic map (larguraDados => larguraEnderecos)
          port map (DIN => proxPC, DOUT => endRetorno, ENABLE => Sinais_Controle(11), CLK => CLK, RST => '0');

flipFlop : entity work.flipFlop
          port map (DIN => flag_Z, DOUT => REG_Eq_S, ENABLE => Sinais_Controle(2), CLK => CLK, RST => '0');
			 
flipFlop2 : entity work.flipFlop
          port map (DIN => flag_G, DOUT => REG_Gt_S, ENABLE => Sinais_Controle(12), CLK => CLK, RST => '0');

-- O port map completo da ULA:
ULA1 : entity work.ULASomaSub  generic map(larguraDados => larguraDados)
          port map (entradaA => REG1_ULA_A, entradaB => MUX_REG1, saida => Saida_ULA, flag_Z => flag_Z, flag_G => flag_G, seletor => Operacao_ULA);

decoderInstru :  entity work.decoderInstru
        port map(opcode => instruction(15 downto 12), saida => Sinais_Controle);
					  
logicDesvio :  entity work.logicDesvio
        port map(JMP => Sinais_Controle(10), JEQ => Sinais_Controle(7), 
					  FlagEq => REG_Eq_S, JSR => Sinais_Controle(8),
					  RET => Sinais_Controle(9), saida => SelMUXjmp,
					  FlagGt => REG_Gt_S, JGT => Sinais_Controle(13));

Operacao_ULA <= Sinais_Controle(4 downto 3);


-- Saidas:
data_out <= REG1_ULA_A;
rom_address <= Endereco;
data_address <= instruction(8 downto 0);
rd <= Sinais_Controle(1);
wr <= Sinais_Controle(0);

end architecture;