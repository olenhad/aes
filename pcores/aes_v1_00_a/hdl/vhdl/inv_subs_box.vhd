library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library aes_v1_00_a;
use aes_v1_00_a.utils.all;

entity inv_subs_box is
  port (
	state : in AES_Block;
	result : out AES_Block	
  ) ;
end entity ; -- inv_subs_box

architecture arch of inv_subs_box is
begin
result <= inv_subs_block(state);
end architecture ; -- arch