create table Payment_RSA
(
	Payment_ID int primary key identity,
	Card_Number varchar(255) not null,
	Exp_Month varchar(10) not null,
	Exp_Year varchar(10) not null,
	CVV varchar(10) not null,
	Card_Number_Encrypted nvarchar(max) not null,
	Exp_Month_Encrypted nvarchar(max) not null,
	Exp_Year_Encrypted nvarchar(max) not null,
	CVV_Encrypted nvarchar(max) not null
)

drop table Payment_RSA

select * from Payment_RSA

delete from Payment_RSA


create table Payment_Encrypted_Details
(
	PED_ID int primary key identity,
	Card_Number_Encrypted nvarchar(max) not null,
	Exp_Month_Encrypted nvarchar(max) not null,
	Exp_Year_Encrypted nvarchar(max) not null,
	CVV_Encrypted nvarchar(max) not null
)

select * from Payment_Encrypted_Details

delete from Payment_Encrypted_Details