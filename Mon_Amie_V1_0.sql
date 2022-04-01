USE [master]
GO
/****** Object:  Database [MonAmie]    Script Date: 01.04.2022 10:47:59 ******/
CREATE DATABASE [MonAmie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MonAmie', FILENAME = N'D:\Games\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MonAmie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MonAmie_log', FILENAME = N'D:\Games\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MonAmie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MonAmie] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MonAmie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MonAmie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MonAmie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MonAmie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MonAmie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MonAmie] SET ARITHABORT OFF 
GO
ALTER DATABASE [MonAmie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MonAmie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MonAmie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MonAmie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MonAmie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MonAmie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MonAmie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MonAmie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MonAmie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MonAmie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MonAmie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MonAmie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MonAmie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MonAmie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MonAmie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MonAmie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MonAmie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MonAmie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MonAmie] SET  MULTI_USER 
GO
ALTER DATABASE [MonAmie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MonAmie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MonAmie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MonAmie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MonAmie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MonAmie] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MonAmie] SET QUERY_STORE = OFF
GO
USE [MonAmie]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[ID_Card] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[Number] [nvarchar](20) NOT NULL,
	[Month] [nvarchar](2) NOT NULL,
	[Year] [nvarchar](2) NOT NULL,
	[CVV] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[ID_Card] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deliveries]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deliveries](
	[ID_Deliveries] [int] IDENTITY(1,1) NOT NULL,
	[ID_Supliers] [int] NOT NULL,
	[ID_Felial] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Deliveries] PRIMARY KEY CLUSTERED 
(
	[ID_Deliveries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpensesFelial]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpensesFelial](
	[ID_ExpensesFelial] [int] IDENTITY(1,1) NOT NULL,
	[ID_Felial] [int] NULL,
	[Month] [date] NULL,
	[Expenses] [money] NULL,
 CONSTRAINT [PK_ExpensesFelial] PRIMARY KEY CLUSTERED 
(
	[ID_ExpensesFelial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filial]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filial](
	[ID_Filial] [int] IDENTITY(1,1) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[MonthIncome] [money] NOT NULL,
 CONSTRAINT [PK_Filial] PRIMARY KEY CLUSTERED 
(
	[ID_Filial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncomeFelial]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeFelial](
	[ID_Income] [int] IDENTITY(1,1) NOT NULL,
	[ID_Felial] [int] NOT NULL,
	[Month] [date] NOT NULL,
	[Income] [money] NOT NULL,
 CONSTRAINT [PK_IncomeFelial] PRIMARY KEY CLUSTERED 
(
	[ID_Income] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListRawMaterial]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListRawMaterial](
	[ID_ListRawMaterial] [int] IDENTITY(1,1) NOT NULL,
	[ID_Raw] [int] NOT NULL,
	[ID_Deliveries] [int] NOT NULL,
	[Count] [float] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_ListRawMaterial] PRIMARY KEY CLUSTERED 
(
	[ID_ListRawMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID_Order] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[ID_OrderAddressDelivety] [int] NOT NULL,
	[ID_Filial] [int] NOT NULL,
	[TypeDelivery] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Payment] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderAddressDelivery]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAddressDelivery](
	[ID_OrderAddressDelivery] [int] NOT NULL,
	[Region] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[House] [int] NOT NULL,
	[Flat] [int] NOT NULL,
 CONSTRAINT [PK_OrderAddressDelivery] PRIMARY KEY CLUSTERED 
(
	[ID_OrderAddressDelivery] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[ID_OrderList] [int] IDENTITY(1,1) NOT NULL,
	[ID_Order] [int] NOT NULL,
	[ID_Product] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderList] PRIMARY KEY CLUSTERED 
(
	[ID_OrderList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentSaiaries]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentSaiaries](
	[ID_PaymentSaiaries] [int] IDENTITY(1,1) NOT NULL,
	[ID_Staff] [int] NOT NULL,
	[Salary] [money] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentSaiaries] PRIMARY KEY CLUSTERED 
(
	[ID_PaymentSaiaries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID_Products] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Weight] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Income] [money] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID_Products] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductsRawMaterials]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsRawMaterials](
	[ID_ProductsRawMaterials] [int] IDENTITY(1,1) NOT NULL,
	[ID_Products] [int] NOT NULL,
	[ID_Raw] [int] NOT NULL,
	[Count] [float] NOT NULL,
 CONSTRAINT [PK_ProductsRawMaterials] PRIMARY KEY CLUSTERED 
(
	[ID_ProductsRawMaterials] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RawMaterial]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawMaterial](
	[ID_Row_Material] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Weight] [float] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RawMaterial] PRIMARY KEY CLUSTERED 
(
	[ID_Row_Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID_Roles] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID_Roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shifts]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shifts](
	[ID_Shifts] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Start_Shifts] [nchar](10) NOT NULL,
	[Start_Break] [nchar](10) NOT NULL,
	[End_Break] [nchar](10) NOT NULL,
	[End_Shifts] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Shifts] PRIMARY KEY CLUSTERED 
(
	[ID_Shifts] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftsStaff]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftsStaff](
	[ID_Shifts_Staff] [int] IDENTITY(1,1) NOT NULL,
	[ID_Staff] [int] NOT NULL,
	[ID_Shifts] [int] NOT NULL,
	[Count_Hour] [float] NOT NULL,
 CONSTRAINT [PK_Shifts_Staff] PRIMARY KEY CLUSTERED 
(
	[ID_Shifts_Staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID_Staff] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NULL,
	[ID_Shifts_Staff] [int] NULL,
	[Patronomic] [nvarchar](50) NULL,
	[Pass_Seria] [nvarchar](4) NOT NULL,
	[Pass_Number] [nvarchar](6) NOT NULL,
	[INN] [nvarchar](16) NOT NULL,
	[Post] [nvarchar](50) NOT NULL,
	[Salary_Hour] [money] NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID_Staff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[ID_Suppliers] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[INN] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[ID_Suppliers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[ID_Roles] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 01.04.2022 10:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[ID_Warehouse] [int] IDENTITY(1,1) NOT NULL,
	[ID_Filial] [int] NOT NULL,
	[ID_Raw_Materials] [int] NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[ID_Warehouse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_User] FOREIGN KEY([ID_User])
REFERENCES [dbo].[User] ([ID_User])
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_User]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_Filial] FOREIGN KEY([ID_Felial])
REFERENCES [dbo].[Filial] ([ID_Filial])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_Filial]
GO
ALTER TABLE [dbo].[Deliveries]  WITH CHECK ADD  CONSTRAINT [FK_Deliveries_Suppliers] FOREIGN KEY([ID_Supliers])
REFERENCES [dbo].[Suppliers] ([ID_Suppliers])
GO
ALTER TABLE [dbo].[Deliveries] CHECK CONSTRAINT [FK_Deliveries_Suppliers]
GO
ALTER TABLE [dbo].[ExpensesFelial]  WITH CHECK ADD  CONSTRAINT [FK_ExpensesFelial_Filial] FOREIGN KEY([ID_Felial])
REFERENCES [dbo].[Filial] ([ID_Filial])
GO
ALTER TABLE [dbo].[ExpensesFelial] CHECK CONSTRAINT [FK_ExpensesFelial_Filial]
GO
ALTER TABLE [dbo].[IncomeFelial]  WITH CHECK ADD  CONSTRAINT [FK_IncomeFelial_Filial] FOREIGN KEY([ID_Felial])
REFERENCES [dbo].[Filial] ([ID_Filial])
GO
ALTER TABLE [dbo].[IncomeFelial] CHECK CONSTRAINT [FK_IncomeFelial_Filial]
GO
ALTER TABLE [dbo].[ListRawMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ListRawMaterial_Deliveries] FOREIGN KEY([ID_Deliveries])
REFERENCES [dbo].[Deliveries] ([ID_Deliveries])
GO
ALTER TABLE [dbo].[ListRawMaterial] CHECK CONSTRAINT [FK_ListRawMaterial_Deliveries]
GO
ALTER TABLE [dbo].[ListRawMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ListRawMaterial_RawMaterial] FOREIGN KEY([ID_Raw])
REFERENCES [dbo].[RawMaterial] ([ID_Row_Material])
GO
ALTER TABLE [dbo].[ListRawMaterial] CHECK CONSTRAINT [FK_ListRawMaterial_RawMaterial]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Filial] FOREIGN KEY([ID_Filial])
REFERENCES [dbo].[Filial] ([ID_Filial])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Filial]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderAddressDelivery] FOREIGN KEY([ID_OrderAddressDelivety])
REFERENCES [dbo].[OrderAddressDelivery] ([ID_OrderAddressDelivery])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderAddressDelivery]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([ID_User])
REFERENCES [dbo].[User] ([ID_User])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList_Order] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Order] ([ID_Order])
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList_Order]
GO
ALTER TABLE [dbo].[OrderList]  WITH CHECK ADD  CONSTRAINT [FK_OrderList_Products] FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Products] ([ID_Products])
GO
ALTER TABLE [dbo].[OrderList] CHECK CONSTRAINT [FK_OrderList_Products]
GO
ALTER TABLE [dbo].[PaymentSaiaries]  WITH CHECK ADD  CONSTRAINT [FK_PaymentSaiaries_Staff] FOREIGN KEY([ID_Staff])
REFERENCES [dbo].[Staff] ([ID_Staff])
GO
ALTER TABLE [dbo].[PaymentSaiaries] CHECK CONSTRAINT [FK_PaymentSaiaries_Staff]
GO
ALTER TABLE [dbo].[ProductsRawMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ProductsRawMaterials_Products] FOREIGN KEY([ID_Products])
REFERENCES [dbo].[Products] ([ID_Products])
GO
ALTER TABLE [dbo].[ProductsRawMaterials] CHECK CONSTRAINT [FK_ProductsRawMaterials_Products]
GO
ALTER TABLE [dbo].[ProductsRawMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ProductsRawMaterials_RawMaterial] FOREIGN KEY([ID_Raw])
REFERENCES [dbo].[RawMaterial] ([ID_Row_Material])
GO
ALTER TABLE [dbo].[ProductsRawMaterials] CHECK CONSTRAINT [FK_ProductsRawMaterials_RawMaterial]
GO
ALTER TABLE [dbo].[ShiftsStaff]  WITH CHECK ADD  CONSTRAINT [FK_Shifts_Staff_Shifts] FOREIGN KEY([ID_Shifts])
REFERENCES [dbo].[Shifts] ([ID_Shifts])
GO
ALTER TABLE [dbo].[ShiftsStaff] CHECK CONSTRAINT [FK_Shifts_Staff_Shifts]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Shifts_Staff] FOREIGN KEY([ID_Shifts_Staff])
REFERENCES [dbo].[ShiftsStaff] ([ID_Shifts_Staff])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Shifts_Staff]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_User] FOREIGN KEY([ID_User])
REFERENCES [dbo].[User] ([ID_User])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles] FOREIGN KEY([ID_Roles])
REFERENCES [dbo].[Roles] ([ID_Roles])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Roles]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_Filial] FOREIGN KEY([ID_Filial])
REFERENCES [dbo].[Filial] ([ID_Filial])
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_Filial]
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse_RawMaterial] FOREIGN KEY([ID_Raw_Materials])
REFERENCES [dbo].[RawMaterial] ([ID_Row_Material])
GO
ALTER TABLE [dbo].[Warehouse] CHECK CONSTRAINT [FK_Warehouse_RawMaterial]
GO
USE [master]
GO
ALTER DATABASE [MonAmie] SET  READ_WRITE 
GO
