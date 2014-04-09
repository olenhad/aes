-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT aes is
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
   END COMPONENT;

	signal	FSL_Clk   	:            std_logic;
	signal 	FSL_Rst	   : 	           std_logic;
		signal FSL_S_Clk   	:            std_logic;
		signal FSL_S_Read	   :             std_logic;
		signal FSL_S_Data   	:            std_logic_vector(0 to 31);
		signal FSL_S_Control   	:            std_logic;
		signal FSL_S_Exists   	:            std_logic;
		signal FSL_M_Clk   	:            std_logic;
		signal FSL_M_Write	   :             std_logic;
		signal FSL_M_Data	   :             std_logic_vector(0 to 31);
		signal FSL_M_Control	   :             std_logic;
		signal FSL_M_Full   	:            std_logic;
		
   constant CLK_period : time := 10 ns;

  BEGIN

  -- Component Instantiation
          uut: aes PORT MAP(
			FSL_Clk  => FSL_Clk,
			FSL_Rst	   => FSL_Rst,
			FSL_S_Clk   	=> FSL_S_Clk,
			FSL_S_Read	  => FSL_S_Read,
			FSL_S_Data   => FSL_S_Data ,
			FSL_S_Control=> FSL_S_Control,
			FSL_S_Exists => FSL_S_Exists,
			FSL_M_Clk   	=> FSL_M_Clk,
			FSL_M_Write	 => FSL_M_Write,
			FSL_M_Data	  => FSL_M_Data,
			FSL_M_Control=> FSL_M_Control,
			FSL_M_Full       => FSL_M_Full
          );



   CLK_process :process
   begin
		FSL_Clk <= '0';
		wait for CLK_period/2;
		FSL_Clk <= '1';
		wait for CLK_period/2;
   end process;

  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for CLK_period*5; -- wait until global set/reset completes

        -- Add user defined stimulus here


        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
