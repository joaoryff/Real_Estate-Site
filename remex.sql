USE [master]
GO
/****** Object:  Database [RemaxProject]    Script Date: 2020-04-28 10:12:04 PM ******/
CREATE DATABASE [RemaxProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RemaxProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RemaxProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RemaxProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RemaxProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RemaxProject] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RemaxProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RemaxProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RemaxProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RemaxProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RemaxProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RemaxProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [RemaxProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RemaxProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RemaxProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RemaxProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RemaxProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RemaxProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RemaxProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RemaxProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RemaxProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RemaxProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RemaxProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RemaxProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RemaxProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RemaxProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RemaxProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RemaxProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RemaxProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RemaxProject] SET RECOVERY FULL 
GO
ALTER DATABASE [RemaxProject] SET  MULTI_USER 
GO
ALTER DATABASE [RemaxProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RemaxProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RemaxProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RemaxProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RemaxProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RemaxProject', N'ON'
GO
ALTER DATABASE [RemaxProject] SET QUERY_STORE = OFF
GO
USE [RemaxProject]
GO
/****** Object:  Table [dbo].[House]    Script Date: 2020-04-28 10:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[HouseID] [int] IDENTITY(1,1) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
	[CIty] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Rooms] [int] NOT NULL,
	[Bathrooms] [int] NOT NULL,
	[Garage] [int] NOT NULL,
	[Pool] [int] NOT NULL,
	[Fireplace] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2020-04-28 10:12:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LoginType] [int] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([HouseID], [Region], [CIty], [Price], [Rooms], [Bathrooms], [Garage], [Pool], [Fireplace], [Image]) VALUES (48, N'Centre Ville', N'Montreal', 100000.89, 1, 1, 0, 0, 0, N'~/Presentation/houseIMG/Arqui3D_HousePlan1_01.jpg')
INSERT [dbo].[House] ([HouseID], [Region], [CIty], [Price], [Rooms], [Bathrooms], [Garage], [Pool], [Fireplace], [Image]) VALUES (49, N'Mount Royal', N'Montreal', 500000.56, 3, 2, 1, 1, 1, N'~/Presentation/houseIMG/arqui3d-download-house-plans-3_orig.jpg')
INSERT [dbo].[House] ([HouseID], [Region], [CIty], [Price], [Rooms], [Bathrooms], [Garage], [Pool], [Fireplace], [Image]) VALUES (53, N'Mount Royal', N'Montreal', 20000000.25, 5, 3, 1, 1, 0, N'~/Presentation/houseIMG/arqui3d-houseplan1-image01_orig.jpg')
INSERT [dbo].[House] ([HouseID], [Region], [CIty], [Price], [Rooms], [Bathrooms], [Garage], [Pool], [Fireplace], [Image]) VALUES (56, N'Sainte foy', N'Quebec', 150000.99, 4, 2, 0, 0, 1, N'~/Presentation/houseIMG/fb.jpg')
INSERT [dbo].[House] ([HouseID], [Region], [CIty], [Price], [Rooms], [Bathrooms], [Garage], [Pool], [Fireplace], [Image]) VALUES (57, N'Centre Ville', N'Quebec', 375698.36, 2, 1, 0, 0, 0, N'~/Presentation/houseIMG/maxresdefault.jpg')
INSERT [dbo].[House] ([HouseID], [Region], [CIty], [Price], [Rooms], [Bathrooms], [Garage], [Pool], [Fireplace], [Image]) VALUES (59, N'Centre Ville', N'Quebec', 579699.36, 3, 3, 1, 1, 1, N'~/Presentation/houseIMG/arqui3d-house-plan-4-carmen-01_orig.jpg')
SET IDENTITY_INSERT [dbo].[House] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([UserID], [Username], [Password], [LoginType]) VALUES (1, N'admin', N'admin', 1)
INSERT [dbo].[Login] ([UserID], [Username], [Password], [LoginType]) VALUES (2, N'user', N'user', 2)
INSERT [dbo].[Login] ([UserID], [Username], [Password], [LoginType]) VALUES (3, N'test', N'test', 2)
SET IDENTITY_INSERT [dbo].[Login] OFF
USE [master]
GO
ALTER DATABASE [RemaxProject] SET  READ_WRITE 
GO
