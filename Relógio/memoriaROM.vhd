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

        return tmp;
    end initMemory;

    signal memROM : blocoMemoria := initMemory;

begin
    Dado <= memROM (to_integer(unsigned(Endereco)));
end architecture;