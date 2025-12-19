USE [master]
GO
/****** Object:  Database [pr15]    Script Date: 19.12.2025 12:03:23 ******/
CREATE DATABASE [pr15]
GO
ALTER DATABASE [pr15] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pr15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pr15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pr15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pr15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pr15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pr15] SET ARITHABORT OFF 
GO
ALTER DATABASE [pr15] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pr15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pr15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pr15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pr15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pr15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pr15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pr15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pr15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pr15] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pr15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pr15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pr15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pr15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pr15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pr15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pr15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pr15] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pr15] SET  MULTI_USER 
GO
ALTER DATABASE [pr15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pr15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pr15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pr15] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pr15] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pr15] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [pr15] SET QUERY_STORE = ON
GO
ALTER DATABASE [pr15] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [pr15]
GO
/****** Object:  Table [dbo].[brands]    Script Date: 19.12.2025 12:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 19.12.2025 12:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_tags]    Script Date: 19.12.2025 12:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_tags](
	[product_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
 CONSTRAINT [PK_product_tags] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 19.12.2025 12:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[price] [money] NULL,
	[stock] [int] NULL,
	[rating] [decimal](2, 1) NULL,
	[created_at] [date] NULL,
	[category_id] [int] NULL,
	[brand_id] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags]    Script Date: 19.12.2025 12:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
 CONSTRAINT [PK_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brands] ON 
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (1, N'Samsung')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (2, N'Apple')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (3, N'Sony')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (4, N'Lenovo')
GO
INSERT [dbo].[brands] ([id], [name]) VALUES (5, N'Xiaomi')
GO
SET IDENTITY_INSERT [dbo].[brands] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Smartphones')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Laptops')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Accessories')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Tablets')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'TV')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (1, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (1, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (1, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (2, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (2, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (3, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (4, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (5, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (6, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (6, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (7, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (7, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (8, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (9, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (9, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (9, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (10, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (10, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (11, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (11, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (12, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (13, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (13, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (14, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (14, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (15, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (15, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (16, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (16, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (17, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (18, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (19, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (20, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (20, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (21, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (21, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (22, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (23, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (24, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (25, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (26, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (26, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (26, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (27, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (27, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (28, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (28, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (28, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (29, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (30, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (31, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (31, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (32, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (32, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (33, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (33, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (33, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (34, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (34, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (34, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (35, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (35, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (36, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (36, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (37, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (38, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (39, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (39, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (39, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (40, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (40, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (41, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (42, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (43, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (43, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (43, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (44, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (45, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (45, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (45, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (46, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (46, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (46, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (47, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (47, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (47, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (48, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (48, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (49, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (49, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (50, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (50, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (50, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (51, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (51, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (52, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (53, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (53, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (54, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (55, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (56, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (57, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (58, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (59, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (59, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (60, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (60, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (61, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (62, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (63, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (63, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (63, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (64, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (65, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (65, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (66, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (66, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (66, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (67, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (67, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (68, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (69, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (69, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (70, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (71, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (72, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (72, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (72, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (73, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (73, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (74, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (74, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (74, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (75, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (76, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (76, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (77, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (77, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (78, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (78, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (78, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (79, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (79, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (80, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (80, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (81, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (82, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (83, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (83, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (84, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (85, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (85, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (86, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (87, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (88, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (89, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (90, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (91, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (91, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (92, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (93, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (93, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (94, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (95, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (95, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (96, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (96, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (96, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (97, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (98, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (98, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (99, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (99, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (99, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (100, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (100, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (101, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (102, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (102, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (103, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (104, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (105, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (106, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (107, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (107, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (108, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (109, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (110, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (110, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (111, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (111, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (112, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (112, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (113, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (113, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (114, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (115, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (115, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (116, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (116, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (117, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (117, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (118, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (119, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (120, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (121, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (122, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (122, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (123, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (124, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (124, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (124, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (125, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (125, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (126, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (127, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (127, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (128, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (129, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (129, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (129, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (130, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (130, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (131, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (132, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (133, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (134, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (135, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (135, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (136, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (136, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (137, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (137, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (138, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (139, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (140, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (140, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (141, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (142, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (142, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (143, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (143, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (143, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (144, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (145, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (145, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (146, 5)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (147, 4)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (148, 2)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (149, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (149, 3)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (150, 1)
GO
INSERT [dbo].[product_tags] ([product_id], [tag_id]) VALUES (150, 4)
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (1, N'Logitech MX Master 3', N'Latest-generation technology', 167.5600, 307, CAST(4.4 AS Decimal(2, 1)), CAST(N'2024-07-11' AS Date), 3, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (2, N'Lenovo Tab P12', N'High-performance device', 2659.5100, 238, CAST(1.8 AS Decimal(2, 1)), CAST(N'2024-03-06' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (3, N'TCL 6-Series 55', N'High-performance device', 1563.3300, 499, CAST(4.6 AS Decimal(2, 1)), CAST(N'2023-11-05' AS Date), 5, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (4, N'Samsung Galaxy Tab S9', N'Premium build quality', 2007.2600, 437, CAST(3.2 AS Decimal(2, 1)), CAST(N'2024-04-21' AS Date), 4, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (5, N'Samsung Galaxy Tab S9', N'Durable and reliable', 2131.6400, 78, CAST(1.3 AS Decimal(2, 1)), CAST(N'2024-08-17' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (6, N'LG OLED C2 65', N'Durable and reliable', 558.6900, 124, CAST(3.5 AS Decimal(2, 1)), CAST(N'2024-07-06' AS Date), 5, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (7, N'HP Spectre x360', N'Latest-generation technology', 1922.8700, 282, CAST(3.8 AS Decimal(2, 1)), CAST(N'2023-11-17' AS Date), 2, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (8, N'MacBook Pro 16', N'Budget-friendly model', 1575.3000, 121, CAST(2.0 AS Decimal(2, 1)), CAST(N'2024-07-26' AS Date), 2, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (9, N'MacBook Pro 16', N'Compact and lightweight', 2652.6800, 94, CAST(4.5 AS Decimal(2, 1)), CAST(N'2023-12-06' AS Date), 2, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (10, N'Xiaomi Pad 6', N'Durable and reliable', 1224.8500, 150, CAST(4.8 AS Decimal(2, 1)), CAST(N'2023-02-21' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (11, N'Apple AirPods Pro', N'Top-rated by users', 1601.2400, 326, CAST(3.1 AS Decimal(2, 1)), CAST(N'2024-04-12' AS Date), 3, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (12, N'MacBook Pro 16', N'Budget-friendly model', 290.5400, 474, CAST(3.6 AS Decimal(2, 1)), CAST(N'2023-11-15' AS Date), 2, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (13, N'Sony Bravia X90J', N'Compact and lightweight', 1863.9600, 93, CAST(1.4 AS Decimal(2, 1)), CAST(N'2024-03-19' AS Date), 5, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (14, N'Sony Bravia X90J', N'High-performance device', 2197.8900, 394, CAST(4.6 AS Decimal(2, 1)), CAST(N'2023-08-13' AS Date), 5, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (15, N'Huawei P50', N'High-performance device', 2250.0400, 363, CAST(3.3 AS Decimal(2, 1)), CAST(N'2024-07-05' AS Date), 1, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (16, N'Samsung QLED 55', N'Budget-friendly model', 1425.0100, 315, CAST(4.4 AS Decimal(2, 1)), CAST(N'2023-11-23' AS Date), 5, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (17, N'TCL 6-Series 55', N'Durable and reliable', 2850.1100, 411, CAST(1.5 AS Decimal(2, 1)), CAST(N'2023-11-26' AS Date), 5, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (18, N'Xiaomi Pad 6', N'Latest-generation technology', 1752.2500, 231, CAST(3.6 AS Decimal(2, 1)), CAST(N'2023-07-10' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (19, N'iPad Pro 12.9', N'Latest-generation technology', 1643.4800, 281, CAST(4.9 AS Decimal(2, 1)), CAST(N'2023-08-04' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (20, N'Lenovo Tab P12', N'Latest-generation technology', 2836.2000, 234, CAST(2.1 AS Decimal(2, 1)), CAST(N'2023-03-23' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (21, N'LG OLED C2 65', N'High-performance device', 2639.6700, 205, CAST(1.1 AS Decimal(2, 1)), CAST(N'2024-07-09' AS Date), 5, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (22, N'OnePlus 11', N'Latest-generation technology', 376.3700, 274, CAST(3.5 AS Decimal(2, 1)), CAST(N'2024-11-12' AS Date), 1, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (23, N'Samsung Galaxy Buds2', N'High-performance device', 1156.5100, 442, CAST(4.1 AS Decimal(2, 1)), CAST(N'2024-03-26' AS Date), 3, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (24, N'Huawei P50', N'Budget-friendly model', 779.9400, 305, CAST(1.6 AS Decimal(2, 1)), CAST(N'2023-01-16' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (25, N'Xiaomi Mi 12', N'Budget-friendly model', 2184.5500, 430, CAST(1.4 AS Decimal(2, 1)), CAST(N'2023-12-03' AS Date), 1, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (26, N'TCL 6-Series 55', N'Top-rated by users', 1003.3800, 333, CAST(1.6 AS Decimal(2, 1)), CAST(N'2023-02-26' AS Date), 5, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (27, N'OnePlus 11', N'Budget-friendly model', 614.4400, 48, CAST(4.1 AS Decimal(2, 1)), CAST(N'2023-03-20' AS Date), 1, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (28, N'Lenovo ThinkPad X1', N'Budget-friendly model', 516.2200, 429, CAST(4.1 AS Decimal(2, 1)), CAST(N'2023-02-22' AS Date), 2, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (29, N'Apple AirPods Pro', N'High-performance device', 2473.6800, 430, CAST(3.4 AS Decimal(2, 1)), CAST(N'2023-12-04' AS Date), 3, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (30, N'LG OLED C2 65', N'Durable and reliable', 2751.4700, 156, CAST(4.6 AS Decimal(2, 1)), CAST(N'2024-06-04' AS Date), 5, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (31, N'Huawei P50', N'Top-rated by users', 1778.0500, 232, CAST(4.7 AS Decimal(2, 1)), CAST(N'2024-04-21' AS Date), 1, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (32, N'Lenovo ThinkPad X1', N'Top-rated by users', 2683.8400, 32, CAST(1.6 AS Decimal(2, 1)), CAST(N'2024-06-04' AS Date), 2, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (33, N'iPad Pro 12.9', N'Compact and lightweight', 2295.1700, 73, CAST(3.1 AS Decimal(2, 1)), CAST(N'2024-10-14' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (34, N'Huawei P50', N'Top-rated by users', 1136.4300, 45, CAST(4.7 AS Decimal(2, 1)), CAST(N'2024-11-08' AS Date), 1, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (35, N'Samsung QLED 55', N'Durable and reliable', 220.7000, 347, CAST(2.8 AS Decimal(2, 1)), CAST(N'2024-06-21' AS Date), 5, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (36, N'Samsung QLED 55', N'Latest-generation technology', 580.8600, 365, CAST(3.5 AS Decimal(2, 1)), CAST(N'2024-05-14' AS Date), 5, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (37, N'Lenovo Tab P12', N'Latest-generation technology', 1427.5800, 68, CAST(4.5 AS Decimal(2, 1)), CAST(N'2024-01-11' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (38, N'Lenovo Tab P12', N'Top-rated by users', 2748.4200, 364, CAST(4.6 AS Decimal(2, 1)), CAST(N'2023-10-03' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (39, N'Sony Bravia X90J', N'Durable and reliable', 1738.9800, 325, CAST(4.4 AS Decimal(2, 1)), CAST(N'2023-01-29' AS Date), 5, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (40, N'Samsung Galaxy Buds2', N'High-performance device', 2328.5600, 164, CAST(2.8 AS Decimal(2, 1)), CAST(N'2023-03-15' AS Date), 3, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (41, N'iPad Pro 12.9', N'Budget-friendly model', 1534.9700, 281, CAST(2.8 AS Decimal(2, 1)), CAST(N'2024-04-19' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (42, N'MacBook Pro 16', N'Compact and lightweight', 882.3500, 386, CAST(3.2 AS Decimal(2, 1)), CAST(N'2024-11-27' AS Date), 2, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (43, N'Razer BlackShark V2', N'Budget-friendly model', 1894.8800, 344, CAST(4.7 AS Decimal(2, 1)), CAST(N'2023-02-04' AS Date), 3, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (44, N'OnePlus 11', N'High-performance device', 376.3400, 124, CAST(1.6 AS Decimal(2, 1)), CAST(N'2023-10-27' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (45, N'MacBook Pro 16', N'Premium build quality', 2007.2500, 277, CAST(5.0 AS Decimal(2, 1)), CAST(N'2023-03-03' AS Date), 2, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (46, N'Samsung Galaxy Tab S9', N'Premium build quality', 57.9900, 453, CAST(4.4 AS Decimal(2, 1)), CAST(N'2023-08-26' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (47, N'Xiaomi Pad 6', N'Premium build quality', 1157.9200, 285, CAST(2.2 AS Decimal(2, 1)), CAST(N'2023-12-30' AS Date), 4, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (48, N'OnePlus 11', N'Premium build quality', 1348.9600, 34, CAST(4.2 AS Decimal(2, 1)), CAST(N'2023-07-01' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (49, N'Acer Predator', N'Budget-friendly model', 1317.9800, 308, CAST(2.1 AS Decimal(2, 1)), CAST(N'2024-10-13' AS Date), 2, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (50, N'Pixel 8', N'Compact and lightweight', 1202.4800, 170, CAST(4.9 AS Decimal(2, 1)), CAST(N'2023-09-24' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (51, N'OnePlus 11', N'Latest-generation technology', 2473.6000, 323, CAST(2.7 AS Decimal(2, 1)), CAST(N'2024-03-13' AS Date), 1, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (52, N'OnePlus 11', N'Latest-generation technology', 2124.6500, 236, CAST(3.6 AS Decimal(2, 1)), CAST(N'2024-10-13' AS Date), 1, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (53, N'Samsung Galaxy Tab S9', N'Top-rated by users', 1334.1300, 258, CAST(3.4 AS Decimal(2, 1)), CAST(N'2023-09-07' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (54, N'Xiaomi Mi 12', N'Compact and lightweight', 274.2300, 197, CAST(2.1 AS Decimal(2, 1)), CAST(N'2024-05-16' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (55, N'HP Spectre x360', N'Top-rated by users', 1428.1800, 462, CAST(1.9 AS Decimal(2, 1)), CAST(N'2024-03-26' AS Date), 2, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (56, N'Lenovo Tab P12', N'Top-rated by users', 1819.9600, 348, CAST(2.1 AS Decimal(2, 1)), CAST(N'2024-01-28' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (57, N'Galaxy S23', N'Budget-friendly model', 1402.6400, 259, CAST(4.7 AS Decimal(2, 1)), CAST(N'2023-03-12' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (58, N'HP Spectre x360', N'Premium build quality', 677.3000, 381, CAST(1.6 AS Decimal(2, 1)), CAST(N'2024-07-07' AS Date), 2, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (59, N'Galaxy S23', N'Latest-generation technology', 1360.2100, 240, CAST(3.3 AS Decimal(2, 1)), CAST(N'2024-07-05' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (60, N'Lenovo Tab P12', N'Budget-friendly model', 2643.8300, 350, CAST(4.9 AS Decimal(2, 1)), CAST(N'2024-10-22' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (61, N'Lenovo Tab P12', N'Compact and lightweight', 1929.7200, 150, CAST(3.1 AS Decimal(2, 1)), CAST(N'2024-10-24' AS Date), 4, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (62, N'Logitech MX Master 3', N'Latest-generation technology', 734.5700, 154, CAST(1.7 AS Decimal(2, 1)), CAST(N'2024-11-05' AS Date), 3, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (63, N'Pixel 8', N'Budget-friendly model', 908.2300, 32, CAST(2.1 AS Decimal(2, 1)), CAST(N'2024-03-19' AS Date), 1, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (64, N'Lenovo Tab P12', N'Latest-generation technology', 122.9600, 88, CAST(3.9 AS Decimal(2, 1)), CAST(N'2024-11-30' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (65, N'LG OLED C2 65', N'Premium build quality', 2296.6300, 97, CAST(2.3 AS Decimal(2, 1)), CAST(N'2023-07-26' AS Date), 5, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (66, N'HP Spectre x360', N'Compact and lightweight', 2389.9900, 495, CAST(2.5 AS Decimal(2, 1)), CAST(N'2023-08-25' AS Date), 2, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (67, N'TCL 6-Series 55', N'Compact and lightweight', 959.3600, 353, CAST(5.0 AS Decimal(2, 1)), CAST(N'2023-10-01' AS Date), 5, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (68, N'Galaxy S23', N'Compact and lightweight', 590.0800, 86, CAST(2.7 AS Decimal(2, 1)), CAST(N'2024-09-08' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (69, N'Pixel 8', N'Premium build quality', 308.8900, 386, CAST(5.0 AS Decimal(2, 1)), CAST(N'2024-03-08' AS Date), 1, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (70, N'Lenovo ThinkPad X1', N'Durable and reliable', 816.1000, 370, CAST(5.0 AS Decimal(2, 1)), CAST(N'2024-07-26' AS Date), 2, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (71, N'LG OLED C2 65', N'Durable and reliable', 731.1100, 232, CAST(4.4 AS Decimal(2, 1)), CAST(N'2023-11-19' AS Date), 5, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (72, N'iPad Pro 12.9', N'Premium build quality', 818.6100, 76, CAST(1.3 AS Decimal(2, 1)), CAST(N'2024-04-17' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (73, N'Apple AirPods Pro', N'Budget-friendly model', 2159.8600, 136, CAST(1.6 AS Decimal(2, 1)), CAST(N'2023-03-14' AS Date), 3, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (74, N'Samsung Galaxy Tab S9', N'Premium build quality', 792.2500, 294, CAST(2.0 AS Decimal(2, 1)), CAST(N'2024-04-30' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (75, N'OnePlus 11', N'Latest-generation technology', 496.6000, 280, CAST(1.3 AS Decimal(2, 1)), CAST(N'2023-05-13' AS Date), 1, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (76, N'Razer BlackShark V2', N'Premium build quality', 1749.3800, 163, CAST(1.2 AS Decimal(2, 1)), CAST(N'2023-12-27' AS Date), 3, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (77, N'Logitech MX Master 3', N'Top-rated by users', 361.5800, 301, CAST(1.0 AS Decimal(2, 1)), CAST(N'2024-03-30' AS Date), 3, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (78, N'Lenovo Tab P12', N'Premium build quality', 832.9600, 129, CAST(3.2 AS Decimal(2, 1)), CAST(N'2023-09-08' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (79, N'MacBook Pro 16', N'Latest-generation technology', 1967.4900, 472, CAST(3.4 AS Decimal(2, 1)), CAST(N'2023-03-30' AS Date), 2, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (80, N'OnePlus 11', N'Budget-friendly model', 1218.3900, 41, CAST(2.7 AS Decimal(2, 1)), CAST(N'2023-07-09' AS Date), 1, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (81, N'Sony WH-1000XM5', N'Budget-friendly model', 879.1600, 245, CAST(4.7 AS Decimal(2, 1)), CAST(N'2023-11-26' AS Date), 3, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (82, N'LG OLED C2 65', N'High-performance device', 2532.5600, 249, CAST(2.3 AS Decimal(2, 1)), CAST(N'2023-07-15' AS Date), 5, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (83, N'Samsung Galaxy Tab S9', N'Durable and reliable', 1369.3700, 146, CAST(2.8 AS Decimal(2, 1)), CAST(N'2024-01-28' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (84, N'Xiaomi Mi 12', N'Premium build quality', 423.2800, 421, CAST(2.7 AS Decimal(2, 1)), CAST(N'2024-04-22' AS Date), 1, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (85, N'HP Spectre x360', N'High-performance device', 2108.7700, 187, CAST(3.2 AS Decimal(2, 1)), CAST(N'2023-03-02' AS Date), 2, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (86, N'LG OLED C2 65', N'Compact and lightweight', 1240.0600, 392, CAST(2.6 AS Decimal(2, 1)), CAST(N'2024-11-08' AS Date), 5, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (87, N'iPhone 14', N'High-performance device', 400.5300, 426, CAST(4.6 AS Decimal(2, 1)), CAST(N'2024-01-03' AS Date), 1, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (88, N'Xiaomi Pad 6', N'Compact and lightweight', 464.1700, 55, CAST(2.1 AS Decimal(2, 1)), CAST(N'2023-04-07' AS Date), 4, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (89, N'Dell XPS 15', N'Latest-generation technology', 1946.1900, 98, CAST(1.4 AS Decimal(2, 1)), CAST(N'2023-02-15' AS Date), 2, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (90, N'Samsung Galaxy Tab S9', N'Latest-generation technology', 1276.7600, 170, CAST(1.3 AS Decimal(2, 1)), CAST(N'2024-06-10' AS Date), 4, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (91, N'Samsung QLED 55', N'Compact and lightweight', 1463.8500, 40, CAST(1.2 AS Decimal(2, 1)), CAST(N'2023-01-10' AS Date), 5, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (92, N'Sony Bravia X90J', N'Top-rated by users', 1795.8900, 72, CAST(4.6 AS Decimal(2, 1)), CAST(N'2023-07-09' AS Date), 5, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (93, N'Pixel 8', N'Top-rated by users', 1189.0400, 89, CAST(1.3 AS Decimal(2, 1)), CAST(N'2024-01-07' AS Date), 1, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (94, N'Xiaomi Mi 12', N'Latest-generation technology', 1156.0900, 366, CAST(2.5 AS Decimal(2, 1)), CAST(N'2023-05-16' AS Date), 1, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (95, N'Lenovo ThinkPad X1', N'Premium build quality', 2550.2900, 422, CAST(4.3 AS Decimal(2, 1)), CAST(N'2023-05-02' AS Date), 2, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (96, N'Asus ROG Strix', N'Durable and reliable', 2849.2700, 72, CAST(1.3 AS Decimal(2, 1)), CAST(N'2023-12-13' AS Date), 2, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (97, N'Sony WH-1000XM5', N'Budget-friendly model', 833.9700, 419, CAST(2.1 AS Decimal(2, 1)), CAST(N'2024-11-18' AS Date), 3, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (98, N'Lenovo Tab P12', N'Budget-friendly model', 2975.8900, 30, CAST(2.3 AS Decimal(2, 1)), CAST(N'2023-01-15' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (99, N'Samsung QLED 55', N'Budget-friendly model', 1675.0100, 152, CAST(3.4 AS Decimal(2, 1)), CAST(N'2023-03-11' AS Date), 5, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (100, N'Xiaomi Mi 12', N'Latest-generation technology', 2936.8700, 483, CAST(3.5 AS Decimal(2, 1)), CAST(N'2024-06-03' AS Date), 1, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (101, N'iPad Pro 12.9', N'Budget-friendly model', 2586.1900, 263, CAST(4.1 AS Decimal(2, 1)), CAST(N'2023-01-25' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (102, N'Samsung Galaxy Tab S9', N'Compact and lightweight', 968.6500, 438, CAST(3.3 AS Decimal(2, 1)), CAST(N'2023-11-08' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (103, N'iPad Pro 12.9', N'Durable and reliable', 690.5200, 183, CAST(4.3 AS Decimal(2, 1)), CAST(N'2023-02-04' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (104, N'Razer BlackShark V2', N'Premium build quality', 1937.4400, 325, CAST(4.1 AS Decimal(2, 1)), CAST(N'2024-01-31' AS Date), 3, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (105, N'Sony Bravia X90J', N'High-performance device', 1363.0200, 98, CAST(2.7 AS Decimal(2, 1)), CAST(N'2024-05-07' AS Date), 5, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (106, N'Huawei P50', N'High-performance device', 1374.7400, 120, CAST(1.6 AS Decimal(2, 1)), CAST(N'2023-01-18' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (107, N'Samsung Galaxy Tab S9', N'High-performance device', 1275.1200, 23, CAST(4.3 AS Decimal(2, 1)), CAST(N'2023-03-14' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (108, N'MacBook Pro 16', N'High-performance device', 239.6700, 134, CAST(2.3 AS Decimal(2, 1)), CAST(N'2024-10-13' AS Date), 2, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (109, N'HP Spectre x360', N'Latest-generation technology', 1723.7700, 78, CAST(2.8 AS Decimal(2, 1)), CAST(N'2024-01-09' AS Date), 2, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (110, N'iPad Pro 12.9', N'Budget-friendly model', 705.3700, 195, CAST(3.5 AS Decimal(2, 1)), CAST(N'2024-03-14' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (111, N'Xiaomi Mi 12', N'High-performance device', 497.9300, 282, CAST(3.7 AS Decimal(2, 1)), CAST(N'2023-05-01' AS Date), 1, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (112, N'Asus ROG Strix', N'Budget-friendly model', 2619.8600, 319, CAST(1.3 AS Decimal(2, 1)), CAST(N'2024-08-15' AS Date), 2, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (113, N'Samsung Galaxy Buds2', N'Budget-friendly model', 1358.2900, 499, CAST(2.8 AS Decimal(2, 1)), CAST(N'2023-02-13' AS Date), 3, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (114, N'Dell XPS 15', N'Budget-friendly model', 93.5700, 390, CAST(2.2 AS Decimal(2, 1)), CAST(N'2023-11-21' AS Date), 2, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (115, N'Huawei P50', N'Compact and lightweight', 348.2800, 460, CAST(3.4 AS Decimal(2, 1)), CAST(N'2024-09-17' AS Date), 1, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (116, N'Xiaomi Pad 6', N'Top-rated by users', 847.3600, 285, CAST(1.0 AS Decimal(2, 1)), CAST(N'2023-09-17' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (117, N'MacBook Pro 16', N'Compact and lightweight', 983.5800, 145, CAST(2.3 AS Decimal(2, 1)), CAST(N'2024-03-13' AS Date), 2, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (118, N'Pixel 8', N'Budget-friendly model', 2571.0100, 475, CAST(3.0 AS Decimal(2, 1)), CAST(N'2024-06-02' AS Date), 1, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (119, N'Lenovo Tab P12', N'Compact and lightweight', 1716.5900, 485, CAST(1.7 AS Decimal(2, 1)), CAST(N'2024-02-07' AS Date), 4, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (120, N'Huawei P50', N'Top-rated by users', 2939.8800, 495, CAST(4.3 AS Decimal(2, 1)), CAST(N'2023-01-30' AS Date), 1, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (121, N'HP Spectre x360', N'Budget-friendly model', 739.5900, 161, CAST(3.1 AS Decimal(2, 1)), CAST(N'2024-04-13' AS Date), 2, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (122, N'Galaxy S23', N'Compact and lightweight', 2174.9400, 399, CAST(1.5 AS Decimal(2, 1)), CAST(N'2024-06-27' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (123, N'Samsung Galaxy Buds2', N'Premium build quality', 693.0900, 310, CAST(3.8 AS Decimal(2, 1)), CAST(N'2023-06-30' AS Date), 3, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (124, N'Acer Predator', N'Top-rated by users', 297.7200, 36, CAST(4.2 AS Decimal(2, 1)), CAST(N'2024-03-10' AS Date), 2, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (125, N'Xiaomi Pad 6', N'Top-rated by users', 822.8800, 449, CAST(3.7 AS Decimal(2, 1)), CAST(N'2024-03-17' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (126, N'Samsung Galaxy Buds2', N'Durable and reliable', 1290.0900, 141, CAST(2.1 AS Decimal(2, 1)), CAST(N'2023-09-17' AS Date), 3, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (127, N'Samsung QLED 55', N'Premium build quality', 1215.6200, 20, CAST(2.6 AS Decimal(2, 1)), CAST(N'2023-11-30' AS Date), 5, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (128, N'Samsung QLED 55', N'Compact and lightweight', 2564.4000, 104, CAST(3.9 AS Decimal(2, 1)), CAST(N'2024-07-02' AS Date), 5, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (129, N'Lenovo Tab P12', N'Top-rated by users', 1705.7300, 272, CAST(3.1 AS Decimal(2, 1)), CAST(N'2023-11-10' AS Date), 4, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (130, N'iPad Pro 12.9', N'Latest-generation technology', 2525.5100, 453, CAST(4.6 AS Decimal(2, 1)), CAST(N'2023-04-14' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (131, N'Xiaomi Pad 6', N'Latest-generation technology', 1608.0000, 460, CAST(2.2 AS Decimal(2, 1)), CAST(N'2024-05-01' AS Date), 4, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (132, N'Huawei P50', N'Latest-generation technology', 2513.1600, 209, CAST(3.5 AS Decimal(2, 1)), CAST(N'2023-10-23' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (133, N'Samsung Galaxy Tab S9', N'Compact and lightweight', 1825.3900, 187, CAST(1.9 AS Decimal(2, 1)), CAST(N'2023-01-28' AS Date), 4, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (134, N'Logitech MX Master 3', N'Premium build quality', 1219.8300, 293, CAST(3.3 AS Decimal(2, 1)), CAST(N'2023-11-23' AS Date), 3, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (135, N'Razer BlackShark V2', N'Premium build quality', 615.6100, 18, CAST(1.7 AS Decimal(2, 1)), CAST(N'2024-09-10' AS Date), 3, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (136, N'Sony WH-1000XM5', N'Premium build quality', 1335.9700, 7, CAST(3.8 AS Decimal(2, 1)), CAST(N'2023-06-21' AS Date), 3, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (137, N'Razer BlackShark V2', N'Durable and reliable', 2920.9300, 161, CAST(2.3 AS Decimal(2, 1)), CAST(N'2024-10-07' AS Date), 3, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (138, N'Razer BlackShark V2', N'Top-rated by users', 1282.9700, 252, CAST(2.9 AS Decimal(2, 1)), CAST(N'2024-07-21' AS Date), 3, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (139, N'Sony WH-1000XM5', N'Top-rated by users', 2393.2000, 8, CAST(4.9 AS Decimal(2, 1)), CAST(N'2023-09-15' AS Date), 3, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (140, N'Lenovo Tab P12', N'Budget-friendly model', 1534.1200, 275, CAST(2.7 AS Decimal(2, 1)), CAST(N'2023-08-15' AS Date), 4, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (141, N'OnePlus 11', N'Budget-friendly model', 2761.7400, 108, CAST(4.4 AS Decimal(2, 1)), CAST(N'2023-03-22' AS Date), 1, 2)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (142, N'MacBook Pro 16', N'High-performance device', 1530.9700, 181, CAST(3.3 AS Decimal(2, 1)), CAST(N'2024-06-27' AS Date), 2, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (143, N'Asus ROG Strix', N'Compact and lightweight', 1224.7900, 440, CAST(2.4 AS Decimal(2, 1)), CAST(N'2024-09-13' AS Date), 2, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (144, N'iPad Pro 12.9', N'Premium build quality', 1716.7500, 108, CAST(1.3 AS Decimal(2, 1)), CAST(N'2023-07-17' AS Date), 4, 4)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (145, N'Samsung Galaxy Tab S9', N'Budget-friendly model', 2865.9400, 389, CAST(2.4 AS Decimal(2, 1)), CAST(N'2023-05-17' AS Date), 4, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (146, N'Sony Bravia X90J', N'Premium build quality', 1260.8700, 211, CAST(4.8 AS Decimal(2, 1)), CAST(N'2024-07-08' AS Date), 5, 5)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (147, N'Razer BlackShark V2', N'Compact and lightweight', 1664.0700, 125, CAST(3.8 AS Decimal(2, 1)), CAST(N'2023-12-02' AS Date), 3, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (148, N'TCL 6-Series 55', N'Compact and lightweight', 754.0000, 47, CAST(1.7 AS Decimal(2, 1)), CAST(N'2024-03-06' AS Date), 5, 3)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (149, N'Lenovo ThinkPad X1', N'High-performance device', 1775.2700, 379, CAST(1.6 AS Decimal(2, 1)), CAST(N'2023-01-07' AS Date), 2, 1)
GO
INSERT [dbo].[products] ([id], [name], [description], [price], [stock], [rating], [created_at], [category_id], [brand_id]) VALUES (150, N'Xiaomi Pad 6', N'Compact and lightweight', 2488.2100, 167, CAST(4.5 AS Decimal(2, 1)), CAST(N'2024-01-02' AS Date), 4, 1)
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[tags] ON 
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (1, N'New')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (2, N'Popular')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (3, N'Discount')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (4, N'Limited')
GO
INSERT [dbo].[tags] ([id], [name]) VALUES (5, N'TopRated')
GO
SET IDENTITY_INSERT [dbo].[tags] OFF
GO
ALTER TABLE [dbo].[product_tags]  WITH CHECK ADD  CONSTRAINT [FK_product_tags_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[product_tags] CHECK CONSTRAINT [FK_product_tags_products]
GO
ALTER TABLE [dbo].[product_tags]  WITH CHECK ADD  CONSTRAINT [FK_product_tags_tags] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tags] ([id])
GO
ALTER TABLE [dbo].[product_tags] CHECK CONSTRAINT [FK_product_tags_tags]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brands] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_brands]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories]
GO
USE [master]
GO
ALTER DATABASE [pr15] SET  READ_WRITE 
GO
