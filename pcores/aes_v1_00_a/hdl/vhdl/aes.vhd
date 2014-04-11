------------------------------------------------------------------------------
-- aes - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          aes
-- Version:           1.00.a
-- Description:       Example FSL core (VHDL).
-- Date:              Thu Apr 10 01:52:46 2014 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library aes_v1_00_a;
use aes_v1_00_a.utils.all;
-------------------------------------------------------------------------------------
--
--
-- Definition of Ports
-- FSL_Clk             : Synchronous clock
-- FSL_Rst           : System reset, should always come from FSL bus
-- FSL_S_Clk       : Slave asynchronous clock
-- FSL_S_Read      : Read signal, requiring next available input to be read
-- FSL_S_Data      : Input data
-- FSL_S_CONTROL   : Control Bit, indicating the input data are control word
-- FSL_S_Exists    : Data Exist Bit, indicating data exist in the input FSL bus
-- FSL_M_Clk       : Master asynchronous clock
-- FSL_M_Write     : Write signal, enabling writing to output FSL bus
-- FSL_M_Data      : Output data
-- FSL_M_Control   : Control Bit, indicating the output data are contol word
-- FSL_M_Full      : Full Bit, indicating output FSL bus is full
--
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Entity Section
------------------------------------------------------------------------------

entity aes is
	port 
	(
		-- DO NOT EDIT BELOW THIS LINE ---------------------
		-- Bus protocol ports, do not add or delete. 
		FSL_Clk	: in	std_logic;
		FSL_Rst	: in	std_logic;
		FSL_S_Clk	: in	std_logic;
		FSL_S_Read	: out	std_logic;
		FSL_S_Data	: in	std_logic_vector(0 to 31);
		FSL_S_Control	: in	std_logic;
		FSL_S_Exists	: in	std_logic;
		FSL_M_Clk	: in	std_logic;
		FSL_M_Write	: out	std_logic;
		FSL_M_Data	: out	std_logic_vector(0 to 31);
		FSL_M_Control	: out	std_logic;
		FSL_M_Full	: in	std_logic
		-- DO NOT EDIT ABOVE THIS LINE ---------------------
	);

attribute SIGIS : string; 
attribute SIGIS of FSL_Clk : signal is "Clk"; 
attribute SIGIS of FSL_S_Clk : signal is "Clk"; 
attribute SIGIS of FSL_M_Clk : signal is "Clk"; 

end aes;

------------------------------------------------------------------------------
-- Architecture Section
------------------------------------------------------------------------------

-- In this section, we povide an example implementation of ENTITY aes
-- that does the following:
--
-- 1. Read all inputs
-- 2. Add each input to the contents of register 'sum' which
--    acts as an accumulator
-- 3. After all the inputs have been read, write out the
--    content of 'sum' into the output FSL bus NUMBER_OF_OUTPUT_WORDS times
--
-- You will need to modify this example or implement a new architecture for
-- ENTITY aes to implement your coprocessor

architecture EXAMPLE of aes is

   -- Total number of input data.
   constant NUMBER_OF_INPUT_WORDS  : natural := 4;

   -- Total number of output data
   constant NUMBER_OF_OUTPUT_WORDS : natural := 4;

   type STATE_TYPE is (Idle, Read_Inputs, Write_Outputs);

   signal fsl_state        : STATE_TYPE;

   -- Accumulator to hold sum of inputs read at any point in time
   signal sum          : std_logic_vector(0 to 31);

   -- Counters to store the number inputs read & outputs written
   signal nr_of_reads  : natural range 0 to NUMBER_OF_INPUT_WORDS - 1;
   signal nr_of_writes : natural range 0 to NUMBER_OF_OUTPUT_WORDS - 1;
	
-- 	signal test : AES_Byte := x"50";
-- 	signal test_word : AES_Word := (0 => x"50", 1 => x"52", 2 => x"53", 3 => x"54");
-- 	signal inter : AES_Word;
-- 	signal test_block : AES_Block :=
-- 	(0 => (0 => x"00", 1 => x"01", 2 => x"02", 3 => x"03"),
-- 	1 => (0 => x"04", 1 => x"05", 2 => x"06", 3 => x"07"),
-- 	2 => (0 => x"08", 1 => x"09", 2 => x"0a", 3 => x"0b"),
-- 	3 => (0 => x"0c", 1 => x"0d", 2 => x"0e", 3 => x"0f"));
-- 	signal result_block : AES_Block;
-- 	signal verify_block : AES_Block :=
-- 	(0 => (0 => x"00", 1 => x"0d", 2 => x"0a", 3 => x"07"),
--  1 => (0 => x"04", 1 => x"01", 2 => x"0e", 3 => x"0b"),
--  2 => (0 => x"08", 1 => x"05", 2 => x"02", 3 => x"0f"),
--  3 => (0 => x"0c", 1 => x"09", 2 => x"06", 3 => x"03"));
 
-- 	signal inp_mix_col : AES_Word := (0 => x"01", 1 => x"01", 2 => x"01", 3 => x"01");
-- 	signal verify_mix_col : AES_Word := (0 => x"2f", 1 => x"2f", 2 => x"2f", 3 => x"2f");
	
-- 	signal test_mix_col: AES_Word;
	
 	signal cypher_key : AES_Block := 
 	(
 	0 => ( 0 => x"00", 1 => x"01", 2 => x"02", 3 => x"03"), 
 	1 => ( 0 => x"04", 1 => x"05", 2 => x"06", 3 => x"07"), 
 	2 => ( 0 => x"08", 1 => x"09", 2 => x"0a", 3 => x"0b"), 
 	3 => ( 0 => x"0c", 1 => x"0d", 2 => x"0e", 3 => x"0f"));
	
-- 	signal test_key_expand : AES_ExpandedKey ;
	signal verify_key_expand : AES_ExpandedKey := 
	(
0 => (
	0 => ( 0 => x"00", 1 => x"01", 2 => x"02", 3 => x"03"), 
	1 => ( 0 => x"04", 1 => x"05", 2 => x"06", 3 => x"07"), 
	2 => ( 0 => x"08", 1 => x"09", 2 => x"0a", 3 => x"0b"), 
	3 => ( 0 => x"0c", 1 => x"0d", 2 => x"0e", 3 => x"0f")),

1 => (
	0 => ( 0 => x"d6", 1 => x"aa", 2 => x"74", 3 => x"fd"), 
	1 => ( 0 => x"d2", 1 => x"af", 2 => x"72", 3 => x"fa"), 
	2 => ( 0 => x"da", 1 => x"a6", 2 => x"78", 3 => x"f1"), 
	3 => ( 0 => x"d6", 1 => x"ab", 2 => x"76", 3 => x"fe")),

2 => (
	0 => ( 0 => x"b6", 1 => x"92", 2 => x"cf", 3 => x"0b"), 
	1 => ( 0 => x"64", 1 => x"3d", 2 => x"bd", 3 => x"f1"), 
	2 => ( 0 => x"be", 1 => x"9b", 2 => x"c5", 3 => x"00"), 
	3 => ( 0 => x"68", 1 => x"30", 2 => x"b3", 3 => x"fe")),

3 => (
	0 => ( 0 => x"b6", 1 => x"ff", 2 => x"74", 3 => x"4e"), 
	1 => ( 0 => x"d2", 1 => x"c2", 2 => x"c9", 3 => x"bf"), 
	2 => ( 0 => x"6c", 1 => x"59", 2 => x"0c", 3 => x"bf"), 
	3 => ( 0 => x"04", 1 => x"69", 2 => x"bf", 3 => x"41")),

4 => (
	0 => ( 0 => x"47", 1 => x"f7", 2 => x"f7", 3 => x"bc"), 
	1 => ( 0 => x"95", 1 => x"35", 2 => x"3e", 3 => x"03"), 
	2 => ( 0 => x"f9", 1 => x"6c", 2 => x"32", 3 => x"bc"), 
	3 => ( 0 => x"fd", 1 => x"05", 2 => x"8d", 3 => x"fd")),

5 => (
	0 => ( 0 => x"3c", 1 => x"aa", 2 => x"a3", 3 => x"e8"), 
	1 => ( 0 => x"a9", 1 => x"9f", 2 => x"9d", 3 => x"eb"), 
	2 => ( 0 => x"50", 1 => x"f3", 2 => x"af", 3 => x"57"), 
	3 => ( 0 => x"ad", 1 => x"f6", 2 => x"22", 3 => x"aa")), 

6 => (
	0 => ( 0 => x"5e", 1 => x"39", 2 => x"0f", 3 => x"7d"), 
	1 => ( 0 => x"f7", 1 => x"a6", 2 => x"92", 3 => x"96"), 
	2 => ( 0 => x"a7", 1 => x"55", 2 => x"3d", 3 => x"c1"), 
	3 => ( 0 => x"0a", 1 => x"a3", 2 => x"1f", 3 => x"6b")), 

7 => (
	0 => ( 0 => x"14", 1 => x"f9", 2 => x"70", 3 => x"1a"), 
	1 => ( 0 => x"e3", 1 => x"5f", 2 => x"e2", 3 => x"8c"), 
	2 => ( 0 => x"44", 1 => x"0a", 2 => x"df", 3 => x"4d"), 
	3 => ( 0 => x"4e", 1 => x"a9", 2 => x"c0", 3 => x"26")), 

8 => (
	0 => ( 0 => x"47", 1 => x"43", 2 => x"87", 3 => x"35"), 
	1 => ( 0 => x"a4", 1 => x"1c", 2 => x"65", 3 => x"b9"), 
	2 => ( 0 => x"e0", 1 => x"16", 2 => x"ba", 3 => x"f4"), 
	3 => ( 0 => x"ae", 1 => x"bf", 2 => x"7a", 3 => x"d2")), 

9 => (
	0 => ( 0 => x"54", 1 => x"99", 2 => x"32", 3 => x"d1"), 
	1 => ( 0 => x"f0", 1 => x"85", 2 => x"57", 3 => x"68"), 
	2 => ( 0 => x"10", 1 => x"93", 2 => x"ed", 3 => x"9c"), 
	3 => ( 0 => x"be", 1 => x"2c", 2 => x"97", 3 => x"4e")),

10 => (
	0 => ( 0 => x"13", 1 => x"11", 2 => x"1d", 3 => x"7f"), 
	1 => ( 0 => x"e3", 1 => x"94", 2 => x"4a", 3 => x"17"), 
	2 => ( 0 => x"f3", 1 => x"07", 2 => x"a7", 3 => x"8b"), 
	3 => ( 0 => x"4d", 1 => x"2b", 2 => x"30", 3 => x"c5")));
	
	--signal expanded_key : AES_ExpandedKey;	
	signal verify_decrypt : AES_Block := 
	(
	0 => (0 => x"03", 1 => x"05", 2 => x"07", 3 => x"03"),
	1 => (0 => x"00", 1 => x"05", 2 => x"66", 3 => x"77"),
	2 => (0 => x"88", 1 => x"99", 2 => x"aa", 3 => x"bb"), 
	3 => (0 => x"cc", 1 => x"dd", 2 => x"ee", 3 => x"ff")
	);
	signal test_decrypt_result : AES_Block;
	signal test_decrypt_input : AES_Block := 
	(
	0  => (0 => x"12", 1 => x"c4", 2 => x"97", 3 => x"c5"), 
	1  => (0 => x"6f", 1 => x"b4", 2 => x"b8", 3 => x"f4"), 
	2  => (0 => x"d1", 1 => x"1f", 2 => x"ed", 3 => x"9d"), 
	3  => (0 => x"3e", 1 => x"c3", 2 => x"a4", 3 => x"ce")
	);
	
begin
   -- CAUTION:
   -- The sequence in which data are read in and written out should be
   -- consistent with the sequence they are written and read in the
   -- driver's aes.c file

   FSL_S_Read  <= FSL_S_Exists   when fsl_state = Read_Inputs   else '0';
   FSL_M_Write <= not FSL_M_Full when fsl_state = Write_Outputs else '0';

  
	--inter <= inv_subs_word(test_word);
	--FSL_M_Data <= word_to_vector(inter);
	
   The_SW_accelerator : process (FSL_Clk) is
	variable step_num : Integer range 0 to 11 := 0;

	variable state : AES_Block;	
   
	begin  -- process The_SW_accelerator

	--result_block <= inv_shift_rows(test_block);
	--assert (result_block = verify_block) report "inv_shift_row failed!!!" severity warning;
	
	--test_mix_col <= inv_mix_column(inp_mix_col);
	--assert (test_mix_col = verify_mix_col) report "inv_mix_col failed!!!" severity warning;
	
	--test_key_expand <= key_expansion(cypher_key);
	--assert (test_key_expand = verify_key_expand) report "key exp fucked!!!!" severity warning;
	
	
	
    if FSL_Clk'event and FSL_Clk = '1' then 
			 FSL_M_Data <= word_to_vector(inv_mix_column_block(test_decrypt_input)(nr_of_writes));
			 nr_of_writes <= (nr_of_writes + 1) mod 4;
    -- Rising clock edge
      -- if FSL_Rst = '1' then               -- Synchronous reset (active high)
      --   -- CAUTION: make sure your reset polarity is consistent with the
      --   -- system reset polarity
      --   fsl_state        <= Idle;
      --   nr_of_reads  <= 0;
      --   nr_of_writes <= 0;
      --   sum          <= (others => '0');
      -- else
		
		-- if (step_num = 0) then
		-- 			--expanded_key <= key_expansion(cypher_key);	
		-- 			step_num := 1;
		-- 		elsif (step_num = 1) then
		-- 			state := add_round_key(test_decrypt_input, verify_key_expand(10));
		-- 			step_num := 2;
		-- 		elsif (step_num > 1 and step_num <= 9) then
		-- 			state := inv_shift_rows(state);
		-- 			state := inv_subs_block(state);
		-- 			state := add_round_key(state, verify_key_expand(10 - step_num));
		-- 			state := inv_mix_column_block(state);
		-- 			step_num := step_num + 1;
		-- 		else 
		-- 			state := inv_shift_rows(state);
		-- 			state := inv_subs_block(state);
		-- 			state := add_round_key(state, verify_key_expand(0));
		-- 			--result <= state;
		-- 			 FSL_M_Data <= word_to_vector(state(0));
		-- 			--assert (state = verify_decrypt) report "DECRYPT DOESNT WORK  :(" severity warning;
		-- 			step_num := 0;
					
		-- 		end if;
	
		

      --   case fsl_state is
      --     when Idle =>
      --       if (FSL_S_Exists = '1') then
      --         fsl_state       <= Read_Inputs;
      --         nr_of_reads <= NUMBER_OF_INPUT_WORDS - 1;
      --         sum         <= (others => '0');
      --       end if;

      --     when Read_Inputs =>
      --       if (FSL_S_Exists = '1') then
      --         -- Coprocessor function (Adding) happens here
      --         sum         <= std_logic_vector(unsigned(sum) + unsigned(FSL_S_Data));
      --         if (nr_of_reads = 0) then
      --           fsl_state        <= Write_Outputs;
      --           nr_of_writes <= NUMBER_OF_OUTPUT_WORDS - 1;
      --         else
      --           nr_of_reads <= nr_of_reads - 1;
      --         end if;
      --       end if;

      --     when Write_Outputs =>
      --       if (nr_of_writes = 0) then
      --         fsl_state <= Idle;
      --       else
      --         if (FSL_M_Full = '0') then
      --           nr_of_writes <= nr_of_writes - 1;
      --         end if;
      --       end if;
      --   end case;
      -- end if;
    end if;
   end process The_SW_accelerator;
end architecture EXAMPLE;
