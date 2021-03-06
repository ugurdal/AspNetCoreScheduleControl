USE [master]
GO
/****** Object:  Database [ScheduleProjectDb]    Script Date: 3/28/2020 1:15:13 AM ******/
CREATE DATABASE [ScheduleProjectDb]
GO
ALTER DATABASE [ScheduleProjectDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ScheduleProjectDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ScheduleProjectDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ScheduleProjectDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ScheduleProjectDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ScheduleProjectDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ScheduleProjectDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET RECOVERY FULL 
GO
ALTER DATABASE [ScheduleProjectDb] SET  MULTI_USER 
GO
ALTER DATABASE [ScheduleProjectDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ScheduleProjectDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ScheduleProjectDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ScheduleProjectDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ScheduleProjectDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ScheduleProjectDb', N'ON'
GO
ALTER DATABASE [ScheduleProjectDb] SET QUERY_STORE = OFF
GO
USE [ScheduleProjectDb]
GO
/****** Object:  Schema [HangFire]    Script Date: 3/28/2020 1:15:13 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[Cashbox]    Script Date: 3/28/2020 1:15:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashbox](
	[CashboxId] [int] IDENTITY(1,1) NOT NULL,
	[CashTypeId] [int] NULL,
	[TotalQuantity] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Cashbox] PRIMARY KEY CLUSTERED 
(
	[CashboxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashType]    Script Date: 3/28/2020 1:15:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashType](
	[CashTypeId] [int] IDENTITY(1,1) NOT NULL,
	[CashTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CashType] PRIMARY KEY CLUSTERED 
(
	[CashTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 3/28/2020 1:15:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[ForexBuying] [decimal](18, 4) NULL,
	[ForexSelling] [decimal](18, 4) NULL,
	[BanknoteBuying] [decimal](18, 4) NULL,
	[BanknoteSelling] [decimal](18, 4) NULL,
	[LastUpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[CurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialCash]    Script Date: 3/28/2020 1:15:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialCash](
	[FinancialCashId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[CashCurrncy] [decimal](18, 2) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FinancialCash] PRIMARY KEY CLUSTERED 
(
	[FinancialCashId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/28/2020 1:15:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[IsActivatedMailSend] [bit] NULL,
	[UserGuid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cashbox] ON 
GO
INSERT [dbo].[Cashbox] ([CashboxId], [CashTypeId], [TotalQuantity]) VALUES (1, 1, CAST(120.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Cashbox] ([CashboxId], [CashTypeId], [TotalQuantity]) VALUES (2, 2, CAST(45.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Cashbox] ([CashboxId], [CashTypeId], [TotalQuantity]) VALUES (3, 2, CAST(45.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Cashbox] ([CashboxId], [CashTypeId], [TotalQuantity]) VALUES (4, 1, CAST(20.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Cashbox] ([CashboxId], [CashTypeId], [TotalQuantity]) VALUES (5, 2, CAST(30.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Cashbox] ([CashboxId], [CashTypeId], [TotalQuantity]) VALUES (6, 1, CAST(3.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Cashbox] OFF
GO
SET IDENTITY_INSERT [dbo].[CashType] ON 
GO
INSERT [dbo].[CashType] ([CashTypeId], [CashTypeName]) VALUES (1, N'Gelir')
GO
INSERT [dbo].[CashType] ([CashTypeId], [CashTypeName]) VALUES (2, N'Gider')
GO
SET IDENTITY_INSERT [dbo].[CashType] OFF
GO
SET IDENTITY_INSERT [dbo].[Currency] ON 
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (1, N'ABD DOLARI', N'US DOLLAR', CAST(6.4943 AS Decimal(18, 4)), CAST(6.5060 AS Decimal(18, 4)), CAST(6.4898 AS Decimal(18, 4)), CAST(6.5158 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (2, N'AVUSTRALYA DOLARI', N'AUSTRALIAN DOLLAR', CAST(3.8482 AS Decimal(18, 4)), CAST(3.8733 AS Decimal(18, 4)), CAST(3.8305 AS Decimal(18, 4)), CAST(3.8965 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (3, N'DANİMARKA KRONU', N'DANISH KRONE', CAST(0.9420 AS Decimal(18, 4)), CAST(0.9467 AS Decimal(18, 4)), CAST(0.9414 AS Decimal(18, 4)), CAST(0.9488 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (4, N'EURO', N'EURO', CAST(7.0455 AS Decimal(18, 4)), CAST(7.0582 AS Decimal(18, 4)), CAST(7.0406 AS Decimal(18, 4)), CAST(7.0688 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (5, N'İNGİLİZ STERLİNİ', N'POUND STERLING', CAST(7.5874 AS Decimal(18, 4)), CAST(7.6269 AS Decimal(18, 4)), CAST(7.5821 AS Decimal(18, 4)), CAST(7.6384 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (6, N'İSVİÇRE FRANGI', N'SWISS FRANK', CAST(6.6418 AS Decimal(18, 4)), CAST(6.6844 AS Decimal(18, 4)), CAST(6.6318 AS Decimal(18, 4)), CAST(6.6944 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (7, N'İSVEÇ KRONU', N'SWEDISH KRONA', CAST(0.6344 AS Decimal(18, 4)), CAST(0.6410 AS Decimal(18, 4)), CAST(0.6340 AS Decimal(18, 4)), CAST(0.6425 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (8, N'KANADA DOLARI', N'CANADIAN DOLLAR', CAST(4.4979 AS Decimal(18, 4)), CAST(4.5182 AS Decimal(18, 4)), CAST(4.4812 AS Decimal(18, 4)), CAST(4.5353 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (9, N'KUVEYT DİNARI', N'KUWAITI DINAR', CAST(20.6710 AS Decimal(18, 4)), CAST(20.9415 AS Decimal(18, 4)), CAST(20.3609 AS Decimal(18, 4)), CAST(21.2556 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (10, N'NORVEÇ KRONU', N'NORWEGIAN KRONE', CAST(0.5858 AS Decimal(18, 4)), CAST(0.5898 AS Decimal(18, 4)), CAST(0.5854 AS Decimal(18, 4)), CAST(0.5911 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (11, N'SUUDİ ARABİSTAN RİYALİ', N'SAUDI RIYAL', CAST(1.7286 AS Decimal(18, 4)), CAST(1.7317 AS Decimal(18, 4)), CAST(1.7156 AS Decimal(18, 4)), CAST(1.7447 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (12, N'JAPON YENİ', N'JAPENESE YEN', CAST(5.8600 AS Decimal(18, 4)), CAST(5.8988 AS Decimal(18, 4)), CAST(5.8383 AS Decimal(18, 4)), CAST(5.9212 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (13, N'BULGAR LEVASI', N'BULGARIAN LEV', CAST(3.5821 AS Decimal(18, 4)), CAST(3.6290 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (14, N'RUMEN LEYİ', N'NEW LEU', CAST(1.4449 AS Decimal(18, 4)), CAST(1.4639 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (15, N'RUS RUBLESİ', N'RUSSIAN ROUBLE', CAST(0.0820 AS Decimal(18, 4)), CAST(0.0830 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (16, N'İRAN RİYALİ', N'IRANIAN RIAL', CAST(0.0154 AS Decimal(18, 4)), CAST(0.0156 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (17, N'ÇİN YUANI', N'CHINESE RENMINBI', CAST(0.9136 AS Decimal(18, 4)), CAST(0.9256 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (18, N'PAKİSTAN RUPİSİ', N'PAKISTANI RUPEE', CAST(0.0406 AS Decimal(18, 4)), CAST(0.0412 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (19, N'KATAR RİYALİ', N'QATARI RIAL', CAST(1.7733 AS Decimal(18, 4)), CAST(1.7965 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
INSERT [dbo].[Currency] ([CurrencyId], [Name], [Code], [ForexBuying], [ForexSelling], [BanknoteBuying], [BanknoteSelling], [LastUpdateTime]) VALUES (20, N'ÖZEL ÇEKME HAKKI (SDR)                            ', N'SPECIAL DRAWING RIGHT (SDR)                       ', CAST(8.8026 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(N'2020-03-25T00:07:56.870' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Currency] OFF
GO
SET IDENTITY_INSERT [dbo].[FinancialCash] ON 
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (1, 1, CAST(3.53 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:25.640' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (2, 2, CAST(5.90 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:26.867' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (3, 3, CAST(24.24 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:28.570' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (4, 4, CAST(3.25 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:29.323' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (5, 5, CAST(3.01 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.247' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (6, 6, CAST(3.44 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.257' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (7, 7, CAST(35.80 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.277' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (8, 8, CAST(5.07 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.280' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (9, 9, CAST(1.08 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.283' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (10, 10, CAST(38.91 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.287' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (11, 11, CAST(13.18 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.290' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (12, 12, CAST(3.88 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.297' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (13, 13, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.297' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (14, 14, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.303' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (15, 15, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.307' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (16, 16, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.310' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (17, 17, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.313' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (18, 18, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.317' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (19, 19, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.320' AS DateTime))
GO
INSERT [dbo].[FinancialCash] ([FinancialCashId], [CurrencyId], [CashCurrncy], [LastUpdatedDate]) VALUES (20, 20, CAST(0.00 AS Decimal(18, 2)), CAST(N'2020-03-25T00:12:34.320' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[FinancialCash] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Email], [Password], [Status], [IsActivatedMailSend], [UserGuid]) VALUES (4, N'adem', N'olguner', N'ademolguner@gmail.com', N'asas', 0, 0, N'0d03fa38-c653-41da-a770-db2a7f92684a')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Cashbox]  WITH CHECK ADD  CONSTRAINT [FK_Cashbox_CashType] FOREIGN KEY([CashTypeId])
REFERENCES [dbo].[CashType] ([CashTypeId])
GO
ALTER TABLE [dbo].[Cashbox] CHECK CONSTRAINT [FK_Cashbox_CashType]
GO
ALTER TABLE [dbo].[FinancialCash]  WITH CHECK ADD  CONSTRAINT [FK_FinancialCash_Currency] FOREIGN KEY([CurrencyId])
REFERENCES [dbo].[Currency] ([CurrencyId])
GO
ALTER TABLE [dbo].[FinancialCash] CHECK CONSTRAINT [FK_FinancialCash_Currency]
GO
USE [master]
GO
ALTER DATABASE [ScheduleProjectDb] SET  READ_WRITE 
GO
