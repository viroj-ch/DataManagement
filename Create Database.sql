create database [DataManagement]
GO


USE [DataManagement]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-------------------------------------------------------------------------------
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserMobile] [varchar](50) NULL,
	[UserEmail] [varchar](50) NULL,
	[FaceBookUrl] [varchar](50) NULL,
	[LinkedInUrl] [varchar](50) NULL,
	[TwitterUrl] [varchar](50) NULL,
	[PersonalWebUrl] [varchar](50) NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
-------------------------------------------------------------------------------
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[CustomerMobile] [varchar](50) NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customer_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
-------------------------------------------------------------------------------
create PROCEDURE[dbo].[AddCustomer]  
	@CustomerName varchar(50),  
    @CustomerEmail varchar(50),  
    @UCustomerMobile varchar(50)
AS  
BEGIN  
SET NOCOUNT ON;  

INSERT INTO [dbo].[Customers]
           ([CustomerName]
           ,[CustomerEmail]
           ,[CustomerMobile])
     VALUES
          (@CustomerName, @CustomerEmail, @UCustomerMobile)
END  
GO
-------------------------------------------------------------------------------
create PROCEDURE[dbo].[AddUser]  
@UserName varchar(50),  
    @UserMobile varchar(50),  
    @UserEmail varchar(50),  
    @FaceBookUrl varchar(50),  
    @LinkedInUrl varchar(50),  
    @TwitterUrl varchar(50),  
    @PersonalWebUrl varchar(50)  
AS  
BEGIN  
SET NOCOUNT ON;  

insert into Users(UserName, UserMobile, UserEmail, FaceBookUrl, LinkedInUrl, TwitterUrl, PersonalWebUrl)  
values(@UserName, @UserMobile, @UserEmail, @FaceBookUrl, @LinkedInUrl, @TwitterUrl, @PersonalWebUrl)  
END  
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE[dbo].[DeleteCustomer]  
@CustomerId int  
AS  
BEGIN  
SET NOCOUNT ON;  

update Customers set IsDeleted = 1 where CustomerId = @CustomerId
END
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE[dbo].[DeleteUser]  
@UserId int  
AS  
BEGIN  
SET NOCOUNT ON;  

update Users set IsDeleted = 1 where UserId = @UserId  
END  
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE[dbo].[GetAllCustomers]  
AS  
BEGIN  
SET NOCOUNT ON;

select * from Customers  
END  
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE[dbo].[GetAllUsers]  
AS  
BEGIN  
SET NOCOUNT ON;

select * from Users  
END  
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE[dbo].[GetCustomerById]  
@CustomerId int  
AS  
BEGIN  
SET NOCOUNT ON;  

select * from Customers where CustomerId = @CustomerId;  
END  
GO

-------------------------------------------------------------------------------
CREATE PROCEDURE[dbo].[GetUserById]  
@UserId int  
AS  
BEGIN  
SET NOCOUNT ON;  

select * from Users where UserId = @UserId;  
END  
GO
-------------------------------------------------------------------------------
create procedure [dbo].[UpdateCustomer]
	@CustomerId int,  
	@CustomerName varchar(50),  
    @CustomerEmail varchar(50),  
    @UCustomerMobile varchar(50)
	AS  
BEGIN  
SET NOCOUNT ON; 

UPDATE [dbo].[Customers]
   SET [CustomerName] = @CustomerName
      ,[CustomerEmail] = @CustomerEmail
      ,[CustomerMobile] = @UCustomerMobile
 WHERE CustomerId = @CustomerId
 end
GO
-------------------------------------------------------------------------------
CREATE PROCEDURE[dbo].[UpdateUser]  
@UserId int,  
@UserName varchar(50),  
    @UserMobile varchar(50),  
    @UserEmail varchar(50),  
    @FaceBookUrl varchar(50),  
    @LinkedInUrl varchar(50),  
    @TwitterUrl varchar(50),  
    @PersonalWebUrl varchar(50)  
AS  
BEGIN  
SET NOCOUNT ON;  

update Users set  
UserName = @UserName,  
    UserMobile = @UserMobile,  
    UserEmail = @UserEmail,  
    FaceBookUrl = @FaceBookUrl,  
    LinkedInUrl = @LinkedInUrl,  
    TwitterUrl = @TwitterUrl,  
    PersonalWebUrl = @PersonalWebUrl  
where UserId = @UserId  
END  
GO
-------------------------------------------------------------------------------