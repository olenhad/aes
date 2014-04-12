library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library aes_v1_00_a;
use aes_v1_00_a.utils.all;

entity add_round_key_box is
  port (
	state : in AES_Block;
	key : in AES_Block;
	result : out AES_Block
  ) ;
end entity ; -- add_round_key_box

architecture arch of add_round_key_box is
begin
result <= add_round_key(state, key);
end architecture ; -- arch