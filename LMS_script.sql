USE [master]
GO
/****** Object:  Database [LMS]    Script Date: 05/10/2020 15:21:59 ******/
CREATE DATABASE [LMS] ON  PRIMARY 
( NAME = N'LMS', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LMS.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LMS_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\LMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LMS] SET ARITHABORT OFF
GO
ALTER DATABASE [LMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LMS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LMS] SET  READ_WRITE
GO
ALTER DATABASE [LMS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [LMS] SET  MULTI_USER
GO
ALTER DATABASE [LMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LMS] SET DB_CHAINING OFF
GO
USE [LMS]
GO
/****** Object:  Table [dbo].[tbl_books]    Script Date: 05/10/2020 15:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Author] [varchar](50) NULL,
	[ISBN] [varchar](50) NULL,
	[Publisher] [varchar](50) NULL,
	[Year] [varchar](10) NULL,
 CONSTRAINT [pk_bookid] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_books] ON
INSERT [dbo].[tbl_books] ([BookId], [Title], [Author], [ISBN], [Publisher], [Year]) VALUES (1, N'Programming in ''C''', N'Mahesh Gurunani ', N'8798545785892', N' Rudra Publications', N'2013')
INSERT [dbo].[tbl_books] ([BookId], [Title], [Author], [ISBN], [Publisher], [Year]) VALUES (2, N'Java', N'Bala Dhandayuthapani Veerasamy .', N'9788187972846', N'Penram', N'2013')
INSERT [dbo].[tbl_books] ([BookId], [Title], [Author], [ISBN], [Publisher], [Year]) VALUES (3, N'c++', N' Bjarne Stroustrup', N'9780321563842', N'Addison-Wesley', N'1985')
INSERT [dbo].[tbl_books] ([BookId], [Title], [Author], [ISBN], [Publisher], [Year]) VALUES (4, N'A Tour of C++', N'Bjarne Stroustrup', N'9780134997834', N'Addison-Wesley', N'2013')
INSERT [dbo].[tbl_books] ([BookId], [Title], [Author], [ISBN], [Publisher], [Year]) VALUES (5, N'Let Us C', N'Yashavant Kanetkar', N'8176566217125', N'Paperback', N'2002')
SET IDENTITY_INSERT [dbo].[tbl_books] OFF
/****** Object:  StoredProcedure [dbo].[sp_updatebookdetails]    Script Date: 05/10/2020 15:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_updatebookdetails]
@Title varchar(50),
@Author varchar(50),
@ISBN varchar(50),
@Publisher varchar(50),
@Year varchar(10),
@BookId int,
@rval int output
AS
BEGIN
	SET	NOCOUNT ON;
	
	update tbl_books
	set Title=@Title,Author=@Author,ISBN=@ISBN,Publisher=@Publisher,Year=@Year
	where BookId=@BookId;
	
	if(@@ROWCOUNT>0)		
	begin
		set @rval=1
	end
	else
	begin
		set @rval=0
	end
	
	return @rval;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getbooks]    Script Date: 05/10/2020 15:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getbooks]
AS
BEGIN
	
	SET NOCOUNT ON;

    select * from tbl_books;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deletebook]    Script Date: 05/10/2020 15:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_deletebook] 
@BookId int,
@rval int output
AS
BEGIN

	SET NOCOUNT ON;
	delete from tbl_books where BookId=@BookId;
	
	if(@@ROWCOUNT>0)			
	begin 
	set @rval=1;
	end
	else
	begin
	set @rval=0;
	end
	
	return @rval;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_addbooks]    Script Date: 05/10/2020 15:22:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_addbooks]
@Title varchar(50),
@Author varchar(50),
@ISBN varchar(50),
@Publisher varchar(50),
@Year varchar(10),
@rval int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into tbl_books(Title,Author,ISBN,Publisher,Year) values(@Title,@Author,@ISBN,@Publisher,@Year);
    
    set @rval=SCOPE_IDENTITY();
    return @rval;
    
END
GO
