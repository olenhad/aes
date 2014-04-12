----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:00:21 04/13/2014 
-- Design Name: 
-- Module Name:    inv_subs_box_s0 - Behavioral 
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
entity inv_subs_box_s0 is
  port (
	state : in AES_Block_S0;
	result : out AES_Block_S0	
  ) ;
end entity ; -- inv_subs_box

architecture arch of inv_subs_box_s0 is
begin
result <= inv_subs_block_s0(state);
end architecture ; -- arch


