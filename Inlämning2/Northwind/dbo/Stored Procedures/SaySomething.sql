/****** Script for SelectTopNRows command from SSMS  ******/
create procedure SaySomething(@message nvarchar(50), @counter int)
as


	while(@counter > 0)
	begin
	print @message + ''+ cast(@counter as nvarchar(2))
	set @counter = @counter -1
	end

	exec SaySomething 'Hello world', 5
