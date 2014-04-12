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

architecture EXAMPLE of aes is
	
	type INPUT_TYPE is (InputIdle, InputKey, InputState, InputStart);

 	signal cypher_key : AES_Block := 
 	(
 	0 => ( 0 => x"00", 1 => x"01", 2 => x"02", 3 => x"03"), 
 	1 => ( 0 => x"04", 1 => x"05", 2 => x"06", 3 => x"07"), 
 	2 => ( 0 => x"08", 1 => x"09", 2 => x"0a", 3 => x"0b"), 
 	3 => ( 0 => x"0c", 1 => x"0d", 2 => x"0e", 3 => x"0f"));
	
	signal decrypt_input: AES_Block;
	signal enable_decrypt : std_logic := '0';
	signal decryption_finished : std_logic := '0';
	signal decrypt_result : AES_Block;
	signal control_index : Integer range 0 to 3 := 0;
	signal enable_output : std_logic := '0';

	-- signal verify_decrypt : AES_Block := 
	-- (
	-- 0 => (0 => x"03", 1 => x"05", 2 => x"07", 3 => x"03"),
	-- 1 => (0 => x"00", 1 => x"05", 2 => x"66", 3 => x"77"),
	-- 2 => (0 => x"88", 1 => x"99", 2 => x"aa", 3 => x"bb"), 
	-- 3 => (0 => x"cc", 1 => x"dd", 2 => x"ee", 3 => x"ff")
	-- );
	-- signal test_decrypt_result : AES_Block;
	-- signal test_decrypt_input : AES_Block := 
	-- (
	-- 0  => (0 => x"12", 1 => x"c4", 2 => x"97", 3 => x"c5"), 
	-- 1  => (0 => x"6f", 1 => x"b4", 2 => x"b8", 3 => x"f4"), 
	-- 2  => (0 => x"d1", 1 => x"1f", 2 => x"ed", 3 => x"9d"), 
	-- 3  => (0 => x"3e", 1 => x"c3", 2 => x"a4", 3 => x"ce")
	-- );
	component aes_loop_iter is
	port
		(
			state : in AES_Block;
			key : in AES_Block;
			result : out AES_Block
		);
	end component;
	
	signal loop_iter_state : AES_Block;
	signal loop_iter_key : AES_Block;
	signal loop_iter_result : AES_Block;
	
begin
	loop_iter: aes_loop_iter port map (state => loop_iter_state,
												  key => loop_iter_key,
												  result => loop_iter_result);
   -- CAUTION:
   -- The sequence in which data are read in and written out should be
   -- consistent with the sequence they are written and read in the
   -- driver's aes.c file

   FSL_S_Read  <= FSL_S_Exists ;
   FSL_M_Write <= enable_output;

  
	--inter <= inv_subs_word(test_word);
	--FSL_M_Data <= word_to_vector(inter);
	
	FSL_M_Data <= word_to_vector(decrypt_result(control_index));
	
   The_SW_accelerator : process (FSL_Clk) is
	variable step_num : Integer range 0 to 11 := 0;
	variable state : AES_Block;	
   variable expanded_key : AES_ExpandedKey;	
	variable postAdd : AES_Block;

	variable input_state : INPUT_TYPE := InputIdle;
	
	
	begin  -- process The_SW_accelerator
	
	
    if FSL_Clk'event and FSL_Clk = '1' then 
			 
    -- Rising clock edge
      if FSL_Rst = '1' then               -- Synchronous reset (active high)
         -- CAUTION: make sure your reset polarity is consistent with the
         -- system reset polarity
			input_state := InputIdle;
			enable_output <= '0';
      else
			if enable_output = '1' then
				enable_output <= '0';
			end if;
			
			if FSL_S_Control = '1' then
				control_index <= to_integer(unsigned(FSL_S_Data(30 to 31)));
				
				if FSL_S_Data(29) = '1' then
					input_state := InputKey;
				
				elsif FSL_S_Data(28) = '1' then
					input_state := InputState;
				
				elsif FSL_S_Data(27) = '1' then
					input_state := InputStart;
				end if;
			else
				case input_state is
					when InputIdle =>
					-- do nothing
					when InputKey =>
						cypher_key(control_index) <= vector_to_word(FSL_S_Data);
					when InputState =>
						decrypt_input(control_index) <= vector_to_word(FSL_S_Data);	
					when InputStart =>
						enable_decrypt <= '1';
				end case;
			end if;
		
			if (enable_decrypt = '1') then
				if (step_num = 0) then
					expanded_key := key_expansion(cypher_key);	
					state := add_round_key(decrypt_input, block_from_expkey(expanded_key,10));
					step_num := 1;
					
					loop_iter_state <= state;
					loop_iter_key <= block_from_expkey(expanded_key, 9);
				
				elsif (step_num = 1) then
				
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 8);
					step_num := step_num + 1;
				elsif (step_num = 2) then
				 
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 7);
					step_num := step_num + 1;
					
				elsif (step_num = 3) then
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 6);
					step_num := step_num + 1;
				elsif (step_num = 4) then
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 5);
					step_num := step_num + 1;
				elsif (step_num = 5) then
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 4);
					step_num := step_num + 1;
				elsif (step_num = 6) then
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 3);
					step_num := step_num + 1;
				elsif (step_num = 7) then
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 2);
					step_num := step_num + 1;
				elsif (step_num = 8) then
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 1);
					step_num := step_num + 1;
				elsif (step_num = 9) then
					loop_iter_state <= loop_iter_result;
					loop_iter_key <= block_from_expkey(expanded_key, 0);
					step_num := step_num + 1;
				else 
					state := inv_shift_rows(loop_iter_state);
					state := inv_subs_block(state);
					state := add_round_key(state, loop_iter_key);
				 	decrypt_result <= state;
					decryption_finished <= '1';
					enable_output <= '1';
							
				end if;
			
			end if;
			
       end if;
    end if;
   end process The_SW_accelerator;
end architecture EXAMPLE;
