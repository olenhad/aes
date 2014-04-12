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
		state : in AES_Block;
		key : in AES_Block;
		result : out AES_Block
	);
end aes_loop_iter;

architecture Behavioral of aes_loop_iter is

begin
process(state,key)
	variable cur_state : AES_Block;
	begin
		cur_state := inv_shift_rows(state);
		cur_state := inv_subs_block(cur_state);
		cur_state := add_round_key(cur_state, key);
		cur_state := inv_mix_column_block(cur_state);
		result <= cur_state;
	end process;

end Behavioral;

