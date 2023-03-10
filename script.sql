USE [master]
GO
/****** Object:  Database [ProjectForSchool]    Script Date: 18.01.2023 00:01:24 ******/
CREATE DATABASE [ProjectForSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectForSchool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProjectForSchool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectForSchool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProjectForSchool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectForSchool] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectForSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectForSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectForSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectForSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectForSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectForSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectForSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectForSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectForSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectForSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectForSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectForSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectForSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectForSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectForSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectForSchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectForSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectForSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectForSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectForSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectForSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectForSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectForSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectForSchool] SET RECOVERY FULL 
GO
ALTER DATABASE [ProjectForSchool] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectForSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectForSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectForSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectForSchool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectForSchool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectForSchool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectForSchool', N'ON'
GO
ALTER DATABASE [ProjectForSchool] SET QUERY_STORE = OFF
GO
USE [ProjectForSchool]
GO
/****** Object:  Table [dbo].[Ders]    Script Date: 18.01.2023 00:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Kredisi] [int] NULL,
	[OkulYonetimId] [int] NULL,
	[DersRenk] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenci]    Script Date: 18.01.2023 00:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenci](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[KayitTarih] [datetime] NULL,
	[OgrenciNo] [nvarchar](10) NULL,
	[DTarih] [datetime] NULL,
	[Bolum] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ogrenci] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OgrenciDers]    Script Date: 18.01.2023 00:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrenciDers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DersId] [int] NULL,
	[OgrenciId] [int] NULL,
 CONSTRAINT [PK_OgrenciDers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 18.01.2023 00:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Gorevi] [nvarchar](50) NULL,
	[YonetimTip] [nvarchar](50) NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ders] ON 

INSERT [dbo].[Ders] ([Id], [Ad], [Kredisi], [OkulYonetimId], [DersRenk]) VALUES (1, N'Yazılım', 10, 1, N'Red')
INSERT [dbo].[Ders] ([Id], [Ad], [Kredisi], [OkulYonetimId], [DersRenk]) VALUES (2, N'Elektronik', 4, 9, N'Blue')
INSERT [dbo].[Ders] ([Id], [Ad], [Kredisi], [OkulYonetimId], [DersRenk]) VALUES (4, N'Matematik', 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Ders] OFF
GO
SET IDENTITY_INSERT [dbo].[Ogrenci] ON 

INSERT [dbo].[Ogrenci] ([Id], [AdSoyad], [KayitTarih], [OgrenciNo], [DTarih], [Bolum]) VALUES (1, N'Fevzi Uzun', CAST(N'2023-01-16T00:00:00.000' AS DateTime), N'131', CAST(N'2000-02-10T00:00:00.000' AS DateTime), N'Yazılım')
INSERT [dbo].[Ogrenci] ([Id], [AdSoyad], [KayitTarih], [OgrenciNo], [DTarih], [Bolum]) VALUES (14, N'Furkan Türkyılmaz', CAST(N'2023-01-17T20:29:57.357' AS DateTime), N'333', CAST(N'2000-02-10T00:00:00.000' AS DateTime), N'Yazılım')
INSERT [dbo].[Ogrenci] ([Id], [AdSoyad], [KayitTarih], [OgrenciNo], [DTarih], [Bolum]) VALUES (15, N'Umut Tavşan', CAST(N'2023-01-17T20:31:03.787' AS DateTime), N'123', CAST(N'2000-02-10T00:00:00.000' AS DateTime), N'Yazılım')
INSERT [dbo].[Ogrenci] ([Id], [AdSoyad], [KayitTarih], [OgrenciNo], [DTarih], [Bolum]) VALUES (17, N'Ege1', CAST(N'2023-01-17T21:25:40.670' AS DateTime), N'543', CAST(N'2023-01-10T00:00:00.000' AS DateTime), N'Eczacılık')
SET IDENTITY_INSERT [dbo].[Ogrenci] OFF
GO
SET IDENTITY_INSERT [dbo].[OgrenciDers] ON 

INSERT [dbo].[OgrenciDers] ([Id], [DersId], [OgrenciId]) VALUES (1, 1, 1)
INSERT [dbo].[OgrenciDers] ([Id], [DersId], [OgrenciId]) VALUES (2, 2, 14)
INSERT [dbo].[OgrenciDers] ([Id], [DersId], [OgrenciId]) VALUES (5, 1, 1)
SET IDENTITY_INSERT [dbo].[OgrenciDers] OFF
GO
SET IDENTITY_INSERT [dbo].[Personel] ON 

INSERT [dbo].[Personel] ([Id], [AdSoyad], [Gorevi], [YonetimTip]) VALUES (1, N'Muzaffer Alaca', N'Yazılım Öğretmeni', N'12')
INSERT [dbo].[Personel] ([Id], [AdSoyad], [Gorevi], [YonetimTip]) VALUES (2, N'Zafer Özdağ', N'Müdür', N'11')
INSERT [dbo].[Personel] ([Id], [AdSoyad], [Gorevi], [YonetimTip]) VALUES (3, N'Tülay Metin', N'Öğrenci İşleri', N'13')
INSERT [dbo].[Personel] ([Id], [AdSoyad], [Gorevi], [YonetimTip]) VALUES (9, N'Muammer Kaddafi', N'Elektronik Öğretmeni', N'12')
SET IDENTITY_INSERT [dbo].[Personel] OFF
GO
ALTER TABLE [dbo].[Ders]  WITH CHECK ADD  CONSTRAINT [FK_Ders_Personel] FOREIGN KEY([OkulYonetimId])
REFERENCES [dbo].[Personel] ([Id])
GO
ALTER TABLE [dbo].[Ders] CHECK CONSTRAINT [FK_Ders_Personel]
GO
ALTER TABLE [dbo].[OgrenciDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciDers_Ders] FOREIGN KEY([DersId])
REFERENCES [dbo].[Ders] ([Id])
GO
ALTER TABLE [dbo].[OgrenciDers] CHECK CONSTRAINT [FK_OgrenciDers_Ders]
GO
ALTER TABLE [dbo].[OgrenciDers]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciDers_Ogrenci] FOREIGN KEY([OgrenciId])
REFERENCES [dbo].[Ogrenci] ([Id])
GO
ALTER TABLE [dbo].[OgrenciDers] CHECK CONSTRAINT [FK_OgrenciDers_Ogrenci]
GO
USE [master]
GO
ALTER DATABASE [ProjectForSchool] SET  READ_WRITE 
GO
