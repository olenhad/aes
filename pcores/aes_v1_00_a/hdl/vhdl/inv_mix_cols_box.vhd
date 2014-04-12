library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library aes_v1_00_a;
use aes_v1_00_a.utils.all;

entity inv_mix_cols_box is
  port (
	state: in AES_Block;
	result : out AES_Block
  ) ;
end entity ; -- inv_mix_cols_box

architecture arch of inv_mix_cols_box is

begin

result <= inv_mix_column_block(state);

end architecture ; -- arch