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
	subtype AES_ExpandedKey_Index is Integer range 0 to 10;
	subtype AES_Stage is integer range 0 to 3;
	subtype AES_Block_Index is integer range 0 to 3;

	type AES_Word is array(0 to 3) of AES_Byte;
-- Word is a column!!!
	type AES_Block is array (0 to 3) of AES_Word;
	type AES_Block_S0 is array (0 to 1) of AES_Word;
	type AES_Block_S1 is array (2 to 3) of AES_Word;

	type AES_SBox is array (0 to 15, 0 to 15) of AES_Byte;
	
	type AES_RCons is array (0 to 10) of AES_Byte;
--	type AES_ExpandedKey is array(0 to 10, 0 to 3) of AES_Word;
	type AES_ExpandedKey is array(0 to 10) of AES_Block;

	type AES_IndexTuple is array(0 to 1) of AES_Block_Index;

	type AES_Decrypt_Stage is (DecryptReset,DecryptInitial, DecryptNineLoop, DecryptEnd);
	
	function v2i (arg : AES_Byte) return AES_Int;
	function i2v (arg : AES_Int) return AES_Byte;
	
	function word_to_vector ( w:  AES_Word) return AES_32;
	function vector_to_word (v : AES_32) return AES_Word;
	
	--function block_from_expkey (k : AES_ExpandedKey; i : AES_ExpandedKey_Index) return AES_Block;
	
	function inv_subs_byte ( b: AES_Byte) return AES_Byte;
	function inv_subs_word ( w :  AES_Word) return AES_Word;
	function inv_subs_block ( b :  AES_Block) return AES_Block ;
	function inv_subs_block_s0 ( b :  AES_Block_S0) return AES_Block_S0;
	function inv_subs_block_s1 ( b :  AES_Block_S1) return AES_Block_S1;
	
	function subs_byte (b: AES_Byte) return AES_Byte;
	function subs_word (w : AES_Word) return AES_Word;
	
	function inv_shift_rows ( b :  AES_Block) return AES_Block;
	
	function add_round_key (inp : AES_Block; key : AES_Block) return AES_Block;
	function add_round_key_s0 (inp : AES_Block_S0; key : AES_Block_S0) return AES_Block_S0;
	function add_round_key_s1 (inp : AES_Block_S1; key : AES_Block_S1) return AES_Block_S1;

	function inv_mix_column ( w:  AES_Word) return AES_Word;
	function inv_mix_column_block (w : AES_Block) return AES_Block;
	function inv_mix_column_block_s1 (w : AES_Block_S1) return AES_Block_S1;
	function inv_mix_column_block_s0 (w : AES_Block_S0) return AES_Block_S0;

	function key_expansion ( cipher_key :  AES_Block) return AES_ExpandedKey;
	
	function xor_word ( a :AES_Word;  b: AES_Word) return AES_Word;
		
	function gmul_2 (a : AES_Byte) return AES_Byte;
		
	function gmul (a : AES_Byte; g: AES_Byte) return AES_Byte;
		
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
	
	constant round_cons : AES_RCons :=
	(0 => x"00", 1 => x"01", 2 => x"02",3 => x"04",4 => x"08",5 => x"10",6 => x"20",7 => x"40",8 => x"80",9 => x"1B",10 => x"36");
	
	
	constant SBOX : AES_SBox :=
	
  (
  0=> (0=> x"63", 1=> x"7c", 2=> x"77", 3=> x"7b", 4=> x"f2", 5=> x"6b", 6=> x"6f", 7=> x"c5", 8=> x"30", 9=> x"01", 10=> x"67", 11=> x"2b", 12=> x"fe", 13=> x"d7", 14=> x"ab", 15=> x"76"),
  1=> (0=> x"ca", 1=> x"82", 2=> x"c9", 3=> x"7d", 4=> x"fa", 5=> x"59", 6=> x"47", 7=> x"f0", 8=> x"ad", 9=> x"d4", 10=> x"a2", 11=> x"af", 12=> x"9c", 13=> x"a4", 14=> x"72", 15=> x"c0"),
  2=> (0=> x"b7", 1=> x"fd", 2=> x"93", 3=> x"26", 4=> x"36", 5=> x"3f", 6=> x"f7", 7=> x"cc", 8=> x"34", 9=> x"a5", 10=> x"e5", 11=> x"f1", 12=> x"71", 13=> x"d8", 14=> x"31", 15=> x"15"),
  3=> (0=> x"04", 1=> x"c7", 2=> x"23", 3=> x"c3", 4=> x"18", 5=> x"96", 6=> x"05", 7=> x"9a", 8=> x"07", 9=> x"12", 10=> x"80", 11=> x"e2", 12=> x"eb", 13=> x"27", 14=> x"b2", 15=> x"75"),
  4=> (0=> x"09", 1=> x"83", 2=> x"2c", 3=> x"1a", 4=> x"1b", 5=> x"6e", 6=> x"5a", 7=> x"a0", 8=> x"52", 9=> x"3b", 10=> x"d6", 11=> x"b3", 12=> x"29", 13=> x"e3", 14=> x"2f", 15=> x"84"),
  5=> (0=> x"53", 1=> x"d1", 2=> x"00", 3=> x"ed", 4=> x"20", 5=> x"fc", 6=> x"b1", 7=> x"5b", 8=> x"6a", 9=> x"cb", 10=> x"be", 11=> x"39", 12=> x"4a", 13=> x"4c", 14=> x"58", 15=> x"cf"),
  6=> (0=> x"d0", 1=> x"ef", 2=> x"aa", 3=> x"fb", 4=> x"43", 5=> x"4d", 6=> x"33", 7=> x"85", 8=> x"45", 9=> x"f9", 10=> x"02", 11=> x"7f", 12=> x"50", 13=> x"3c", 14=> x"9f", 15=> x"a8"),
  7=> (0=> x"51", 1=> x"a3", 2=> x"40", 3=> x"8f", 4=> x"92", 5=> x"9d", 6=> x"38", 7=> x"f5", 8=> x"bc", 9=> x"b6", 10=> x"da", 11=> x"21", 12=> x"10", 13=> x"ff", 14=> x"f3", 15=> x"d2"),
  8=> (0=> x"cd", 1=> x"0c", 2=> x"13", 3=> x"ec", 4=> x"5f", 5=> x"97", 6=> x"44", 7=> x"17", 8=> x"c4", 9=> x"a7", 10=> x"7e", 11=> x"3d", 12=> x"64", 13=> x"5d", 14=> x"19", 15=> x"73"),
  9=> (0=> x"60", 1=> x"81", 2=> x"4f", 3=> x"dc", 4=> x"22", 5=> x"2a", 6=> x"90", 7=> x"88", 8=> x"46", 9=> x"ee", 10=> x"b8", 11=> x"14", 12=> x"de", 13=> x"5e", 14=> x"0b", 15=> x"db"),
  10=> (0=> x"e0", 1=> x"32", 2=> x"3a", 3=> x"0a", 4=> x"49", 5=> x"06", 6=> x"24", 7=> x"5c", 8=> x"c2", 9=> x"d3", 10=> x"ac", 11=> x"62", 12=> x"91", 13=> x"95", 14=> x"e4", 15=> x"79"),
  11=> (0=> x"e7", 1=> x"c8", 2=> x"37", 3=> x"6d", 4=> x"8d", 5=> x"d5", 6=> x"4e", 7=> x"a9", 8=> x"6c", 9=> x"56", 10=> x"f4", 11=> x"ea", 12=> x"65", 13=> x"7a", 14=> x"ae", 15=> x"08"),
  12=> (0=> x"ba", 1=> x"78", 2=> x"25", 3=> x"2e", 4=> x"1c", 5=> x"a6", 6=> x"b4", 7=> x"c6", 8=> x"e8", 9=> x"dd", 10=> x"74", 11=> x"1f", 12=> x"4b", 13=> x"bd", 14=> x"8b", 15=> x"8a"),
  13=> (0=> x"70", 1=> x"3e", 2=> x"b5", 3=> x"66", 4=> x"48", 5=> x"03", 6=> x"f6", 7=> x"0e", 8=> x"61", 9=> x"35", 10=> x"57", 11=> x"b9", 12=> x"86", 13=> x"c1", 14=> x"1d", 15=> x"9e"),
  14=> (0=> x"e1", 1=> x"f8", 2=> x"98", 3=> x"11", 4=> x"69", 5=> x"d9", 6=> x"8e", 7=> x"94", 8=> x"9b", 9=> x"1e", 10=> x"87", 11=> x"e9", 12=> x"ce", 13=> x"55", 14=> x"28", 15=> x"df"),
  15=> (0=> x"8c", 1=> x"a1", 2=> x"89", 3=> x"0d", 4=> x"bf", 5=> x"e6", 6=> x"42", 7=> x"68", 8=> x"41", 9=> x"99", 10=> x"2d", 11=> x"0f", 12=> x"b0", 13=> x"54", 14=> x"bb", 15=> x"16"));
	
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

	function gmul_2 (a : AES_Byte) return AES_Byte is
	variable accum : AES_Byte;
	begin
		if a(0) = '1' then
			accum := std_logic_vector(unsigned(a) sll 1);
			accum := accum xor x"1b";
		else
			accum := std_logic_vector(unsigned(a) sll 1);
		end if;
		return accum;
	end gmul_2;
	
	function gmul (a : AES_Byte; g: AES_Byte) return AES_Byte is
	variable accum : AES_Byte;
	begin
		if g = x"01" then
			accum := a;
		elsif g = x"02" then
			accum := gmul_2(a);
		elsif g = x"03" then
			accum := gmul_2(a) xor a;
		elsif g = x"09" then
			accum := gmul_2(gmul_2(gmul_2(a))) xor a;
		elsif g = x"0b" then
			accum := gmul_2(gmul_2(gmul_2(a)) xor a) xor a;
		elsif g = x"0d" then
			accum := gmul_2(gmul_2(gmul_2(a) xor a)) xor a;
		elsif g = x"0e" then
			accum := gmul_2(gmul_2(gmul_2(a) xor a) xor a);
		end if;
		return accum;
	end gmul;
	function v2i (arg : AES_Byte) return AES_Int is
	begin
		return to_integer(unsigned(arg));
	end v2i;
	
	function i2v (arg : AES_Int) return AES_Byte is
	begin
		return std_logic_vector(to_unsigned(arg, 8));
	end i2v;
	
	function word_to_vector ( w: AES_Word) return AES_32 is
	variable accum : std_logic_vector(0 to 31);
	begin
		accum(0 to 7) := w(0);
		accum(8 to 15) := w(1);
		accum(16 to 23) := w(2);
		accum(24 to 31) := w(3);
		return accum;
	end word_to_vector;
	
	function vector_to_word (v : AES_32) return AES_Word is
	variable accum : AES_Word;
	begin
		accum(0) := v(0 to 7);
		accum(1) := v(8 to 15);
		accum(2) := v(16 to 23);
		accum(3) := v(24 to 31);
		return accum;
	end vector_to_word;
	
	-- function block_from_expkey (k : AES_ExpandedKey; i : AES_ExpandedKey_Index) return AES_Block is
	-- variable accum : AES_Block;
	-- begin
	-- 	accum(0) := k(i)(0);
	-- 	accum(1) := k(i)(1);
	-- 	accum(2) := k(i)(2);
	-- 	accum(3) := k(i)(3);
	-- 	return accum;
	-- end block_from_expkey;

	function inv_subs_byte ( b: AES_Byte) return AES_Byte is
	variable upper : std_logic_vector(0 to 3);
	variable lower : std_logic_vector(0 to 3);
	begin
		upper := b(0 to 3);
		lower := b(4 to 7);
		return SBOX_INV( to_integer(unsigned(upper)), to_integer(unsigned(lower)));
	end inv_subs_byte;
	
	function inv_subs_word ( w : AES_Word) return AES_Word is
	variable accum : AES_Word;
	begin
		accum(0) := inv_subs_byte(w(0));
		accum(1) := inv_subs_byte(w(1));
		accum(2) := inv_subs_byte(w(2));
		accum(3) := inv_subs_byte(w(3));
		return accum;
	end inv_subs_word;

	function inv_subs_block ( b :  AES_Block) return AES_Block is
	variable accum : AES_Block;
	begin
		for i in 0 to 3 loop
			accum(i) := inv_subs_word(b(i));
		end loop;
		return accum;
	end inv_subs_block;

	function inv_subs_block_s0 ( b :  AES_Block_S0) return AES_Block_S0 is
	variable accum : AES_Block_S0;
	begin
		accum(0) := inv_subs_word(b(0));
		accum(1) := inv_subs_word(b(1));
		return accum;
	end inv_subs_block_s0;

	function inv_subs_block_s1 ( b :  AES_Block_S1) return AES_Block_S1 is
	variable accum : AES_Block_S1;
	begin
		accum(2) := inv_subs_word(b(2));
		accum(3) := inv_subs_word(b(3));
		return accum;
	end inv_subs_block_s1;

	
	function subs_byte (b: AES_Byte) return AES_Byte is
	variable upper : std_logic_vector(0 to 3);
	variable lower : std_logic_vector(0 to 3);
	begin
		upper := b(0 to 3);
		lower := b(4 to 7);
		return SBOX( to_integer(unsigned(upper)), to_integer(unsigned(lower)));
	end subs_byte;
	
	function subs_word (w : AES_Word) return AES_Word is
	variable accum : AES_Word;
	begin
		accum(0) := subs_byte(w(0));
		accum(1) := subs_byte(w(1));
		accum(2) := subs_byte(w(2));
		accum(3) := subs_byte(w(3));
		return accum;
	end subs_word;

	function inv_shift_rows ( b : AES_Block) return AES_Block is
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

	function shift_row_indexes (inp : AES_IndexTuple) return AES_IndexTuple is
	variable result : AES_IndexTuple;
	begin
		
		if inp = (0,0) then
			result := (0,0);
		elsif inp = (1,1) then
			result := (0,1);
		elsif inp = (2,2) then
			result := (0,2);
		elsif inp = (3,3) then
			result := (0,3);

		elsif inp = (1,0) then
			 result := (1,0);
		elsif inp = (2,1) then
			 result := (1,1);
		elsif inp = (3,2) then
			 result := (1,2);
		elsif inp = (0,3) then
			 result := (1,3);

		elsif inp = (2, 0) then
			 result := (2,0);
		elsif inp = (3, 1) then
			 result := (2,1);
		elsif inp = (0, 2) then
			 result := (2,2);
		elsif inp = (1, 3) then
			 result := (2,3);			 																
	

		elsif inp = (3,0) then
			 result := (3,0);
		elsif inp = (0,1)  then
			 result := (3,1);
		elsif inp = (1,2)  then
			 result := (3,2);
		elsif inp = (2,3)  then
			 result := (3,3);
		end if ;
		return result;
	end shift_row_indexes;	
	
	function add_round_key (inp : AES_Block; key : AES_Block) return AES_Block is
	variable accum : AES_Block;
	begin
		for i in 0 to 3 loop
			for j in 0 to 3 loop
				accum(i)(j) := inp(i)(j) xor key(i)(j);
			end loop;
		end loop;
		return accum;
	end add_round_key;

	function add_round_key_s0 (inp : AES_Block_S0; key : AES_Block_S0) return AES_Block_S0 is
	variable accum : AES_Block_S0;
	begin
		for i in 0 to 1 loop
			for j in 0 to 3 loop
				accum(i)(j) := inp(i)(j) xor key(i)(j);
			end loop;
		end loop;
		return accum;
	end add_round_key_s0;
	
	function add_round_key_s1 (inp : AES_Block_S1; key : AES_Block_S1) return AES_Block_S1 is
	variable accum : AES_Block_S1;
	begin
		for i in 2 to 3 loop
			for j in 0 to 3 loop
				accum(i)(j) := inp(i)(j) xor key(i)(j);
			end loop;
		end loop;
		return accum;
	end add_round_key_s1;

	function xor_word ( a :AES_Word;  b: AES_Word) return AES_Word is
	variable accum : AES_Word;
	begin
		for i in 0 to 3 loop
			accum(i) := a(i) xor b(i);
		end loop;
		return accum;
	end xor_word;
	
	function inv_mix_column ( w: AES_Word) return AES_Word is
	variable accum : AES_Word;
	begin
		for i in 0 to 3 loop
			accum(i) := gmul(w(0), inv_mix_col_matrix(0)(i)) xor gmul(w(1), inv_mix_col_matrix(1)(i)) xor
							gmul(w(2), inv_mix_col_matrix(2)(i)) xor gmul(w(3), inv_mix_col_matrix(3)(i));
		end loop;
		return accum;
	end inv_mix_column;
	
	function inv_mix_column_block (w : AES_Block) return AES_Block is
	variable accum : AES_Block;
	begin
		for i in 0 to 3 loop
			accum(i) := inv_mix_column(w(i));
		end loop;
		return accum;
	end inv_mix_column_block;

	function inv_mix_column_block_s0 (w : AES_Block_S0) return AES_Block_S0 is
	variable accum : AES_Block_S0;
	begin
		for i in 0 to 1 loop
			accum(i) := inv_mix_column(w(i));
		end loop;
		return accum;
	end inv_mix_column_block_s0;
	
	function inv_mix_column_block_s1 (w : AES_Block_S1) return AES_Block_S1 is
	variable accum : AES_Block_S1;
	begin
		for i in 2 to 3 loop
			accum(i) := inv_mix_column(w(i));
		end loop;
		return accum;
	end inv_mix_column_block_s1;
	
	function rot_word (w : AES_Word) return AES_Word is
	variable accum : AES_Word;
	begin
		accum(0) := w(1);
		accum(1) := w(2);
		accum(2) := w(3);
		accum(3) := w(0);
		return accum;
	end rot_word;
	
	function key_expansion (cipher_key : AES_Block) return AES_ExpandedKey is
	variable expanded_key : AES_ExpandedKey;
	variable t : AES_Word;
	variable padded_rcons : AES_Word;
	begin
		expanded_key(0)(0) := cipher_key(0);
		expanded_key(0)(1) := cipher_key(1);
		expanded_key(0)(2) := cipher_key(2);
		expanded_key(0)(3) := cipher_key(3);
		
		for i in 1 to 10 loop
			padded_rcons := ( 0 => round_cons(i), others => x"00");
			t :=  xor_word( padded_rcons, subs_word(rot_word(expanded_key(i - 1)(3))));
			expanded_key(i)(0) := xor_word(t, expanded_key(i-1)(0));
			expanded_key(i)(1) := xor_word(expanded_key(i)(0), expanded_key(i-1)(1));
			expanded_key(i)(2) := xor_word(expanded_key(i)(1), expanded_key(i-1)(2));
			expanded_key(i)(3) := xor_word(expanded_key(i)(2),expanded_key(i-1)(3));			
		end loop;
		return expanded_key;
	end key_expansion;
	
		
end utils;
