--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package utils is

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--
-- std_logic_vector is the Column. 
	subtype AES_Byte is std_logic_vector(0 to 7);
	subtype AES_32 is std_logic_vector(0 to 31);
	subtype AES_Int is integer range 0 to 127;
	
	type AES_Word is array(0 to 3) of AES_Byte;
-- Word is a column!!!
	type AES_Block is array (0 to 3) of AES_Word;
	type AES_SBox is array (0 to 15, 0 to 15) of AES_Byte;
	
	function v2i (arg : AES_Byte) return AES_Int;
	
	function word_to_vector (signal w: in AES_Word) return AES_32;
	
	function inv_subs_byte (signal b: in AES_Byte) return AES_Byte;
	function inv_subs_word (signal w : in AES_Word) return AES_Word;
	
	function inv_shift_rows (signal b : in AES_Block) return AES_Block;
	
	function add_round_key (signal inp : in AES_Block; signal key : in AES_Block) return AES_Block;
	
	function inv_mix_column (signal w: in AES_Word) return AES_Word;
	--function 
	
	constant mix_col_matrix : AES_Block :=
	( 0 => (0 => x"02", 1=> x"01", 2 => x"01", 3 => x"03"),
	  1 => (0 => x"03", 1=> x"02", 2 => x"01", 3 => x"01"),
	  2 => (0 => x"01", 1=> x"03", 2 => x"02", 3 => x"01"),
	  3 => (0 => x"01", 1=> x"01", 2 => x"03", 3 => x"02"));
	  
	constant inv_mix_col_matrix : AES_Block :=
	(
	0 => (0 => x"0e", 1 => x"09", 2 => x"0d", 3 => x"0b"),
	1 => (0 => x"0b", 1 => x"0e", 2 => x"09", 3 => x"0d"),
	2 => (0 => x"0d", 1 => x"0b", 2 => x"0e", 3 => x"09"),
	3 => (0 => x"09", 1 => x"0d", 2 => x"0b", 3 => x"0e"));
	
	constant SBOX_INV : AES_SBox := 
	
 (
0 => ( 0 => x"52", 1 => x"09", 2 => x"6a", 3 => x"d5", 4 => x"30", 5 => x"36", 6 => x"a5", 7 => x"38", 8 => x"bf", 9 => x"40",
  10 =>  x"a3",11 => x"9e", 12 =>  x"81", 13 => x"f3", 14 => x"d7", 15 => x"fb"),
 
1 => ( 0 => x"7c", 1 => x"e3", 2 => x"39", 3 => x"82", 4 => x"9b", 5 => x"2f", 6 => x"ff", 7 => x"87", 8 => x"34", 9 => x"8e",
  10 =>  x"43",11 => x"44", 12 =>  x"c4", 13 => x"de", 14 => x"e9", 15 => x"cb"),
 
2 => ( 0 => x"54", 1 => x"7b", 2 => x"94", 3 => x"32", 4 => x"a6", 5 => x"c2", 6 => x"23", 7 => x"3d", 8 => x"ee", 9 => x"4c",
  10 =>  x"95",11 => x"0b", 12 =>  x"42", 13 => x"fa", 14 => x"c3", 15 => x"4e"),
 
3 => ( 0 => x"08", 1 => x"2e", 2 => x"a1", 3 => x"66", 4 => x"28", 5 => x"d9", 6 => x"24", 7 => x"b2", 8 => x"76", 9 => x"5b",
  10 =>  x"a2",11 => x"49", 12 =>  x"6d", 13 => x"8b", 14 => x"d1", 15 => x"25"),
 
4 => ( 0 => x"72", 1 => x"f8", 2 => x"f6", 3 => x"64", 4 => x"86", 5 => x"68", 6 => x"98", 7 => x"16", 8 => x"d4", 9 => x"a4",
  10 =>  x"5c",11 => x"cc", 12 =>  x"5d", 13 => x"65", 14 => x"b6", 15 => x"92"),
 
5 => ( 0 => x"6c", 1 => x"70", 2 => x"48", 3 => x"50", 4 => x"fd", 5 => x"ed", 6 => x"b9", 7 => x"da", 8 => x"5e", 9 => x"15",
  10 =>  x"46",11 => x"57", 12 =>  x"a7", 13 => x"8d", 14 => x"9d", 15 => x"84"),
 
6 => ( 0 => x"90", 1 => x"d8", 2 => x"ab", 3 => x"00", 4 => x"8c", 5 => x"bc", 6 => x"d3", 7 => x"0a", 8 => x"f7", 9 => x"e4",
  10 =>  x"58",11 => x"05", 12 =>  x"b8", 13 => x"b3", 14 => x"45", 15 => x"06"),
 
7 => ( 0 => x"d0", 1 => x"2c", 2 => x"1e", 3 => x"8f", 4 => x"ca", 5 => x"3f", 6 => x"0f", 7 => x"02", 8 => x"c1", 9 => x"af",
  10 =>  x"bd",11 => x"03", 12 =>  x"01", 13 => x"13", 14 => x"8a", 15 => x"6b"),
 
8 => ( 0 => x"3a", 1 => x"91", 2 => x"11", 3 => x"41", 4 => x"4f", 5 => x"67", 6 => x"dc", 7 => x"ea", 8 => x"97", 9 => x"f2",
  10 =>  x"cf",11 => x"ce", 12 =>  x"f0", 13 => x"b4", 14 => x"e6", 15 => x"73"),
 
9 => ( 0 => x"96", 1 => x"ac", 2 => x"74", 3 => x"22", 4 => x"e7", 5 => x"ad", 6 => x"35", 7 => x"85", 8 => x"e2", 9 => x"f9",
  10 =>  x"37",11 => x"e8", 12 =>  x"1c", 13 => x"75", 14 => x"df", 15 => x"6e"),
 
10 => ( 0 => x"47", 1 => x"f1", 2 => x"1a", 3 => x"71", 4 => x"1d", 5 => x"29", 6 => x"c5", 7 => x"89", 8 => x"6f", 9 => x"b7",
  10 =>  x"62",11 => x"0e", 12 =>  x"aa", 13 => x"18", 14 => x"be", 15 => x"1b"),
 
11 => ( 0 => x"fc", 1 => x"56", 2 => x"3e", 3 => x"4b", 4 => x"c6", 5 => x"d2", 6 => x"79", 7 => x"20", 8 => x"9a", 9 => x"db",
  10 =>  x"c0",11 => x"fe", 12 =>  x"78", 13 => x"cd", 14 => x"5a", 15 => x"f4"),
 
 12 => ( 0 => x"1f", 1 => x"dd", 2 => x"a8", 3 => x"33", 4 => x"88", 5 => x"07", 6 => x"c7", 7 => x"31", 8 => x"b1", 9 => x"12",
  10 =>  x"10",11 => x"59", 12 =>  x"27", 13 => x"80", 14 => x"ec", 15 => x"5f"),
 
13 => ( 0 => x"60", 1 => x"51", 2 => x"7f", 3 => x"a9", 4 => x"19", 5 => x"b5", 6 => x"4a", 7 => x"0d", 8 => x"2d", 9 => x"e5",
  10 =>  x"7a",11 => x"9f", 12 =>  x"93", 13 => x"c9", 14 => x"9c", 15 => x"ef"),
 
14 => ( 0 => x"a0", 1 => x"e0", 2 => x"3b", 3 => x"4d", 4 => x"ae", 5 => x"2a", 6 => x"f5", 7 => x"b0", 8 => x"c8", 9 => x"eb",
  10 =>  x"bb",11 => x"3c", 12 =>  x"83", 13 => x"53", 14 => x"99", 15 => x"61"),
 
15 => ( 0 => x"17", 1 => x"2b", 2 => x"04", 3 => x"7e", 4 => x"ba", 5 => x"77", 6 => x"d6", 7 => x"26", 8 => x"e1", 9 => x"69",
  10 =>  x"14",11 => x"63", 12 =>  x"55", 13 => x"21", 14 => x"0c", 15 => x"7d"));
  


	
end utils;

package body utils is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
	function word_to_vector (signal w: in AES_Word) return AES_32 is
	variable accum : std_logic_vector(0 to 31);
	begin
		accum(0 to 7) := w(0);
		accum(8 to 15) := w(1);
		accum(16 to 23) := w(2);
		accum(24 to 31) := w(3);
		
		return accum;
	end word_to_vector;

	function inv_subs_byte (signal b: in AES_Byte) return AES_Byte is
	variable upper : std_logic_vector(0 to 3);
	variable lower : std_logic_vector(0 to 3);
	begin
		upper := b(0 to 3);
		lower := b(4 to 7);
		return SBOX_INV( to_integer(unsigned(upper)), to_integer(unsigned(lower)));
	end inv_subs_byte;
	
	function inv_subs_word (signal w : in AES_Word) return AES_Word is
	variable accum : AES_Word;
	begin
		accum(0) := inv_subs_byte(w(0));
		accum(1) := inv_subs_byte(w(1));
		accum(2) := inv_subs_byte(w(2));
		accum(3) := inv_subs_byte(w(3));
		return accum;
	end inv_subs_word;

	function inv_shift_rows (signal b : in AES_Block) return AES_Block is
	variable accum : AES_Block;
	begin
	-- first index is col number. snd is row number
		
		accum(0)(0) := b(0)(0);
		accum(1)(1) := b(0)(1);
		accum(2)(2) := b(0)(2);
		accum(3)(3) := b(0)(3);
		
		accum(1)(0) := b(1)(0);
		accum(2)(1) := b(1)(1);
		accum(3)(2) := b(1)(2);
		accum(0)(3) := b(1)(3);
		
		accum(2)(0) := b(2)(0);
		accum(3)(1) := b(2)(1);
		accum(0)(2) := b(2)(2);
		accum(1)(3) := b(2)(3);
		
		accum(3)(0) := b(3)(0);
		accum(0)(1) := b(3)(1);
		accum(1)(2) := b(3)(2);
		accum(2)(3) := b(3)(3);
		
		return accum;
	end inv_shift_rows;
	
	function add_round_key (signal inp : in AES_Block; signal key : in AES_Block) return AES_Block is
	variable accum : AES_Block;
	begin
		for i in 0 to 3 loop
			for j in 0 to 3 loop
				accum(i)(j) := inp(i)(j) xor key(i)(j);
			end loop;
		end loop;
		return accum;
	end add_round_key;
	
	function inv_mix_column (signal w: in AES_Word) return AES_Word is
	variable accum : AES_Word;
	begin
		for i in 0 to 3 loop
			accum(i) := inv_mix_col_matrix(0)(i) * w(0) + inv_mix_col_matrix(1)(i) * w(1) + 
							inv_mix_col_matrix(2)(i) * w(2) + inv_mix_col_matrix(3)(i) * w(3); 
		end loop;
		return accum;
	end inv_mix_column;
end utils;
