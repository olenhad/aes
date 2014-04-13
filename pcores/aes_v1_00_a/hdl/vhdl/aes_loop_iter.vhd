----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:31 04/12/2014 
-- Design Name: 
-- Module Name:    aes_loop_iter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library aes_v1_00_a;
use aes_v1_00_a.utils.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity aes_loop_iter is
port
	(
		clk : in std_logic;
		state : in AES_Block;
		key : in AES_Block;
		stage : in AES_Decrypt_Stage;
		result : out AES_Block;
		done : out std_logic
	);
end aes_loop_iter;

architecture Behavioral of aes_loop_iter is

-- component add_round_key_s0_box is
-- port 
-- 	(
-- 		state : in AES_Block_S0;
-- 		key : in AES_Block_S0;
-- 		result : out AES_Block_S0
-- 	);
-- end component;

-- signal add_round_key_s0_state : AES_Block_S0;
-- signal add_round_key_s0_key : AES_Block_S0;
-- signal add_round_key_s0_result : AES_Block_S0;

-- component add_round_key_s1_box is
-- port 
-- 	(
-- 		state : in AES_Block_S1;
-- 		key : in AES_Block_S1;
-- 		result : out AES_Block_S1
-- 	);
-- end component;

-- signal add_round_key_s1_state : AES_Block_S1;
-- signal add_round_key_s1_key : AES_Block_S1;
-- signal add_round_key_s1_result : AES_Block_S1;

component add_round_key_box is
port 
	(
		state : in AES_Block;
		key : in AES_Block;
		result : out AES_Block
	);
end component;

signal add_round_key_state : AES_Block;
signal add_round_key_key : AES_Block;
signal add_round_key_result : AES_Block;


-- component inv_subs_box_s0 is
--   port (
-- 	state : in AES_Block_S0;
-- 	result : out AES_Block_S0	
--   ) ;
-- end component ; -- inv_subs_box

-- signal inv_subs_box_s0_state : AES_Block_S0;
-- signal inv_subs_box_s0_result : AES_Block_S0;

-- component inv_subs_box_s1 is
--   port (
-- 	state : in AES_Block_S1;
-- 	result : out AES_Block_S1	
--   ) ;
-- end component ; -- inv_subs_box


component inv_subs_box is
  port (
	state : in AES_Block;
	result : out AES_Block	
  ) ;
end component ; -- inv_subs_box

signal inv_subs_box_state : AES_Block;
signal inv_subs_box_result : AES_Block;

component inv_mix_cols_box is
  port (
	state: in AES_Block;
	result : out AES_Block
  ) ;
end component ;

signal inv_mix_cols_box_state : AES_Block;
signal inv_mix_cols_box_result : AES_Block;


component inv_shift_rows_box is
  port (
	state: in AES_Block;
	result : out AES_Block
  ) ;
end component ; -- inv_shift_rows_box

signal inv_shift_rows_state : AES_Block;
signal inv_shift_rows_result : AES_Block;

signal iter_stage : AES_Stage := 0;

begin
subs_box : inv_subs_box port map (inv_subs_box_state,inv_subs_box_result);

round_key_box: add_round_key_box port map (add_round_key_state, add_round_key_key, add_round_key_result);

mix_cols : inv_mix_cols_box port map (inv_mix_cols_box_state, inv_mix_cols_box_result);

shift_rows : inv_shift_rows_box port map (inv_shift_rows_state, inv_shift_rows_result);

process(clk)
variable cur_state : AES_Block;

	begin
		if rising_edge(clk) then

			

			if stage = DecryptReset then
					cur_state := state;
					-- inv_subs_box_state <= state;

					add_round_key_state <= state;
					add_round_key_key <= key;
					done <= '0';
					--inv_mix_cols_box_state <= state;

					--inv_shift_rows_state <= state;
		

			elsif stage = DecryptInitial then
				
					result <= add_round_key_result;
					cur_state := add_round_key_result;
					done <= '1';
					
					-- next state setup
					inv_shift_rows_state <= cur_state;
					iter_stage <= 0;

			elsif stage = DecryptNineLoop then
				case iter_stage is
					when 0 =>
						cur_state := inv_shift_rows_result;
						inv_subs_box_state <= cur_state;						
						iter_stage <= 1;
						done <= '0';
					when 1 =>
						cur_state := inv_subs_box_result;
						add_round_key_state <= cur_state;
						add_round_key_key <= key;
						
						iter_stage <= 2;
						done <= '0';
					when 2 =>
						cur_state := add_round_key_result;
						inv_mix_cols_box_state <= cur_state;
						iter_stage <= 3;
						done <= '0';
					when 3 =>
						cur_state := inv_mix_cols_box_result;

						inv_shift_rows_state <= cur_state;

						iter_stage <= 0;
						done <= '1';
						result <= cur_state;
					-- TODO fit shiftrows here. PLIS
				end case ;
			elsif stage = DecryptEnd then
				case iter_stage is
					when 0 =>
						cur_state := inv_shift_rows_result;
						inv_subs_box_state <= cur_state;

						iter_stage <= 1;
						done <= '0';
					when 1 =>
						cur_state := inv_subs_box_result;
						add_round_key_state <= cur_state;
						add_round_key_key <= key;
						iter_stage <= 2;
						done <= '0';
					when 2 =>

						cur_state := add_round_key_result;
						iter_stage <= 0;
						done <= '1';
						result <= cur_state;
						
					when others =>
					
				end case;		
			end if;
		-- cur_state := state
		-- --cur_state := inv_shift_rows(state);
		-- cur_state := inv_subs_block(cur_state);
		-- cur_state := add_round_key(cur_state, key);
		-- cur_state := inv_mix_column_block(cur_state);
		-- result <= cur_state;
		end if;
	end process;

end Behavioral;

