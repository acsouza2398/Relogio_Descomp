library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    -- Biblioteca IEEE para funções aritméticas

entity ULASomaSub is
    generic ( larguraDados : natural := 6;
				  tamanhoCommando : natural := 2 
	 );
    port (
      entradaA, entradaB:  in STD_LOGIC_VECTOR((larguraDados-1) downto 0);
      seletor:  in STD_LOGIC_VECTOR((tamanhoCommando-1) downto 0);
      saida:    out STD_LOGIC_VECTOR((larguraDados-1) downto 0);
		flag_Z: out STD_LOGIC
    );
end entity;

architecture comportamento of ULASomaSub is
   signal soma :      STD_LOGIC_VECTOR((larguraDados-1) downto 0);
   signal subtracao : STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal passa :     STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	signal andI :     STD_LOGIC_VECTOR((larguraDados-1) downto 0);
	
   begin
      soma      <= STD_LOGIC_VECTOR(unsigned(entradaA) + unsigned(entradaB));
      subtracao <= STD_LOGIC_VECTOR(unsigned(entradaA) - unsigned(entradaB));
		passa 	 <= STD_LOGIC_VECTOR(unsigned(entradaB));
		andI      <= STD_LOGIC_VECTOR(unsigned(entradaA) and unsigned(entradaB));
		
      saida <= soma when (seletor = "01") else 
					subtracao when (seletor = "00") else
					andI when (seletor = "11") else
					passa;
		flag_Z <= '1' when (subtracao = "00000000") else '0';
end architecture;