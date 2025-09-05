----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:08:43 07/13/2025 
-- Design Name: 
-- Module Name:    singleportram - Behavioral 
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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity singleportram is
    Port ( RAM_Addr : in  STD_LOGIC_VECTOR (6 downto 0);
           RAM_Data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           RAM_WR : in  STD_LOGIC;
           RAM_Clk : in  STD_LOGIC;
           RAM_Data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end singleportram;

architecture Behavioral of singleportram is


type RAM_ARRAY is array(0 to 127) of std_logic_vector(7 downto 0);
Signal RAM: RAM_ARRAY:=(
x"55",x"66",x"77",x"67",
x"99",x"00",x"00",x"11",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00"
);
begin
process(RAM_Clk)
begin
if(rising_edge(RAM_Clk))then
if(RAM_WR='1')then
RAM(to_integer(unsigned(RAM_Addr)))<=RAM_Data_in;
end if;
end if;
end process;
RAM_Data_out<=RAM(to_integer(unsigned(RAM_Addr)));
end Behavioral;
