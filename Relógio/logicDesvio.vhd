library ieee;
use ieee.std_logic_1164.all;

entity logicDesvio is
  port ( JMP: in std_logic;
			JEQ : in std_logic;
			FlagEq : in std_logic;
			JSR : in std_logic;
			RET : in std_logic;
			saida: out std_logic_vector(1 downto 0)
  );
end entity;

architecture comportamento of logicDesvio is
  

  begin
saida(0) <= JMP OR (JEQ AND FlagEq) OR JSR;
saida(1) <= RET;

end architecture;