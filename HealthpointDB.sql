USE [master]
GO
/****** Object:  Database [HealthPointDB]    Script Date: 7/27/2013 6:58:49 PM ******/
CREATE DATABASE [HealthPointDB]
GO
ALTER DATABASE [HealthPointDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HealthPointDB].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [HealthPointDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HealthPointDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HealthPointDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HealthPointDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HealthPointDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HealthPointDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HealthPointDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HealthPointDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HealthPointDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HealthPointDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HealthPointDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HealthPointDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HealthPointDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HealthPointDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HealthPointDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HealthPointDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HealthPointDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HealthPointDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HealthPointDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HealthPointDB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [HealthPointDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HealthPointDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HealthPointDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HealthPointDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HealthPointDB] SET  MULTI_USER 
GO
ALTER DATABASE [HealthPointDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HealthPointDB] SET DB_CHAINING OFF 
GO
USE [HealthPointDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/27/2013 6:58:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](255) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 7/27/2013 6:58:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Duration] [int] NULL,
	[Assessment] [nvarchar](max) NULL,
	[DiagnosisCode] [nvarchar](max) NULL,
	[LabsRequested] [nvarchar](max) NULL,
	[TreatmentPlan] [nvarchar](max) NULL,
	[PatientNotes] [nvarchar](max) NULL,
	[NextFollowup] [datetime2](7) NULL,
 CONSTRAINT [PrimaryKey_ee944062-3946-444b-b857-582dfbe066ed] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 7/27/2013 6:58:49 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleInitial] [nvarchar](15) NULL,
	[LastName] [nvarchar](70) NOT NULL,
	[DOB] [date] NOT NULL,
	[Address] [nvarchar](61) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Allergies] [nvarchar](max) NULL,
	[Height] [numeric](18, 0) NULL,
	[Weight] [numeric](18, 0) NULL,
	[MedicalHistory] [nvarchar](max) NULL,
	[EmergencyContact] [nvarchar](50) NULL,
	[CurrentMedications] [nvarchar](max) NULL,
 CONSTRAINT [PrimaryKey_47d73296-4c68-426e-99d1-71274ca52170] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 7/27/2013 6:58:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[MiddleInitial] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Allergies] [nvarchar](max) NULL,
	[Height] [decimal](18, 2) NOT NULL,
	[Weight] [decimal](18, 2) NOT NULL,
	[MedicalHistory] [nvarchar](max) NULL,
	[EmergencyContact] [nvarchar](max) NULL,
	[CurrentMedications] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Patients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Routes]    Script Date: 7/27/2013 6:58:50 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](256) NULL,
	[Created] [datetime2](7) NULL,
	[RouteString] [nvarchar](2560) NULL,
 CONSTRAINT [PrimaryKey_861a4956-cbd6-4382-a0b8-e6a10a046f64] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 7/27/2013 6:58:50 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PrimaryKey_8da3d4bc-60f6-4255-9585-9c6628597c93] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Vitals]    Script Date: 7/27/2013 6:58:50 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vitals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Pulse] [int] NOT NULL,
	[RespiratoryRate] [int] NULL,
	[BodyTemperature] [decimal](18, 1) NULL,
	[BloodPressure] [nvarchar](50) NULL,
	[Date] [datetime2](7) NULL,
 CONSTRAINT [PrimaryKey_81b205fe-bf02-4256-ab7c-398baf45df7d] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Waypoints]    Script Date: 7/27/2013 6:58:50 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Waypoints](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RouteId] [int] NOT NULL,
	[Lat] [nvarchar](256) NOT NULL,
	[Order] [int] NOT NULL,
	[Lng] [nchar](256) NULL,
	[Created] [datetime2](7) NULL,
	[Name] [nchar](50) NULL,
	[Address] [nvarchar](256) NULL,
 CONSTRAINT [PrimaryKey_506567c4-dd72-4907-af68-9d05311f4575] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 7/27/2013 6:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL
)

GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 7/27/2013 6:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL
)

GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 7/27/2013 6:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL
)

GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 7/27/2013 6:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
)

GO
/****** Object:  Index [Idx_webpages_Membership]    Script Date: 7/27/2013 6:58:50 PM ******/
CREATE UNIQUE CLUSTERED INDEX [Idx_webpages_Membership] ON [dbo].[webpages_Membership]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Idx_webpages_OAuthMembership]    Script Date: 7/27/2013 6:58:50 PM ******/
CREATE UNIQUE CLUSTERED INDEX [Idx_webpages_OAuthMembership] ON [dbo].[webpages_OAuthMembership]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Idx_webpages_Roles]    Script Date: 7/27/2013 6:58:50 PM ******/
CREATE UNIQUE CLUSTERED INDEX [Idx_webpages_Roles] ON [dbo].[webpages_Roles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [Idx_webpages_UsersInRoles]    Script Date: 7/27/2013 6:58:50 PM ******/
CREATE UNIQUE CLUSTERED INDEX [Idx_webpages_UsersInRoles] ON [dbo].[webpages_UsersInRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_0] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointment_0]
GO
ALTER TABLE [dbo].[Routes]  WITH CHECK ADD  CONSTRAINT [FK_Route_0] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[Routes] CHECK CONSTRAINT [FK_Route_0]
GO
ALTER TABLE [dbo].[Vitals]  WITH CHECK ADD  CONSTRAINT [FK_Vitals_0] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([ID])
GO
ALTER TABLE [dbo].[Vitals] CHECK CONSTRAINT [FK_Vitals_0]
GO
ALTER TABLE [dbo].[Waypoints]  WITH CHECK ADD  CONSTRAINT [FK_Waypoints_0] FOREIGN KEY([RouteId])
REFERENCES [dbo].[Routes] ([ID])
GO
ALTER TABLE [dbo].[Waypoints] CHECK CONSTRAINT [FK_Waypoints_0]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
USE [master]
GO
ALTER DATABASE [HealthPointDB] SET  READ_WRITE 
GO
