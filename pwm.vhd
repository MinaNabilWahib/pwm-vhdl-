library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity pwm is
	generic(
		max_val: integer := 16;
		val_bits: integer := 4
	);
	port(
		clk: in std_logic;
		w: in std_logic_vector((val_bits -1) downto 0);
		pulse: out std_logic
	);
end entity;

architecture arch of pwm is
	signal cnt: std_logic_vector((val_bits -1) downto 0);
	
begin
process(clk) -- Counting
begin

	if(clk'event and clk = '1') then
		if (cnt < (max_val-1)) then
			cnt <= cnt + 1;
		else
			cnt <= (others => '0');
		end if;
	end if;
end process;
process(cnt,w)
begin

	--if(clk'event and clk = '1') then
		if ( w ="0000") or ( w="1111" ) then 
				pulse <= '1';
			elsif (w > cnt )then
				pulse <= '1';
			else
				pulse <= '0';
		end if;
	--end if ;
end process;
end arch;