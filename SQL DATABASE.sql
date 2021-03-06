USE [master]
GO
/****** Object:  Database [Doctor_Appointment]    Script Date: 12-07-2022 20:18:34 ******/
CREATE DATABASE [Doctor_Appointment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Doctor_Appointment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Doctor_Appointment.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Doctor_Appointment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Doctor_Appointment_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Doctor_Appointment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Doctor_Appointment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Doctor_Appointment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Doctor_Appointment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Doctor_Appointment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Doctor_Appointment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Doctor_Appointment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Doctor_Appointment] SET  MULTI_USER 
GO
ALTER DATABASE [Doctor_Appointment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Doctor_Appointment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Doctor_Appointment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Doctor_Appointment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Doctor_Appointment] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Doctor_Appointment]
GO
/****** Object:  Table [dbo].[AppoitmentDetails]    Script Date: 12-07-2022 20:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppoitmentDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Age] [int] NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[BloodGroup] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[EmailID] [nvarchar](100) NOT NULL,
	[MobileNumber] [nvarchar](15) NOT NULL,
	[DateOfAppointment] [date] NOT NULL,
	[PatientReport] [nvarchar](max) NOT NULL,
	[SubmitOnDate] [date] NULL CONSTRAINT [DF_AppoitmentDetails_SubmitOnDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_AppoitmentDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[checkdate]    Script Date: 12-07-2022 20:18:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[checkdate]
@DateOfAppointment date
as
begin
if exists
(select DateOfAppointment from [dbo].[AppoitmentDetails]
where DateOfAppointment=@DateOfAppointment)
begin
PRINT '1';
END
ELSE
BEGIN PRINT '0'; END
end
GO
/****** Object:  StoredProcedure [dbo].[InsertAppointmentDetails]    Script Date: 12-07-2022 20:18:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertAppointmentDetails]
@Name nvarchar(200),
@Age int,
@DateOfBirth date,
@BloodGroup nvarchar(50),
@Address nvarchar(max),
@EmailID nvarchar(100),
@MobileNumber nvarchar(15),
@DateOfAppointment date,
@PatientReport nvarchar(max)
as
begin
insert into [dbo].[AppoitmentDetails] (Name, Age, DateOfBirth, BloodGroup, Address, EmailID, MobileNumber, DateOfAppointment, PatientReport)
						values (@Name, @Age, @DateOfBirth, @BloodGroup, @Address, @EmailID, @MobileNumber, @DateOfAppointment, @PatientReport)
end
GO
USE [master]
GO
ALTER DATABASE [Doctor_Appointment] SET  READ_WRITE 
GO
