-- Company: 
-- Engineer:
--
-- Create Date:   09:31:34 07/13/2025
-- Design Name:   
-- Module Name:   /home/ise/Single_Port_Ram/singleportRAM_tb.vhd
-- Project Name:  Single_Port_Ram
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: singleportram
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY singleportRAM_tb IS
END singleportRAM_tb;
 
ARCHITECTURE behavior OF singleportRAM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT singleportram
    PORT(
         RAM_Addr : IN  std_logic_vector(6 downto 0);
         RAM_Data_in : IN  std_logic_vector(7 downto 0);
         RAM_WR : IN  std_logic;
         RAM_Clk : IN  std_logic;
         RAM_Data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RAM_Addr : std_logic_vector(6 downto 0) := (others => '0');
   signal RAM_Data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal RAM_WR : std_logic := '0';
   signal RAM_Clk : std_logic := '0';

 	--Outputs
   signal RAM_Data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant RAM_Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: singleportram PORT MAP (
          RAM_Addr => RAM_Addr,
          RAM_Data_in => RAM_Data_in,
          RAM_WR => RAM_WR,
          RAM_Clk => RAM_Clk,
          RAM_Data_out => RAM_Data_out
        );

   -- Clock process definitions
   RAM_Clk_process :process
   begin
		RAM_Clk <= '0';
		wait for RAM_Clk_period/2;
		RAM_Clk <= '1';
		wait for RAM_Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      RAM_WR<='0';
		RAM_Addr<="0000000";
		RAM_Data_in<=x"FF";
	
      wait for 100 ns;	
      for i in 0 to 5 loop
		RAM_Addr<=RAM_Addr+"0000001";
      wait for RAM_Clk_period*5;
      end loop;
		RAM_Addr<="0000000";
		RAM_WR<='1';
		wait for 100 ns;
		for i in 0 to 5 loop
		RAM_Addr<=RAM_Addr+"0000001";
		RAM_Data_in<=RAM_Data_in-x"01";
		wait for RAM_Clk_period*5;
		end loop;
		RAM_WR<='0';
		
      wait;
   end process;

END;
