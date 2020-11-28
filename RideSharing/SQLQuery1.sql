--CREATE DATABASE Ride_Sharing_1
--GO
USE RideSharing
GO
CREATE TABLE [User] (
	[User Name] CHAR(30) not null,
	Gender CHAR(10) CHECK ( Gender IN ( 'Male', 'Female', 'Other')),
	[Contact Number] VARCHAR(12) PRIMARY KEY, 
	Email VARCHAR(30),
	[Password] VARCHAR(30) not null,
	[typeofuser] varchar(30) CHECK ( typeofuser IN ( 'Driver', 'Passenger','Admin')), --saved from interface 
	--primary key ([Contact Number],[typeofuser])
	);

CREATE TABLE Driver (
	[Driver ID] INTEGER PRIMARY KEY,
	[Contact Number] VARCHAR(12) foreign key references [User]([Contact Number])
	--PRIMARY KEY([Driver ID],[Contact Number])
	);

CREATE TABLE Passenger (
	[Passenger ID] int PRIMARY KEY,
	[Contact Number] VARCHAR(12) foreign key references [User]([Contact Number])
	--PRIMARY KEY([Passenger ID],[Contact Number])
	);
	CREATE TABLE [Route] (
	[route id] int PRIMARY KEY,
	[Starting Location] VARCHAR(30),
	[Destination] VARCHAR(30),
	FARE int
);
CREATE TABLE History (
	[Time] TIME,
	[Date] DATE,
	[Driver ID] INTEGER FOREIGN KEY REFERENCES Driver([Driver ID]),
	[Passenger ID] INTEGER FOREIGN KEY REFERENCES Passenger([Passenger ID]),
	[rout id] int FOREIGN KEY REFERENCES [Route]([route id]),
	PRIMARY KEY ([Time], [Driver ID], [Passenger ID], [Date])
	);

CREATE TABLE [Request_For_Ride] (
	[Time] TIME,
	[Date] DATE,
	[route id] int,
	[Passenger ID] INTEGER FOREIGN KEY REFERENCES Passenger([Passenger ID]),
	PRIMARY KEY ([Passenger ID], [Time], [Date])
	);



CREATE TABLE [Car Details] (
	[Car ID] VARCHAR (30) PRIMARY KEY,
	Maker VARCHAR(30),
	Capacity INT,
	[Driver ID] INTEGER FOREIGN KEY REFERENCES [Driver]([Driver ID])
	);



SELECT * FROM [User];
SELECT * FROM Driver;
SELECT * FROM Passenger;
SELECT * FROM History;
SELECT * FROM Request_For_Ride;
SELECT * FROM [Car Details];
select * from [Route]

create Procedure SignUp
@u_name varchar(20),@email varchar(20) ,@gender varchar(10),@Contact_Number varchar(20),@Password varchar(10),@type_of_user varchar(10) , @output int output
as
begin
	if(@email is NULL or @Password is NULL or @u_name is null or @gender is null or @Contact_Number is null or @type_of_user is null)
	begin
		print 'Values Not Be NULL'
		set @output=0
	end
	else
	if exists(select *
	from [User]
	where [User].[Contact Number]=@Contact_Number and @type_of_user = [User].typeofuser
	)
	begin
	print'User is Already Exists'
	set @output=2
	end
	else
	begin
		insert into [User] values(@u_name,@gender,@Contact_Number,@email,@Password,@type_of_user)
		set @output=1
	end
	return @output
end

--declare @result int
--set @result=0
--exec SignUp 'Gullsher','l182124','Male','03014403242','1234','Driver',@result


-----------Store Procedure of LOGIN -----------

create procedure USER_LOGIN
@Contact_Number varchar(20),@Password varchar(10),@type varchar(10),@output int output
as
begin
	if exists (select * from [User] where [User].[Contact Number]=@Contact_Number and [User].[password]=@password and [User].typeofuser = @type)
	begin
		--select * from [User]
		print 'User is exists'
		set @output=1
	end
	else
	begin
		set @output=0
		print 'User is not exists'
	end
	return @output
end

--declare @r int
--set @r=0
--exec USER_LOGIN '03066545633','123456','Passenger',@r
