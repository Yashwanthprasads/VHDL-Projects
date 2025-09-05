----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:05 07/13/2025 
-- Design Name: 
-- Module Name:    DualportRAM - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DualportRAM_TB IS
END DualportRAM_TB;
 
ARCHITECTURE behavior OF DualportRAM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DualportRAM
    PORT(
         Clk : IN  std_logic;
         WR_EN : IN  std_logic;
         Data_in : IN  std_logic_vector(7 downto 0);
         Addr_in_0 : IN  std_logic_vector(3 downto 0);
         Addr_in_1 : IN  std_logic_vector(3 downto 0);
         port_en_0 : IN  std_logic;
         port_en_1 : IN  std_logic;
         Data_out_0 : OUT  std_logic_vector(7 downto 0);
         Data_out_1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal WR_EN : std_logic := '0';
   signal Data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal Addr_in_0 : std_logic_vector(3 downto 0) := (others => '0');
   signal Addr_in_1 : std_logic_vector(3 downto 0) := (others => '0');
   signal port_en_0 : std_logic := '0';
   signal port_en_1 : std_logic := '0';

 	--Outputs
   signal Data_out_0 : std_logic_vector(7 downto 0);
   signal Data_out_1 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DualportRAM PORT MAP (
          Clk => Clk,
          WR_EN => WR_EN,
          Data_in => Data_in,
          Addr_in_0 => Addr_in_0,
          Addr_in_1 => Addr_in_1,
          port_en_0 => port_en_0,
          port_en_1 => port_en_1,
          Data_out_0 => Data_out_0,
          Data_out_1 => Data_out_1
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      port_en_0<='0';
		WR_EN<='1';
		Data_in<=X"FF";
		Addr_in_0<=X"1";
		wait for 20 ns;
		
		port_en_0<='1';
		for i in 1 to 16 loop
		Data_in<=conv_std_logic_vector(1,8);
		Addr_in_0<=conv_std_logic_vector(i-1,4);
		wait for 20 ns;
		end loop;

      WR_EN<='0';
		port_en_0<='0';
		port_en_1<='1';
		for i in 1 to 16 loop
		Addr_in_1<=conv_std_logic_vector(i-1,4);
		wait for 10 ns;
		end loop;
		port_en_1<='0';
      -- insert stimulus here 
wait;
      wait;
   end process;

END;
