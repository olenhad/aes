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

component add_round_key_s0_box is
port 
	(
		state : in AES_Block_S0;
		key : in AES_Block_S0;
		result : out AES_Block_S0
	);
end component;

signal add_round_key_s0_state : AES_Block_S0;
signal add_round_key_s0_key : AES_Block_S0;
signal add_round_key_s0_result : AES_Block_S0;

component add_round_key_s1_box is
port 
	(
		state : in AES_Block_S1;
		key : in AES_Block_S1;
		result : out AES_Block_S1
	);
end component;

signal add_round_key_s1_state : AES_Block_S1;
signal add_round_key_s1_key : AES_Block_S1;
signal add_round_key_s1_result : AES_Block_S1;

component inv_subs_box_s0 is
  port (
	state : in AES_Block_S0;
	result : out AES_Block_S0	
  ) ;
end component ; -- inv_subs_box

signal inv_subs_box_s0_state : AES_Block_S0;
signal inv_subs_box_s0_result : AES_Block_S0;

component inv_subs_box_s1 is
  port (
	state : in AES_Block_S1;
	result : out AES_Block_S1	
  ) ;
end component ; -- inv_subs_box

signal inv_subs_box_s1_state : AES_Block_S1;
signal inv_subs_box_s1_result : AES_Block_S1;

signal iter_stage : AES_Stage := 0;

begin
subs_box_s0 : inv_subs_box_s0 port map (inv_subs_box_s0_state,inv_subs_box_s0_result);
subs_box_s1 : inv_subs_box_s1 port map (inv_subs_box_s1_state, inv_subs_box_s1_result);
round_key_box_s0 : add_round_key_s0_box port map (add_round_key_s0_state, add_round_key_s0_key, add_round_key_s0_result);
round_key_box_s1 : add_round_key_s1_box port map (add_round_key_s1_state, add_round_key_s1_key, add_round_key_s1_result);

process(clk)
	variable cur_state : AES_Block;
	variable cur_state0 : AES_Block_S0;
	variable cur_state1 : AES_Block_S1;
	variable key0 : AES_Block_S0;
	variable key1 : AES_Block_S1;
	begin
		if rising_edge(clk) then
			cur_state0(0) := state(0);
			cur_state0(1) := state(1);


			key0(0) := key(0);
			key0(1) := key(1);

			inv_subs_box_s0_state <= cur_state0;
			add_round_key_s0_state <= cur_state0;
			add_round_key_s0_key <= key0;

			cur_state1(2) := state(2);
			cur_state1(3) := state(3);
		
			key1(2) := key(2);
			key1(3) := key(3);

			inv_subs_box_s1_state <= cur_state1;
			add_round_key_s1_state <= cur_state1;
			add_round_key_s1_key <= key1;

			if stage = DecryptInitial then

				result(0) <= add_round_key_s0_result(0);
				result(1) <= add_round_key_s0_result(1);
				result(2) <= add_round_key_s1_result(2);
				result(3) <= add_round_key_s1_result(3);
				done <= '1';
			elsif stage = DecryptNineLoop then
				
				case iter_stage is
				
					when 0 =>
					-- TODO fit shiftrows here. PLIS
						cur_state0 := inv_subs_box_s0_result; -- inv_subs_block_s0(cur_state0);
						cur_state0 := add_round_key_s0_result; --add_round_key_s0(cur_state0, key0);		
						cur_state0 := inv_mix_column_block_s0(cur_state0);
						iter_stage <= 1;
						done <= '0';
					when 1 =>
					-- TODO fit shiftrows here. PLIS. HERE TOOO
						cur_state1 := inv_subs_box_s1_result; --inv_subs_block_s1(cur_state1);
						cur_state1 := add_round_key_s1_result; -- add_round_key_s1(cur_state1, key1);		
						cur_state1 := inv_mix_column_block_s1(cur_state1);

						result(0) <= cur_state0(0);
						result(1) <= cur_state0(1);

						result(2) <= cur_state1(2);
						result(3) <= cur_state1(3);

						done <= '1';
						iter_stage <= 0;
				end case ;
			elsif stage = DecryptEnd then
				case iter_stage is
					when 0 =>
					-- TODO fit shiftrows here. PLIS. HERE TOOO
						cur_state0 := inv_subs_box_s0_result; -- inv_subs_block_s0(cur_state0);
						cur_state0 := add_round_key_s0_result; --add_round_key_s0(cur_state0, key0);		
						iter_stage <= 1;
						done <= '0';
					when 1 =>
						cur_state1 := inv_subs_box_s1_result; --inv_subs_block_s1(cur_state1);
						cur_state1 := add_round_key_s1_result; -- add_round_key_s1(cur_state1, key1);		

						result(0) <= cur_state0(0);
						result(1) <= cur_state0(1);

						result(2) <= cur_state1(2);
						result(3) <= cur_state1(3);

						done <= '1';
						iter_stage <= 0;
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

