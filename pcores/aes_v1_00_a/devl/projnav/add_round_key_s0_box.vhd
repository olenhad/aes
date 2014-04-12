----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:47:46 04/13/2014 
-- Design Name: 
-- Module Name:    add_round_key_s0_box - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
library aes_v1_00_a;
use aes_v1_00_a.utils.all;

entity add_round_key_s0_box is
port 
	(
		state : in AES_Block_S0;
		key : in AES_Block_S0;
		result : out AES_Block_S0
	);
end add_round_key_s0_box;

architecture add_round_key_s0_b of add_round_key_s0_box is	
begin
	result <= add_round_key_s0(state, key);
end  add_round_key_s0_b; -- add_round_key_s0_b