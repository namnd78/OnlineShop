USE [master];
GO
/****** Object:  Database [ProjectPRJ301]    Script Date: 7/19/2022 8:14:41 AM ******/
CREATE DATABASE [ProjectPRJ301] CONTAINMENT = NONE
ON PRIMARY (NAME = N'ProjectPRJ301',
            FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DNAM\MSSQL\DATA\ProjectPRJ301.mdf',
            SIZE = 8192KB,
            MAXSIZE = UNLIMITED,
            FILEGROWTH = 65536KB)
LOG ON (NAME = N'ProjectPRJ301_log',
        FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DNAM\MSSQL\DATA\ProjectPRJ301_log.ldf',
        SIZE = 8192KB,
        MAXSIZE = 2048GB,
        FILEGROWTH = 65536KB)
WITH CATALOG_COLLATION=DATABASE_DEFAULT;
GO
ALTER DATABASE [ProjectPRJ301] SET COMPATIBILITY_LEVEL = 150;
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
    EXEC [ProjectPRJ301].[dbo].[sp_fulltext_database] @action = 'enable';
END;
GO
ALTER DATABASE [ProjectPRJ301] SET ANSI_NULL_DEFAULT OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET ANSI_NULLS OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET ANSI_PADDING OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET ANSI_WARNINGS OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET ARITHABORT OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET AUTO_CLOSE OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET AUTO_SHRINK OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET AUTO_UPDATE_STATISTICS ON;
GO
ALTER DATABASE [ProjectPRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET CURSOR_DEFAULT GLOBAL;
GO
ALTER DATABASE [ProjectPRJ301] SET CONCAT_NULL_YIELDS_NULL OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET NUMERIC_ROUNDABORT OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET QUOTED_IDENTIFIER OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET RECURSIVE_TRIGGERS OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET DISABLE_BROKER;
GO
ALTER DATABASE [ProjectPRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET TRUSTWORTHY OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET PARAMETERIZATION SIMPLE;
GO
ALTER DATABASE [ProjectPRJ301] SET READ_COMMITTED_SNAPSHOT OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET HONOR_BROKER_PRIORITY OFF;
GO
ALTER DATABASE [ProjectPRJ301] SET RECOVERY FULL;
GO
ALTER DATABASE [ProjectPRJ301] SET MULTI_USER;
GO
ALTER DATABASE [ProjectPRJ301] SET PAGE_VERIFY CHECKSUM;
GO
ALTER DATABASE [ProjectPRJ301] SET DB_CHAINING OFF;
GO
ALTER DATABASE [ProjectPRJ301]
SET FILESTREAM (NON_TRANSACTED_ACCESS = OFF);
GO
ALTER DATABASE [ProjectPRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS;
GO
ALTER DATABASE [ProjectPRJ301] SET DELAYED_DURABILITY = DISABLED;
GO
ALTER DATABASE [ProjectPRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF;
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProjectPRJ301', N'ON';
GO
ALTER DATABASE [ProjectPRJ301] SET QUERY_STORE = OFF;
GO
USE [ProjectPRJ301];
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[account] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                              [username] [NVARCHAR](255) NOT NULL,
                              [password] [NVARCHAR](255) NOT NULL,
                              [email] [NVARCHAR](255) NOT NULL,
                              [fullname] [NVARCHAR](255) NULL,
                              [dob] [DATE] NULL,
                              [phone] [NVARCHAR](20) NULL,
                              [avatar] [NVARCHAR](255) NULL,
                              [amount] [MONEY] NULL,
                              [role] [INT] NULL,
                              PRIMARY KEY CLUSTERED ([id] ASC)
                              WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                    ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
/****** Object:  Table [dbo].[brand]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[brand] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                            [name] [NVARCHAR](255) NULL,
                            PRIMARY KEY CLUSTERED ([id] ASC)
                            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                  ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
/****** Object:  Table [dbo].[category]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[category] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                               [name] [NVARCHAR](255) NULL,
                               PRIMARY KEY CLUSTERED ([id] ASC)
                               WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                     ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
/****** Object:  Table [dbo].[image]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[image] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                            [image] [NVARCHAR](255) NULL,
                            [productId] [INT] NULL,
                            PRIMARY KEY CLUSTERED ([id] ASC)
                            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                  ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
/****** Object:  Table [dbo].[order]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[order] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                            [accountId] [INT] NULL,
                            [stateId] [INT] NULL,
                            [address] [NVARCHAR](500) NULL,
                            [transportId] [INT] NULL,
                            [orderTime] [DATETIME] NULL,
                            [total] [MONEY] NULL,
                            PRIMARY KEY CLUSTERED ([id] ASC)
                            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                  ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[orderDetail] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                                  [orderId] [INT] NULL,
                                  [productId] [INT] NULL,
                                  [quantity] [INT] NULL,
                                  [price] [MONEY] NULL,
                                  [discount] [INT] NULL,
                                  PRIMARY KEY CLUSTERED ([id] ASC)
                                  WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                        ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
/****** Object:  Table [dbo].[orderState]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[orderState] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                                 [name] [NVARCHAR](255) NULL,
                                 PRIMARY KEY CLUSTERED ([id] ASC)
                                 WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                       ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[product] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                              [name] [NVARCHAR](255) NULL,
                              [categoryId] [INT] NULL,
                              [brandId] [INT] NULL,
                              [releaseDate] [DATE] NULL,
                              [description] [NVARCHAR](MAX) NULL,
                              [specification] [NVARCHAR](MAX) NULL,
                              [price] [MONEY] NULL,
                              [discount] [INT] NULL,
                              [quantity] [INT] NULL,
                              [stateId] [INT] NULL,
                              PRIMARY KEY CLUSTERED ([id] ASC)
                              WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                    ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO
/****** Object:  Table [dbo].[state]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[state] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                            [name] [NVARCHAR](255) NULL,
                            PRIMARY KEY CLUSTERED ([id] ASC)
                            WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                  ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
/****** Object:  Table [dbo].[transport]    Script Date: 7/19/2022 8:14:41 AM ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[transport] ([id] [INT] IDENTITY(1, 1) NOT NULL,
                                [name] [NVARCHAR](255) NULL,
                                [price] [MONEY] NULL,
                                PRIMARY KEY CLUSTERED ([id] ASC)
                                WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
                                      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]) ON [PRIMARY];
GO
SET IDENTITY_INSERT [dbo].[account] ON;

INSERT [dbo].[account] ([id],
                        [username],
                        [password],
                        [email],
                        [fullname],
                        [dob],
                        [phone],
                        [avatar],
                        [amount],
                        [role])
VALUES (1, N'namnd123', N'123456', N'namnd1@gmail.com', N'Nguyen Duy Nam', CAST(N'2002-01-21' AS DATE), N'0123456789',
        N'2.png', 75457000.0000, 0);
INSERT [dbo].[account] ([id],
                        [username],
                        [password],
                        [email],
                        [fullname],
                        [dob],
                        [phone],
                        [avatar],
                        [amount],
                        [role])
VALUES (2, N'namnd0', N'123456', N'namnd0@gmail.com', N'Nguyen Duy Nam', CAST(N'2000-01-01' AS DATE), N'0123456789',
        N'default.png', 100000000.0000, 1);
INSERT [dbo].[account] ([id],
                        [username],
                        [password],
                        [email],
                        [fullname],
                        [dob],
                        [phone],
                        [avatar],
                        [amount],
                        [role])
VALUES (3, N'namnd2', N'123456', N'namnd2@gmail.com', N'Nguyen Duy Nam', CAST(N'2000-01-01' AS DATE), N'0123456789',
        N'default.png', 100000000.0000, 0);
INSERT [dbo].[account] ([id],
                        [username],
                        [password],
                        [email],
                        [fullname],
                        [dob],
                        [phone],
                        [avatar],
                        [amount],
                        [role])
VALUES (4, N'namnd03', N'123456', N'namnd3@gmail.com', N'Nguyen Duy Nam', CAST(N'2000-01-01' AS DATE), N'0123456789',
        N'default.png', 100000000.0000, 0);
SET IDENTITY_INSERT [dbo].[account] OFF;
GO
SET IDENTITY_INSERT [dbo].[brand] ON;

INSERT [dbo].[brand] ([id],
                      [name])
VALUES (1, N'Apple');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (2, N'Samsung');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (3, N'OPPO');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (4, N'Xiaomi');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (5, N'Vivo');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (6, N'Tecno');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (7, N'Nokia');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (8, N'Realme');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (9, N'Lenovo');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (10, N'Masstel');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (11, N'Huawei');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (12, N'Garmin');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (13, N'Anker');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (14, N'iValue');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (15, N'UmeTravel');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (16, N'Veger');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (17, N'Belkin');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (18, N'Hyperdrive');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (19, N'Sony');
INSERT [dbo].[brand] ([id],
                      [name])
VALUES (20, N'JBL');
SET IDENTITY_INSERT [dbo].[brand] OFF;
GO
SET IDENTITY_INSERT [dbo].[category] ON;

INSERT [dbo].[category] ([id],
                         [name])
VALUES (1, N'Smartphone');
INSERT [dbo].[category] ([id],
                         [name])
VALUES (2, N'Tablet');
INSERT [dbo].[category] ([id],
                         [name])
VALUES (3, N'Smartwatch');
INSERT [dbo].[category] ([id],
                         [name])
VALUES (4, N'Accessories');
INSERT [dbo].[category] ([id],
                         [name])
VALUES (7, N'abc');
SET IDENTITY_INSERT [dbo].[category] OFF;
GO
SET IDENTITY_INSERT [dbo].[image] ON;

INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (1, N'iphone11-64gb-1.webp', 1);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (2, N'iphone11-64gb-2.webp', 1);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (3, N'iphone11-64gb-3.webp', 1);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (4, N'iphone11-64gb-4.webp', 1);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (5, N'iphone-12-12-mini-1.webp', 2);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (6, N'iphone-12-12-mini-2.webp', 2);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (7, N'iphone-12-12-mini-3.webp', 2);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (8, N'iPhone 13 pro 1.webp', 4);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (9, N'iPhone 13 pro 2.webp', 4);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (10, N'iPhone 13 pro 3.webp', 4);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (11, N'iPhone 13 Promax 1.webp', 5);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (12, N'iPhone 13 Promax 2.webp', 5);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (13, N'iPhone 13 Promax 3.webp', 5);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (14, N'iphone-13-mini-1.webp', 3);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (15, N'iphone-13-mini-2.webp', 3);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (16, N'iphone-13-mini-3.webp', 3);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (17, N'samsung-a52-den-1.webp', 6);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (18, N'samsung-a52-den-2.webp', 6);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (19, N'samsung-a52-den-3.webp', 6);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (20, N'Samsung-galaxy-s22-ultr 1.webp', 7);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (21, N'Samsung-galaxy-s22-ultr 2.webp', 7);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (22, N'Samsung-galaxy-s22-ultr 3.webp', 7);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (23, N'samsungalaxy-s22-plus-1.webp', 8);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (24, N'samsungalaxy-s22-plus-2.webp', 8);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (25, N'samsungalaxy-s22-plus-3.webp', 8);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (26, N'galaxy-flip-3-1.webp', 9);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (27, N'galaxy-flip-3-2.webp', 9);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (28, N'galaxy-flip-3-3.webp', 9);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (29, N'zfold3-1.webp', 10);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (30, N'zfold3-2.webp', 10);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (31, N'zfold3-3.webp', 10);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (32, N'samsung-galaxy-s20-fe-1.webp', 11);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (33, N'samsung-galaxy-s20-fe-2.webp', 11);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (34, N'samsung-galaxy-s20-fe-3.webp', 11);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (35, N'oppo-reno7-4g-1.webp', 12);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (36, N'oppo-reno7-4g-2.webp', 12);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (37, N'oppo-reno7-4g-3.webp', 12);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (38, N'oppo-reno7-z-5g-1.webp', 13);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (39, N'oppo-reno7-z-5g-2.webp', 13);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (40, N'oppo-reno7-z-5g-3.webp', 13);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (41, N'oppo-find-x3-pro-1.webp', 14);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (42, N'oppo-find-x3-pro-2.webp', 14);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (43, N'oppo-find-x3-pro-3.webp', 14);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (44, N'Oppo Reno6 5G-1.webp', 15);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (45, N'Oppo Reno6 5G-2.webp', 15);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (46, N'Oppo Reno6 5G-3.webp', 15);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (47, N'OPPO A95 8GB-128GB-1.webp', 16);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (48, N'OPPO A95 8GB-128GB-2.webp', 16);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (49, N'OPPO A95 8GB-128GB-3.webp', 16);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (50, N'OPPO A55 4GB-64GB 1.webp', 17);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (51, N'OPPO A55 4GB-64GB 2.webp', 17);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (52, N'OPPO A55 4GB-64GB 3.webp', 17);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (53, N'OPPO A16k 3GB-32GB 1.webp', 18);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (54, N'OPPO A16k 3GB-32GB 2.webp', 18);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (55, N'OPPO A16k 3GB-32GB 3.webp', 18);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (56, N'OPPO A94 8GB-128GB-1.webp', 19);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (57, N'OPPO A94 8GB-128GB-2.webp', 19);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (58, N'OPPO A94 8GB-128GB-3.webp', 19);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (59, N'Xiaomi Redmi Note 11 4GB-1.webp', 20);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (60, N'Xiaomi Redmi Note 11 4GB-2.webp', 20);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (61, N'Xiaomi Redmi Note 11 4GB-3.webp', 20);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (62, N'Xiaomi Redmi Note 11S 6GB-1.webp', 21);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (63, N'Xiaomi Redmi Note 11S 6GB-2.webp', 21);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (64, N'Xiaomi Redmi Note 11S 6GB-3.webp', 21);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (65, N'Xiaomi 11T Pro 5G 12GB-1.webp', 22);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (66, N'Xiaomi 11T Pro 5G 12GB-2.webp', 22);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (67, N'Xiaomi 11T Pro 5G 12GB-3.webp', 22);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (68, N'Xiaomi Redmi Note 11 Pro 8GB-1.webp', 23);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (69, N'Xiaomi Redmi Note 11 Pro 8GB-2.webp', 23);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (70, N'Xiaomi Redmi Note 11 Pro 8GB-3.webp', 23);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (71, N'Xiaomi Redmi Note 10S 8GB-1.webp', 24);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (72, N'Xiaomi Redmi Note 10S 8GB-2.webp', 24);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (73, N'Xiaomi Redmi Note 10S 8GB-3.webp', 24);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (74, N'Xiaomi 12 Pro 12GB-1.webp', 25);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (75, N'Xiaomi 12 Pro 12GB-2.webp', 25);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (76, N'Xiaomi 12 Pro 12GB-3.webp', 25);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (77, N'Xiaomi 11 Lite 5G NE 8GB - 256GB-1.webp', 26);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (78, N'Xiaomi 11 Lite 5G NE 8GB - 256GB-2.webp', 26);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (79, N'Xiaomi 11 Lite 5G NE 8GB - 256GB-3.webp', 26);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (80, N'Xiaomi Redmi 10C 4GB - 128GB-1.webp', 27);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (81, N'Xiaomi Redmi 10C 4GB - 128GB-2.webp', 27);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (82, N'Xiaomi Redmi 10C 4GB - 128GB-3.webp', 27);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (83, N'Xiaomi Redmi 9A 2GB-32GB1.webp', 28);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (84, N'Xiaomi Redmi 9A 2GB-32GB2.webp', 28);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (85, N'Xiaomi Redmi 9A 2GB-32GB3.webp', 28);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (86, N'Xiaomi 12 8GB - 256GB1.webp', 29);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (87, N'Xiaomi 12 8GB - 256GB2.webp', 29);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (88, N'Xiaomi 12 8GB - 256GB3.webp', 29);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (89, N'Vivo V23 5G1.webp', 30);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (90, N'Vivo V23 5G2.webp', 30);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (91, N'Vivo V23 5G3.webp', 30);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (92, N'Vivo V23e 8GB - 128GB1.webp', 31);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (93, N'Vivo V23e 8GB - 128GB2.webp', 31);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (94, N'Vivo V23e 8GB - 128GB3.webp', 31);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (95, N'Vivo Y33s 8GB - 128GB1.webp', 32);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (96, N'Vivo Y33s 8GB - 128GB2.webp', 32);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (97, N'Vivo Y33s 8GB - 128GB3.webp', 32);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (98, N'Vivo Y53s 8GB+3GB - 128GB1.webp', 33);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (99, N'Vivo Y53s 8GB+3GB - 128GB2.webp', 33);
GO
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (100, N'Vivo Y53s 8GB+3GB - 128GB3.webp', 33);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (101, N'Vivo Y15s 3GB - 32GB1.webp', 34);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (102, N'Vivo Y15s 3GB - 32GB2.webp', 34);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (103, N'Vivo Y15s 3GB - 32GB3.webp', 34);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (104, N'Vivo Y21s 4GB+1GB - 128GB1.webp', 35);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (105, N'Vivo Y21s 4GB+1GB - 128GB2.webp', 35);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (106, N'Vivo Y21s 4GB+1GB - 128GB3.webp', 35);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (107, N'TECNO POVA 2 4GB-64GB1.webp', 36);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (108, N'TECNO POVA 2 4GB-64GB2.webp', 36);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (109, N'TECNO POVA 2 4GB-64GB3.webp', 36);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (110, N'TECNO SPARK 7T 4GB-64GB1.webp', 37);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (111, N'TECNO SPARK 7T 4GB-64GB2.webp', 37);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (112, N'TECNO SPARK 7T 4GB-64GB3.webp', 37);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (113, N'TECNO POP 5 2GB-32GB1.webp', 38);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (114, N'TECNO POP 5 2GB-32GB2.webp', 38);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (115, N'TECNO POP 5 2GB-32GB3.webp', 38);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (116, N'Nokia G21 6GB-128GB1.webp', 39);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (117, N'Nokia G21 6GB-128GB2.webp', 39);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (118, N'Nokia G21 6GB-128GB3.webp', 39);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (119, N'Nokia C30 3GB-32GB1.webp', 40);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (120, N'Nokia C30 3GB-32GB2.webp', 40);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (121, N'Nokia C30 3GB-32GB3.webp', 40);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (122, N'Nokia C21 Plus 3GB-32GB1.webp', 41);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (123, N'Nokia C21 Plus 3GB-32GB2.webp', 41);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (124, N'Nokia C21 Plus 3GB-32GB3.webp', 41);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (125, N'Realme 9 Pro 5G 8G-128GB1.webp', 42);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (126, N'Realme 9 Pro 5G 8G-128GB2.webp', 42);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (127, N'Realme 9 Pro 5G 8G-128GB3.webp', 42);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (128, N'Realme 8 Pro 8GB - 128GB1.webp', 43);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (129, N'Realme 8 Pro 8GB - 128GB2.webp', 43);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (130, N'Realme 8 Pro 8GB - 128GB3.webp', 43);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (131, N'Realme C25y 4GB-128GB1.webp', 44);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (132, N'Realme C25y 4GB-128GB2.webp', 44);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (133, N'Realme C25y 4GB-128GB3.webp', 44);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (134, N'Realme C21y 3GB - 32GB1.webp', 45);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (135, N'Realme C21y 3GB - 32GB2.webp', 45);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (136, N'Realme C21y 3GB - 32GB3.webp', 45);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (137, N'Realme C35 4GB-128GB1.webp', 46);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (138, N'Realme C35 4GB-128GB2.webp', 46);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (139, N'Realme C35 4GB-128GB3.webp', 46);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (140, N'iPad Pro 11 2021 M1 Wi-Fi 1TB1.webp', 47);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (141, N'iPad Pro 11 2021 M1 Wi-Fi 1TB2.webp', 47);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (142, N'iPad Pro 11 2021 M1 Wi-Fi 1TB3.webp', 47);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (143, N'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB1.webp', 48);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (144, N'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB2.webp', 48);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (145, N'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB3.webp', 48);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (146, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB1.webp', 49);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (147, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB2.webp', 49);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (148, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB3.webp', 49);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (149, N'iPad Mini 6 2021 8.3 inch WiFi 256GB1.webp', 50);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (150, N'iPad Mini 6 2021 8.3 inch WiFi 256GB2.webp', 50);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (151, N'iPad Mini 6 2021 8.3 inch WiFi 256GB3.webp', 50);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (152, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB1.webp', 51);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (153, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB2.webp', 51);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (154, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB3.webp', 51);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (155, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 64GB1.webp', 52);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (156, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 64GB2.webp', 52);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (157, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 64GB3.webp', 52);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (158, N'Samsung Galaxy Tab S8 Ultra1.webp', 53);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (159, N'Samsung Galaxy Tab S8 Ultra2.webp', 53);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (160, N'Samsung Galaxy Tab S8 Ultra3.webp', 53);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (161, N'Samsung Galaxy Tab S8 Plus1.webp', 54);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (162, N'Samsung Galaxy Tab S8 Plus2.webp', 54);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (163, N'Samsung Galaxy Tab S8 Plus3.webp', 54);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (164, N'Samsung Galaxy Tab S7 FE1.webp', 55);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (165, N'Samsung Galaxy Tab S7 FE2.webp', 55);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (166, N'Samsung Galaxy Tab S7 FE3.webp', 55);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (167, N'Samsung Galaxy Tab S6 Lite 20221.webp', 56);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (168, N'Samsung Galaxy Tab S6 Lite 20222.webp', 56);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (169, N'Samsung Galaxy Tab S6 Lite 20223.webp', 56);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (170, N'Samsung Galaxy Tab A8 20221.webp', 57);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (171, N'Samsung Galaxy Tab A8 20222.webp', 57);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (172, N'Samsung Galaxy Tab A8 20223.webp', 57);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (173, N'Samsung Galaxy Tab A7 Lite1.webp', 58);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (174, N'Samsung Galaxy Tab A7 Lite2.webp', 58);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (175, N'Samsung Galaxy Tab A7 Lite3.webp', 58);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (176, N'Masstel Tab 10M 4G1.webp', 59);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (177, N'Masstel Tab 10M 4G2.webp', 59);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (178, N'Masstel Tab 10M 4G3.webp', 59);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (179, N'Masstel Tab 10 Wifi1.webp', 60);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (180, N'Masstel Tab 10 Wifi2.webp', 60);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (181, N'Masstel Tab 10 Wifi3.webp', 60);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (182, N'Lenovo Tab P11 Pro WI-FI 4G 128GB1.webp', 61);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (183, N'Lenovo Tab P11 Pro WI-FI 4G 128GB2.webp', 61);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (184, N'Lenovo Tab P11 Pro WI-FI 4G 128GB3.webp', 61);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (185, N'Lenovo Tab M10 32GB (Gen 2)1.webp', 62);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (186, N'Lenovo Tab M10 32GB (Gen 2)2.webp', 62);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (187, N'Lenovo Tab M10 32GB (Gen 2)3.webp', 62);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (188, N'Lenovo Tab M8-Gen 21.webp', 63);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (189, N'Lenovo Tab M8-Gen 22.webp', 63);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (190, N'Lenovo Tab M8-Gen 23.webp', 63);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (191, N'Apple Watch Series 7 GPS + Cellular 41mm Steel Wire Bezel1.webp', 64);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (192, N'Apple Watch Series 7 GPS + Cellular 41mm Steel Wire Bezel2.webp', 64);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (193, N'Apple Watch Series 7 GPS + Cellular 41mm Steel Wire Bezel3.webp', 64);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (194, N'Apple Watch Series 7 GPS 41mm Aluminum Trim Rubber Band1.webp', 65);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (195, N'Apple Watch Series 7 GPS 41mm Aluminum Trim Rubber Band2.webp', 65);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (196, N'Apple Watch Series 7 GPS 41mm Aluminum Trim Rubber Band3.webp', 65);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (197, N'Apple Watch SE GPS + Cellular 44mm Aluminum Bezel Wire Sport Loop1.webp', 66);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (198, N'Apple Watch SE GPS + Cellular 44mm Aluminum Bezel Wire Sport Loop2.webp', 66);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (199, N'Apple Watch SE GPS + Cellular 44mm Aluminum Bezel Wire Sport Loop3.webp', 66);
GO
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (200, N'Apple Watch SE GPS 40mm Aluminum Trim Rubber Band1.webp', 67);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (201, N'Apple Watch SE GPS 40mm Aluminum Trim Rubber Band2.webp', 67);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (202, N'Apple Watch SE GPS 40mm Aluminum Trim Rubber Band3.webp', 67);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (203, N'Apple Watch Series 3 GPS 38mm Aluminum Trim Rubber Band1.webp', 68);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (204, N'Apple Watch Series 3 GPS 38mm Aluminum Trim Rubber Band2.webp', 68);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (205, N'Apple Watch Series 3 GPS 38mm Aluminum Trim Rubber Band3.webp', 68);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (206, N'Apple Watch Nike Series 7 GPS + Cellular 41mm Aluminum Trim Rubber Band1.webp', 69);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (207, N'Apple Watch Nike Series 7 GPS + Cellular 41mm Aluminum Trim Rubber Band2.webp', 69);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (208, N'Apple Watch Nike Series 7 GPS + Cellular 41mm Aluminum Trim Rubber Band3.webp', 69);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (209, N'Garmin MARQ Smartwatch, Aviator1.webp', 70);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (210, N'Garmin MARQ Smartwatch, Aviator2.webp', 70);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (211, N'Garmin MARQ Smartwatch, Aviator3.webp', 70);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (212, N'Garmin Venu Sq Smartwatch1.webp', 71);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (213, N'Garmin Venu Sq Smartwatch2.webp', 71);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (214, N'Garmin Venu Sq Smartwatch3.webp', 71);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (215, N'Garmin Instinct 2S Smartwatch, Camo PatternEd Version1.webp', 72);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (216, N'Garmin Instinct 2S Smartwatch, Camo PatternEd Version2.webp', 72);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (217, N'Garmin Instinct 2S Smartwatch, Camo PatternEd Version3.webp', 72);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (218, N'Garmin Vivomove 3S smartwatch1.webp', 73);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (219, N'Garmin Vivomove 3S smartwatch2.webp', 73);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (220, N'Garmin Vivomove 3S smartwatch3.webp', 73);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (221, N'Garmin Fenix 7S Smartwatch, Sapphire, Solar, Titanium Yellow Pink1.webp', 74);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (222, N'Garmin Fenix 7S Smartwatch, Sapphire, Solar, Titanium Yellow Pink2.webp', 74);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (223, N'Garmin Fenix 7S Smartwatch, Sapphire, Solar, Titanium Yellow Pink3.webp', 74);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (224, N'Mi Band 6 Smart Bracelet1.webp', 75);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (225, N'Mi Band 6 Smart Bracelet2.webp', 75);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (226, N'Mi Band 6 Smart Bracelet3.webp', 75);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (227, N'Xiaomi Redmi Watch 2 Lite1.webp', 76);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (228, N'Xiaomi Redmi Watch 2 Lite2.webp', 76);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (229, N'Xiaomi Redmi Watch 2 Lite3.webp', 76);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (230, N'Xiaomi Watch S1 Active Smartwatch1.webp', 77);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (231, N'Xiaomi Watch S1 Active Smartwatch2.webp', 77);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (232, N'Xiaomi Watch S1 Active Smartwatch3.webp', 77);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (233, N'Samsung Galaxy Watch 4 40mm1.webp', 78);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (234, N'Samsung Galaxy Watch 4 40mm2.webp', 78);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (235, N'Samsung Galaxy Watch 4 40mm3.webp', 78);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (236, N'Samsung Galaxy Watch 4 Classic 46mm1.webp', 79);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (237, N'Samsung Galaxy Watch 4 Classic 46mm2.webp', 79);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (238, N'Samsung Galaxy Watch 4 Classic 46mm3.webp', 79);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (239, N'Super Hero 4G Childrens Locator Watch1.webp', 80);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (240, N'Super Hero 4G Childrens Locator Watch2.webp', 80);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (241, N'Super Hero 4G Childrens Locator Watch3.webp', 80);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (242, N'OPPO Band Smart Bracelet (OB19B1)1.webp', 81);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (243, N'OPPO Band Smart Bracelet (OB19B1)2.webp', 81);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (244, N'OPPO Band Smart Bracelet (OB19B1)3.webp', 81);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (245, N'Huawei Watch Fit1.webp', 82);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (246, N'Huawei Watch Fit2.webp', 82);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (247, N'Huawei Watch Fit3.webp', 82);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (248, N'Anker PowerCore Select 10000mAh A1223.webp', 83);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (249, N'Anker PowerCore Slim 10000mAh PD - A1231.webp', 84);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (250, N'Anker PowerCore 20000mAh Speed QC 3.0.webp', 85);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (251, N'Samsung Battery Pack 10,000 mAh.webp', 86);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (252, N'Ivalue 20000mAh MT-P200-001 (HK-108).webp', 87);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (253, N'ivalue 10000mAh Y1-5 Port Micro & Type-C.webp', 88);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (254, N'UmeTravel 10000mAH PW1 Wireless.webp', 89);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (255, N'UmeTravel 20000mAh TRIP20000 Quick Charge.webp', 90);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (256, N'Veger 10000mAh L10 PD&QC3.0.webp', 91);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (257, N'Anker 20W Powerport III A2033 Fast Charger.webp', 92);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (258, N'USB-C to Lightning Anker PowerLine Select A8613.webp', 93);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (259, N'MagSafe Duo Charger Double Charging Dock.webp', 94);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (260, N'USB-C to Lightning Apple Cable.webp', 95);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (261, N'Apple Power Adapter 20W Type-C Charger.webp', 96);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (262, N'Belkin 37W 2 Port Fast Charger (USB-C PD 25W + USB-A 12W).webp', 97);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (263, N'Belkin Playa MFI Lightning Cable 1m PVC Shell.webp', 98);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (264, N'UmeTravel 18W A3X 1 Port Fast Charger.webp', 99);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (265, N'UmeTravel Military fibre C3L Lightning Cable.webp', 100);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (266, N'Type-C UmeTravel Military fibre C1 1m Cable.webp', 101);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (267, N'TWS Anker Soundcore Liberty Air 2 Bluetooth Headphones - A39101.webp', 102);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (268, N'TWS Anker Soundcore Liberty Air 2 Bluetooth Headphones - A39102.webp', 102);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (269, N'TWS Anker Soundcore Liberty Air 2 Bluetooth Headphones - A39103.webp', 102);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (270, N'AirPods Pro1.webp', 103);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (271, N'AirPods Pro2.webp', 103);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (272, N'AirPods Pro3.webp', 103);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (273, N'EarPods with Lightning Connector2.webp', 104);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (274, N'Ivalue BT008 Bluetooth Headphones.webp', 105);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (275, N'Sony Extra Bass MDR-EX155AP earbuds.webp', 106);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (276, N'JBL T115TWSREDAS Bluetooth Headphones1.webp', 107);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (277, N'JBL T115TWSREDAS Bluetooth Headphones2.webp', 107);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (278, N'JBL T115TWSREDAS Bluetooth Headphones3.webp', 107);
INSERT [dbo].[image] ([id],
                      [image],
                      [productId])
VALUES (279, N'JBL QUANTUM50BLKAS earbuds with mic.webp', 108);
SET IDENTITY_INSERT [dbo].[image] OFF;
GO
SET IDENTITY_INSERT [dbo].[order] ON;

INSERT [dbo].[order] ([id],
                      [accountId],
                      [stateId],
                      [address],
                      [transportId],
                      [orderTime],
                      [total])
VALUES (1, 1, 1, N'Ha Noi', 1, CAST(N'2022-07-14T03:34:55.107' AS DATETIME), 70169000.0000);
INSERT [dbo].[order] ([id],
                      [accountId],
                      [stateId],
                      [address],
                      [transportId],
                      [orderTime],
                      [total])
VALUES (2, 1, 1, N'Ha Noi', 1, CAST(N'2022-07-14T03:36:53.230' AS DATETIME), 34721000.0000);
INSERT [dbo].[order] ([id],
                      [accountId],
                      [stateId],
                      [address],
                      [transportId],
                      [orderTime],
                      [total])
VALUES (3, 1, 1, N'Ha Noi', 1, CAST(N'2022-07-14T07:34:54.760' AS DATETIME), 55261000.0000);
INSERT [dbo].[order] ([id],
                      [accountId],
                      [stateId],
                      [address],
                      [transportId],
                      [orderTime],
                      [total])
VALUES (4, 1, 1, N'Hanoi', 1, CAST(N'2022-07-19T07:43:42.883' AS DATETIME), 9902000.0000);
SET IDENTITY_INSERT [dbo].[order] OFF;
GO
SET IDENTITY_INSERT [dbo].[orderDetail] ON;

INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (1, 1, 53, 1, 30990000.0000, 0);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (2, 1, 103, 1, 4799000.0000, 20);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (3, 1, 4, 1, 27271000.0000, 12);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (4, 1, 67, 1, 6749000.0000, 25);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (5, 1, 92, 1, 360000.0000, 10);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (6, 2, 44, 1, 3771000.0000, 10);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (7, 2, 11, 2, 15025000.0000, 3);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (8, 2, 84, 1, 900000.0000, 10);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (9, 3, 103, 1, 4799000.0000, 20);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (10, 3, 69, 1, 13790000.0000, 8);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (11, 3, 39, 1, 4314000.0000, 6);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (12, 3, 50, 1, 18990000.0000, 5);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (13, 3, 44, 1, 3771000.0000, 10);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (14, 3, 85, 1, 1317000.0000, 15);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (15, 3, 77, 1, 4490000.0000, 0);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (16, 3, 59, 1, 3790000.0000, 5);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (17, 4, 62, 2, 4411000.0000, 15);
INSERT [dbo].[orderDetail] ([id],
                            [orderId],
                            [productId],
                            [quantity],
                            [price],
                            [discount])
VALUES (18, 4, 92, 3, 360000.0000, 10);
SET IDENTITY_INSERT [dbo].[orderDetail] OFF;
GO
SET IDENTITY_INSERT [dbo].[orderState] ON;

INSERT [dbo].[orderState] ([id],
                           [name])
VALUES (1, N'Processing');
INSERT [dbo].[orderState] ([id],
                           [name])
VALUES (2, N'Shipping');
INSERT [dbo].[orderState] ([id],
                           [name])
VALUES (3, N'Received');
SET IDENTITY_INSERT [dbo].[orderState] OFF;
GO
SET IDENTITY_INSERT [dbo].[product] ON;

INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (1, N'iPhone 11 64GB', 1, 1, CAST(N'2019-01-01' AS DATE),
        N'The iPhone 11 with 6 color versions, a camera with outstanding photography capabilities, extremely long battery life and the most powerful processor ever will provide a great experience for you.',
        N'Display:  6.1 inch, IPS LCD, Liquid Retina HD, 828 x 1792 Pixels<br>Main camera:  12.0 MP + 12.0 MP<br>Selfie camera:  12.0 MP<br>RAM:  4 GB<br>Memory:  64 GB<br>CPU:  Apple A13 Bionic<br>GPU:  Apple GPU 4 cores<br>Battery capacity:  3110 mAh<br>Sim:  2 - 1 eSIM, 1 Nano SIM<br>Operating system:  iOS 14',
        14999000.0000, 10, 1003, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (2, N'iPhone 12 64GB', 1, 1, CAST(N'2020-10-05' AS DATE),
        N'The iPhone 12 came out as a whole new era. Super-fast 5G network speeds, the worlds fastest A14 Bionic processor smartphone, stunning edge-to-edge OLED displays and super night cameras, are all available on the iPhone 12.',
        N'Monitor:  6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels<br>
Rear camera:  12.0 MP + 12.0 MP<br>
Camera Selfie:  12.0 MP<br>
RAM:  4 GB<br>
Internal memory:  64 GB<br>
CPU:  Apple A14 Bionic<br>
Battery capacity:  2815 mAh<br>
Sim card:  2 - 1 eSIM, 1 Nano SIM<br>
Operating system:  iOS 14', 19999000.0000, 6, 55, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (3, N'iPhone 13 mini 128GB', 1, 1, CAST(N'2022-08-22' AS DATE),
        N'The iPhone 13 mini is a phone for those who love compactness. With a cute design, tucked into your hands or pockets, the iPhone 13 mini is even more surprising with incredible power, a super-sharp OLED screen and a professional photography camera.',
        N'Monitor: 5.4 inches, OLED, Super Retina XDR, 1080 x 2340 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 4 GB<br>
Internal memory: 128 GB<br>
CPU: Apple A15 Bionic<br>
GPU: Apple GPU 5 Core<br>
Battery capacity: 2406 mAh<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM<br>
Operating system: iOS 15', 21990000.0000, 7, 93, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (4, N'iPhone 13 Pro 128GB', 1, 1, CAST(N'2021-09-09' AS DATE),
        N'Enjoy incredible speeds on the worlds fastest smartphone, the iPhone 13 Pro with a groundbreaking 120Hz ProMotion display, an A15 Bionic processor for unrivalled performance, superior battery life, and a significantly upgraded trio of three cameras, worthy of being the top phone on the market.',
        N'Monitor: 6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP + 12.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 6 GB<br>
Internal memory: 128 GB<br>
CPU: Apple A15 Bionic<br>
GPU: Apple GPU 5 Core<br>
Battery capacity: 3095 mAh<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM<br>
Operating system: iOS 15', 30990000.0000, 12, 99, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (5, N'iPhone 13 Pro Max 128GB', 1, 1, CAST(N'2021-10-12' AS DATE),
        N'The iPhone 13 Pro Max deserves to be the largest, most powerful, and longest battery life iPhone ever that will give you a great experience, from normal tasks to professional apps.',
        N'Monitor: 6.7 inches, OLED, Super Retina XDR, 2778 x 1284 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP + 12.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 6 GB<br>
Internal memory: 128 GB<br>
CPU: Apple A15 Bionic<br>
GPU: Apple GPU 5 Core<br>
Battery capacity: 4352 mAh<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM<br>
Operating system: iOS 15', 33990000.0000, 8, 123, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (6, N'Samsung Galaxy A52s 5G', 1, 2, CAST(N'2021-06-23' AS DATE),
        N'Experience the all-new era of 5G, which is the master of speed and leading the game, Samsung Galaxy A52s 5G with super-fast 5G connectivity, excellent performance power and a quartet of superior OIS optical anti-vibration cameras will take you from surprise to surprise.',
        N'Monitor: 6.5 inch, Super AMOLED, FHD+, 1080 x 2400 Pixels<br>
Rear camera: 64.0 MP + 12.0 MP + 5.0 MP + 5.0 MP + 5.0 MP<br>
Camera Selfie: 32.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 778G<br>
GPU: Adreno 642L<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 10990000.0000, 3, 99, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (7, N'Samsung Galaxy S22 Ultra 5G 128GB', 1, 2, CAST(N'2022-03-01' AS DATE),
        N'Samsung Galaxy S22 Ultra 5G is the successor to the galaxy note elite and breakthrough Galaxy S, creating unparalleled power. The phone has set a new standard for high-end smartphones from the Snapdragon 8 Gen 1 flagship power, the "dark eye" camera, 100x zoom capability, the built-in S-Pen pen and the long all-day usage time. This is the best thing Samsung has ever brought.',
        N'Monitor: 6.8 inch, Dynamic AMOLED 2X, QHD+, 1440 x 3088 Pixels<br>
Rear camera: 108.0 MP + 12.0 MP + 10.0 MP + 10.0 MP<br>
Camera Selfie: 40.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 8 Gen 1<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM or 1 eSIM, 1 Nano SIM<br>
Operating system: Android 12', 30990000.0000, 12, 79, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (8, N'Samsung Galaxy S22 Plus 5G 128GB', 1, 2, CAST(N'2022-03-20' AS DATE),
        N'Enjoying samsungs top-notch technologies, the Galaxy S22 Plus 5G will give you a top-notch experience from trendy design, powerful Snapdragon 8 Gen 1 performance, and the most professional night camera system ever.',
        N'Monitor: 6.6 inches, Dynamic AMOLED 2X, FHD+, 1080 x 2340 Pixels<br>
Rear camera: 50.0 MP + 12.0 MP + 10.0 MP<br>
Camera Selfie: 10.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 8 Gen 1<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM or 1 eSIM, 1 Nano SIM<br>
Operating system: Android 12', 25990000.0000, 5, 97, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (9, N'Samsung Galaxy Z Flip3 5G 128GB', 1, 2, CAST(N'2021-08-11' AS DATE),
        N'A fashion icon, a masterpiece of the tech world that everyone must be amazed to see the Samsung Galaxy Z Flip3 5G and how you use this smartphone, where foldable phone technology has brought the impossible.',
        N'Monitor: Sub: 6.7 inches, Main: Dynamic AMOLED, FHD+, 1080 x 2636 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP<br>
Camera Selfie: 10.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 888<br>
Battery capacity: 3300 mAh<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM<br>
Operating system: Android 11', 24990000.0000, 10, 78, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (10, N'Samsung Galaxy Z Fold3 5G 256GB', 1, 2, CAST(N'2021-08-15' AS DATE),
        N'When you open the 7.6-inch folding screen on the Samsung Galaxy Z Fold3 5G, youve opened up a whole new future for the smartphone world, where technology transcends all limits, for the most perfect experience in a compact mobile device.',
        N'Monitor: Sub: 6.2 inches, Main: 7.6 inches, Dynamic AMOLED 2X, HD+, 1768 x 2208 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP + 12.0 MP<br>
Camera Selfie: 10.0 MP<br>
RAM: 12 GB<br>
Internal memory: 256 GB<br>
CPU: Snapdragon 888<br>
Battery capacity: 4400 mAh<br>
Sim card: 2 - 2 Nano SIM or 1 eSIM, 1 Nano SIM<br>
Operating system: Android 11', 41990000.0000, 15, 99, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (11, N'Samsung Galaxy S20 FE 256GB', 1, 2, CAST(N'2021-04-01' AS DATE),
        N'Experience the premium features of the 256GB Samsung Galaxy S20 FE phone, where you enjoy endless fun with an excellent camera, an ultra-smooth 120Hz infinity display, and enough configuration for comfortable use for years to come.',
        N'Monitor: 6.5 inch, Super AMOLED, FHD+, 1080 x 2400 Pixels<br>
Rear camera: 12.0 MP + 12.0 MP + 8.0 MP<br>
Camera Selfie: 32.0 MP<br>
RAM: 8 GB<br>
Internal memory: 256 GB<br>
CPU: Snapdragon 865<br>
GPU: Adreno 650<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 10', 15490000.0000, 3, 86, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (12, N'OPPO Reno7 8GB-128GB', 1, 3, CAST(N'2022-04-25' AS DATE),
        N'Classic design, with trendy colors, OPPO Reno7 brings unique beauty and creativity to Gen Z users.',
        N'Monitor: 6.4 inches, AMOLED, FHD+, 1080 x 2400 Pixels<br>
Rear camera: 64.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 32.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 680<br>
GPU: Adreno 610<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 12 (ColorOS 12.1)', 8990000.0000, 5, 73, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (13, N'OPPO Reno7 Z 5G 8GB - 128GB', 1, 3, CAST(N'2022-03-29' AS DATE),
        N'OPPO Reno7 Z 5G conquers users at first sight with the most fashionable design. Inside the phone there is also a powerful internal force from improved technology, a great portrait camera system, Snapdragon 695 5G processor and 33W supercharged charging, making you ready to explore a colorful life.',
        N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: Snapdragon 695 5G
<br>GPU: Adreno 619
<br>Battery capacity: 4500 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11 (ColorOS 12)', 10490000.0000, 0, 49, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (14, N'OPPO Find X3 Pro 5G', 1, 3, CAST(N'2021-05-10' AS DATE),
        N'Get ready to look to the future with the OPPO Find X3 Pro 5G, a phone with an honest color camera, a super-smooth 120Hz display, 1 billion vivid colors, and groundbreaking performance with the power of the Qualcomm Snapdragon 888 chip that supports 5G.',
        N'Monitor: 6.7 inches, AMOLED, QHD+, 1440 x 3216 Pixels
<br>Rear camera: 50.0 MP + 50.0 MP + 13.0 MP + 3.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 12 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 888
<br>GPU: Adreno 660
<br>Battery capacity: 4500 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 26990000.0000, 25, 88, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (15, N'Oppo Reno6 5G', 1, 3, CAST(N'2021-07-27' AS DATE),
        N'Ready to unleash emotions with OPPO Reno6 5G, the phone has an ultra-thin design, a unique Bokeh Flare portrait camera and, above all, a super-fast 5G network connection, with you connecting to the future.',
        N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 2.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Dimensity 900 5G
<br>GPU: Mali-G68 MC4
<br>Battery capacity: 4300 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 12990000.0000, 10, 87, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (16, N'OPPO A95 8GB-128GB', 1, 3, CAST(N'2021-11-21' AS DATE),
        N'Possessing a modern and stylish appearance, oppo A95 convinces you at first sight. Not only that, the phone also enhances the experience with a large battery, 33W fast charging, impressive performance and RAM expansion technology.',
        N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 48.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: Snapdragon 662
<br>GPU: Adreno 610
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 6990000.0000, 15, 46, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (17, N'OPPO A55 4GB-64GB', 1, 3, CAST(N'2021-10-10' AS DATE),
        N'A beautiful photo-taking phone with enough energy to experience with you the interesting things in life, OPPO A55 with a fresh design, excellent configuration in the cheap range will surely make you satisfied.',
        N'Monitor: 6.5 inches, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 50.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 4 GB
<br>Internal memory: 64 GB
<br>CPU: Helio G35
<br>GPU: PowerVR GE8320
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 4990000.0000, 7, 84, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (18, N'OPPO A16k 3GB-32GB', 1, 3, CAST(N'2021-11-11' AS DATE),
        N'Not only scoring points thanks to the youthful 3D design flattering the eyes and the small body that fits the handle, the OPPO A16k phone also brings more interesting experiences with eye protection screen technology, 4,230mAh battery capacity for a long-term experience and a series of outstanding features.',
        N'Monitor: 6.52 inch, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 13.0 MP
<br>Camera Selfie: 5.0 MP
<br>RAM: 3 GB
<br>Internal memory: 32 GB
<br>CPU: Helio G35
<br>GPU: PowerVR GE8320
<br>Battery capacity: 4230 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 3290000.0000, 0, 99, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (19, N'OPPO A94 8GB-128GB', 1, 3, CAST(N'2021-03-30' AS DATE),
        N'OPPO A94 with innovative video recording, super fast charging and impressive performance will help your life more dynamic, full of fun.',
        N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 48.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: Helio P95
<br>GPU: PowerVR GM9446
<br>Battery capacity: 4310 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 5990000.0000, 8, 77, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (20, N'Xiaomi Redmi Note 11 4GB - 64GB', 1, 4, CAST(N'2022-01-01' AS DATE),
        N'Lets experience xiaomi Redmi Note 11, the comprehensive upgraded version of the Redmi Note series has always been very popular so far. The superior power, super-long battery life, super fast charging and professional camera of the product will bring the best hours of entertainment.',
        N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 50.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 13.0 MP
<br>RAM: 4 GB
<br>Internal memory: 64 GB
<br>CPU: Snapdragon 680
<br>GPU: Adreno 610
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 4690000.0000, 0, 100, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (21, N'Xiaomi Redmi Note 11S 6GB - 128GB', 1, 4, CAST(N'2022-01-15' AS DATE),
        N'Xiaomi has introduced the Redmi Note 11S and this phone carries many improvements in all aspects compared to its predecessor. Professional main cameras, super-fast charging, smooth displays and impressive performance will make for an incredible comprehensiveness, all of which will be in this mid-range smartphone.',
        N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 6 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Helio G96
<br>GPU: Mali-G57 MC2
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 6190000.0000, 12, 88, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (22, N'Xiaomi 11T Pro 5G 12GB - 256GB', 1, 4, CAST(N'2021-10-10' AS DATE),
        N'Xiaomi 11T Pro is the most expensive high-end phone today. Youll get a 108MP professional camera, 120W super fast charging, a smooth 120Hz AMOLED display that supports Dolby Vision, and a Snapdragon 888 flagship processor, a range of top-notch features that will deliver a more enjoyable experience than ever before.',
        N'Monitor: 6.67 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 108.0 MP + 8.0 MP + 5.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 12 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 888
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 1 Nano SIM
<br>Operating system: Android 11', 14990000.0000, 9, 74, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (23, N'Xiaomi Redmi Note 11 Pro 8GB - 128GB', 1, 4, CAST(N'2022-02-12' AS DATE),
        N'The Xiaomi Redmi Note 11 Pro is one of the latest phones in the recently launched Redmi Note 11 series. The phone is equipped with impressive parameters but is still sold in the mid-range segment. With quality cameras of up to 108MP, a 120Hz screen and 67W fast charging, this is the perfect phone for you when you need it.',
        N'Monitor: 6.67 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB
<br>CPU: MediaTek Helio G96
<br>GPU: Mali-G57 MC2
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 1 Nano SIM
<br>Operating system: Android 11', 7490000.0000, 10, 100, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (24, N'Xiaomi Redmi Note 10S 8GB-128GB', 1, 4, CAST(N'2021-05-05' AS DATE),
        N'The Xiaomi Redmi Note 10S captures every moment with a professional 64MP camera quartet, stunning AMOLED display experience, and performance that has become the trademark of the Redmi series. Start your adventure in the most exciting way.',
        N'Monitor: 6.43 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 13.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Helio G95
<br>GPU: Mali-G76 MC4
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 1 Nano SIM
<br>Operating system: Android 11', 6490000.0000, 15, 100, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (25, N'Xiaomi 12 Pro 12GB - 256GB', 1, 4, CAST(N'2022-03-03' AS DATE),
        N'With the continuous development and improvement of outstanding technologies, Xiaomi has brought a perfect Xiaomi 12 Pro, ready to master all your games. With a trio of 50MP cameras, a 2K+ display, 120W fast charging, and a top-of-the-line processor, the phone will be the top choice for 2022.',
        N'Monitor: 6.73 inch, AMOLED, FHD+, 1440 x 3200 Pixels
<br>Rear camera: 50.0 MP + 50.0 MP + 50.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 12 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 8 Gen 1
<br>GPU: Adreno 730
<br>Battery capacity: 4600 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 12', 27990000.0000, 6, 49, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (26, N'Xiaomi 11 Lite 5G NE 8GB - 256GB', 1, 4, CAST(N'2021-10-11' AS DATE),
        N'More than just a phone, Xiaomi 11 Lite 5G NE deserves to be called a fashion icon in the smartphone world, where you get to feel the sophistication and sophistication to every line, along with unexpected power, super-fast 5G connectivity, mastering the future.',
        N'Monitor: 6.55 inch, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 5.0 MP
<br>Camera Selfie: 20.0 MP
<br>RAM: 8 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 778G
<br>GPU: Adreno 642L
<br>Battery capacity: 4250 mAh
<br>Sim card: 2 - 1 Nano SIM
<br>Operating system: Android 11', 10490000.0000, 10, 87, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (27, N'Xiaomi Redmi 10C 4GB - 128GB', 1, 4, CAST(N'2022-03-01' AS DATE),
        N'The best choice in the segment has appeared, Xiaomi Redmi 10C is equipped with a fast Snapdragon 680 6nm chip, has a 50MP main camera, owns a 5,000 mAh battery that supports 18W charging comes with a 6.71-inch screen and powerful external speakers.',
        N'Monitor: 6.71 inches, IPS, HD+, 720 x 1560 Pixels
<br>Rear camera: 50.0 MP + 2.0 MP
<br>Camera Selfie: 5.0 MP
<br>RAM: 4 GB
<br>Internal memory: 128 GB
<br>CPU: Snapdragon 680
<br>GPU: Adreno 610
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 3890000.0000, 0, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (28, N'Xiaomi Redmi 9A 2GB-32GB', 1, 4, CAST(N'2020-07-25' AS DATE),
        N'Xiaomi Redmi 9A demonstrates the superiority in the low-cost segment when it comes to having a large screen, battery life throughout the day and excellent configuration, giving you a truly satisfying experience.',
        N'Monitor: 6.53 inches, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 13.0 MP
<br>Camera Selfie: 5.0 MP
<br>RAM: 2 GB
<br>Internal memory: 32 GB
<br>CPU: Helio G25
<br>GPU: PowerVR GE8320
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 10', 2490000.0000, 10, 44, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (29, N'Xiaomi 12 8GB - 256GB', 1, 4, CAST(N'2022-03-12' AS DATE),
        N'With the Xiaomi 12 in hand, you will easily master all your own fun. Whether its taking photos, playing games, or immersing yourself in movies, your phone will always give you the top experience. This flagship will be one of the hot choices for you today.',
        N'Monitor: 6.28 inch, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 50.0 MP + 13.0 MP + 5.0 MP
<br>Camera Selfie: 32.0 MP
<br>RAM: 8 GB
<br>Internal memory: 256 GB
<br>CPU: Snapdragon 8 Gen 1
<br>GPU: Adreno 730
<br>Battery capacity: 4500 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 12', 19990000.0000, 8, 77, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (30, N'Vivo V23 5G', 1, 5, CAST(N'2022-01-01' AS DATE),
        N'Vivo V23 5G is introduced as a pioneer in the market in terms of equipping the impressive 50MP dual selfie camera cluster. Not only that, this phone is perfected in terms of design, performance and camera, aiming for the best experience for users.',
        N'Monitor: 6.44 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 2.0 MP
<br>Camera Selfie: 50.0 MP + 8.0 MP
<br>RAM: 8 GB + 4 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Dimensity 920
<br>GPU: Mali-G68 MC4
<br>Battery capacity: 4200 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 12', 11990000.0000, 10, 100, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (31, N'Vivo V23e 8GB - 128GB', 1, 5, CAST(N'2021-11-11' AS DATE),
        N'With vivo V23e, all your selfies will be beautiful shimmering thanks to the help of a 50MP selfie camera combined with Eye Autofocus technology. In addition, vivo has succeeded in bringing a series of its top-notch features into a thin, stylish, stylish chassis.',
        N'Monitor: 6.44 inches, AMOLED, FHD+, 1080 x 2400 Pixels
<br>Rear camera: 64.0 MP + 8.0 MP + 2.0 MP
<br>Camera Selfie: 50.0 MP
<br>RAM: 8 GB + 4 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Helio G96
<br>GPU: Mali-G57 MC2
<br>Battery capacity: 4050 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 8490000.0000, 9, 81, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (32, N'Vivo Y33s 8GB - 128GB', 1, 5, CAST(N'2022-03-10' AS DATE),
        N'Not only does it score points with its stylish styling, ultra-thin body and flattering colors, the Vivo Y33s also shows irresistible appeal in the mid-range segment thanks to its 5,000 mAh battery, bright 6.58-inch screen, impressive 50MP night camera and superior performance to rivals of the same price range.',
        N'Monitor: 6.58 inch, IPS LCD, FHD+, 2408 x 1080 Pixels
<br>Rear camera: 50.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB
<br>Internal memory: 128 GB
<br>CPU: MediaTek Helio G81
<br>GPU: Mali-G52 MC2
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 6690000.0000, 5, 100, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (33, N'Vivo Y53s 8GB+3GB - 128GB', 1, 5, CAST(N'2021-06-06' AS DATE),
        N'Vivo Y53s focuses on smooth experiences with excellent performance, proprietary RAM expansion technology and impressive battery life, making it possible to play games comfortably, with unlimited entertainment.',
        N'Monitor: 6.58 inch, IPS LCD, FHD+, 2408 x 1080 Pixels
<br>Rear camera: 64.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 16.0 MP
<br>RAM: 8 GB + 3 GB
<br>Internal memory: 128 GB
<br>CPU: Helio G80
<br>GPU: Mali-G52
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 6990000.0000, 12, 65, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (34, N'Vivo Y15s 3GB - 32GB', 1, 5, CAST(N'2021-10-12' AS DATE),
        N'Free to entertain throughout the day with a large battery capacity of 5000mAh, vivo Y15s will join you to enjoy the fun with a lightweight design, a smooth experience on the 6.51-inch Halo overflow screen.',
        N'Monitor: 6.51 inch, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 13.0 MP + 2.0 MP
<br>Camera Selfie: 8.0 MP
<br>RAM: 3 GB
<br>Internal memory: 32 GB
<br>CPU: Helio P35
<br>GPU: PowerVR GE8320
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 3490000.0000, 5, 111, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (35, N'Vivo Y21s 4GB+1GB - 128GB', 1, 5, CAST(N'2021-09-19' AS DATE),
        N'Trendy thin design, 3 super-sharp rear cameras with a resolution of up to 50MP, powerful with expanded RAM technology and tremendous battery capacity, vivo Y21s is ready to burn with you in all the fun.',
        N'Monitor: 6.51 inch, IPS LCD, HD+, 720 x 1600 Pixels
<br>Rear camera: 50.0 MP + 2.0 MP + 2.0 MP
<br>Camera Selfie: 8.0 MP
<br>RAM: 4 GB + 1 GB
<br>Internal memory: 128 GB
<br>CPU: Helio G80
<br>GPU: PowerVR GE8320
<br>Battery capacity: 5000 mAh
<br>Sim card: 2 - 2 Nano SIM
<br>Operating system: Android 11', 4990000.0000, 4, 56, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (36, N'TECNO POVA 2 4GB-64GB', 1, 6, CAST(N'2021-06-11' AS DATE),
        N'Can you believe it, a phone with a high-end design, extremely large screen, super battery capacity and an impressive 48MP camera quartet are sold at a surprisingly cheap price, the Tecno Pova 2 is the smart choice for everyone.',
        N'Monitor: 6.9 inch, IPS LCD, FHD+, 1080 x 2460 Pixels<br>
Rear camera: 48.0 MP + 2.0 MP + 2.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Helio G85<br>
GPU: Mali-G52 MC2<br>
Battery capacity: 7000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 39900000.0000, 5, 55, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (37, N'TECNO SPARK 7T 4GB-64GB', 1, 6, CAST(N'2021-10-10' AS DATE),
        N'Ready to explore the endless life with the Tecno Spark 7Ts huge 6000mAh battery capacity, the phone is cheap but offers great features such as a 48MP AI dual camera, a large 6.4-inch screen, large memory capacity and an impressive unique design.',
        N'Monitor: 6.52 inch, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 48.0 MP + 48.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Mediatek Helio G35<br>
GPU: PowerVR GE8320<br>
Battery capacity: 6000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 2690000.0000, 0, 80, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (38, N'TECNO POP 5 2GB-32GB', 1, 6, CAST(N'2021-12-01' AS DATE),
        N'Delivering a maximum experience at minimal cost, the Tecno POP 5 truly outpaces every competitor in the same price range in every aspect, from design to configuration, screen, and battery experience. The camera cluster with dual flash delivers excellent shapes that exceed your expectations.',
        N'Monitor: 6.5 inches, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 2 GB<br>
Internal memory: 32 GB<br>
CPU: Spreadtrum SC9863A<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 2390000.0000, 0, 20, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (39, N'Nokia G21 6GB-128GB', 1, 7, CAST(N'2022-03-16' AS DATE),
        N'Coming from the most famous brand in the world of phones, Nokia G21 gives you a superior experience with up to 3 days of battery life, 50MP camera combined with excellent AI technology. In addition, the product is equipped with a sleek polycarbonate chassis, super durable and the operating system is constantly updated for 2 years.',
        N'Monitor: 6.5 inches, IPS, HD+, 720 x 1600 Pixels<br>
Rear camera: 50.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 6 GB<br>
Internal memory: 128 GB<br>
CPU: Unisoc T606<br>
Battery capacity: 5050 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 4590000.0000, 6, 44, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (40, N'Nokia C30 3GB-32GB', 1, 7, CAST(N'2021-05-11' AS DATE),
        N'Comfortable experience on the extremely large screen and battery life up to 3 days of the Nokia C30. With a beautiful durable design and regular software updates, the Nokia C30 will accompany you for many years to come in a stable way.',
        N'Monitor: 6.82 inches, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 13.0 MP + 2.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: Spreadtrum SC9863A<br>
Battery capacity: 6000 mAh<br>
Sim card: 2 - 2 Nano SIM', 2990000.0000, 10, 66, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (41, N'Nokia C21 Plus 3GB-32GB', 1, 7, CAST(N'2022-05-11' AS DATE),
        N'Showing off its refined look with European-standard durability, the Nokia C21 Plus phone offers a superior experience over the price range. The product is equipped with a large capacity battery of 5,050 mAh, with a 6.5-inch HD+ screen that promises to bring vivid frames to fully meet all entertainment content.',
        N'Monitor: 6.52 inch, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 13.0 MP + 2.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: Spreadtrum SC9863A<br>
Battery capacity: 5050 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 2990000.0000, 5, 40, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (42, N'Realme 9 Pro 5G 8G-128GB', 1, 8, CAST(N'2022-03-04' AS DATE),
        N'Enjoying strong performance with a 120Hz ultra-smooth display, 5G connectivity and 33W fast charging, the Realme 9 Pro is the ideal companion for an active life. Not only that, the 64MP camera system and the new design also help you catch all the trends in 2022.',
        N'Monitor: 6.6 inches, IPS LCD, HD+, 1080 x 2412 Pixels<br>
Rear camera: 64.0 MP + 8.0 MP + 2.0 MP<br>
Camera Selfie: 16.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 695 5G<br>
GPU: Adreno 619<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 12', 7990000.0000, 15, 58, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (43, N'Realme 8 Pro 8GB - 128GB', 1, 8, CAST(N'2021-04-14' AS DATE),
        N'Realme 8 Pro with a resolution camera of up to 108MP, gives you the most realistic images and footage. Besides, the impressive configuration thanks to the Snapdragon 720G processor will create the peak power mark in a lightweight design.',
        N'Monitor: 6.4 inch, Super AMOLED, FHD+, 1080 x 2400 Pixels<br>
Rear camera: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 16.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 720G<br>
GPU: Adreno 618<br>
Battery capacity: 4500 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 8690000.0000, 15, 42, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (44, N'Realme C25y 4GB-128GB', 1, 8, CAST(N'2021-10-01' AS DATE),
        N'Experiencing super-buffalo battery life and convenient fast charging, the Realme C25y helps your life become more dynamic. The trio of 50MP cameras and large screens are also suitable for young people, for unlimited creativity and entertainment.',
        N'Monitor: 6.5 inches, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 50.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 128 GB<br>
CPU: Unisoc T618<br>
GPU: Mali-G52 MC2<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 4190000.0000, 10, 75, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (45, N'Realme C21y 3GB - 32GB', 1, 8, CAST(N'2021-06-01' AS DATE),
        N'A smooth experience throughout the day thanks to the 5000mAh high capacity battery, enjoying all the content on the big 6.5-inch screen, enjoying the creativity with a set of 3 quality cameras, realme C21Y will make your every day pass with excitement.',
        N'Monitor: 6.5 inches, IPS LCD, HD+, 720 x 1600 Pixels<br>
Rear camera: 13.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: Unisoc T610<br>
GPU: Mali-G52 MC2<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 3090000.0000, 12, 55, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (46, N'Realme C35 4GB-128GB', 1, 8, CAST(N'2022-04-01' AS DATE),
        N'Boasting a groundbreaking design and using an excellent 6.6-inch Full HD display, the Realme C35 impresses thanks to its cluster of three 50MP AI cameras and a massive 5,000 mAh battery for long all-day performance. Excellent processor chips with ultra-thin body are also factors that make you admire this affordable super product.',
        N'Monitor: 6.58 inches, IPS LCD, FHD+, 1080 x 2408 Pixels<br>
Rear camera: 50.0 MP + 2.0 MP + 2.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 128 GB<br>
CPU: Unisoc T616<br>
Battery capacity: 5000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 4990000.0000, 0, 99, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (47, N'iPad Pro 11 2021 M1 Wi-Fi 1TB', 2, 1, CAST(N'2021-04-04' AS DATE),
        N'For those who are truly professional, the 11-inch 2021 M1 iPad Pro has a maximum memory version of up to 2TB for almost infinite storage. Besides, the power of the Apple M1 processor and high-end camera system is waiting for you.',
        N'Monitor: 11.0 inch, IPS LCD, Liquid Retina HD, 2388 x 1668 Pixels<br>
Rear camera: 12.0 MP + 10.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 16 GB<br>
Internal memory: 1 TB<br>
CPU: Apple M1<br>
GPU: Apple M1', 42999000.0000, 0, 30, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (48, N'iPad Pro 12.9 2021 M1 Wi-Fi 5G 128GB', 2, 1, CAST(N'2021-04-01' AS DATE),
        N'Along with the unprecedented iPad experience, where you enjoy the top-notch performance of the M1 processor, stunning XDR display, and super-fast 5G network connectivity on the 2021 iPad Pro.',
        N'Monitor: 12.9 inch, IPS LCD, Liquid Retina XDR, 2732 x 2048 Pixels<br>
Rear camera: 12.0 MP + 10.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Apple M1<br>
GPU: Apple M1<br>
Sim card: 1 - 1 eSIM, 1 Nano SIM', 34999000.0000, 15, 30, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (49, N'iPad Air 5 2022 10.9 inch M1 WiFi 5G 64GB', 2, 1, CAST(N'2022-03-08' AS DATE),
        N'With the introduction of the super-powerful M1 chip, the iPad Air 5 Wifi 5G 2022 marks a leap in performance. A quick 5G connection and a 12MP Ultra Wide selfie camera will give you an unprecedented experience on all previous iPad Air models. The product is compatible with Apple Pencil and Magic Keyboard to improve performance.',
        N'Monitor: 10.9 inch, Liquid Retina HD, 2360 x 1640 Pixels<br>
RAM: 8 GB<br>
Internal memory: 64 GB<br>
CPU: Apple M1<br>
Battery capacity: 10 Hours<br>
Sim card: 1', 20990000.0000, 5, 45, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (50, N'iPad Mini 6 2021 8.3 inch WiFi 256GB', 2, 1, CAST(N'2021-09-09' AS DATE),
        N'The tremendous power in a lovely compact design, the 2021 iPad Mini 6 marks a powerful return to the iPad mini line that has always been loved by users, where you enjoy the magic inside the gorgeous tablet, top-notch performance and apple pencil support.',
        N'Monitor: 8.3 inch, IPS LCD, Liquid Retina HD, 2048 x 1536 Pixels<br>
Rear camera: 12.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 4 GB<br>
Internal memory: 256 GB<br>
CPU: Apple A15 Bionic<br>
GPU: Apple GPU 5 Core<br>
Sim card: 0', 19990000.0000, 5, 46, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (51, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB', 2, 1, CAST(N'2022-03-08' AS DATE),
        N'The performance power of the iPad Air 5 marks a strong step forward with the presence of an excellent M1 processor developed by Apple itself. The product promotes the fashionable design style of the iPad Air series and offers a new experience when video calls thanks to the ultra-wide-angle front camera.',
        N'Monitor: 10.9 inch, Liquid Retina HD, 2360 x 1640 Pixels<br>
RAM: 8 GB<br>
Internal memory: 64 GB<br>
CPU: Apple M1<br>
Battery capacity: 10 Hours', 16990000.0000, 8, 45, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (52, N'iPad Gen 9 2021 10.2 inch WiFi Cellular 64GB', 2, 1, CAST(N'2021-09-01' AS DATE),
        N'iPad Gen 9 9 10.2 2021 4G LTE brings together all the things that have made you love the iPad line so far. You can work, entertain, create, learn and connect in the most efficient, comfortable way on the new 2021 iPad 10.2.',
        N'Monitor: 10.2 inch, IPS LCD, Liquid Retina HD, 2160 x 1620 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 3 GB<br>
Internal memory: 64 GB<br>
CPU: Apple A13 Bionic<br>
GPU: Apple GPU 4 Core<br>
Sim card: 1', 13990000.0000, 12, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (53, N'Samsung Galaxy Tab S8 Ultra', 2, 2, CAST(N'2022-01-01' AS DATE),
        N'Experience samsungs best tablet version - the Galaxy Tab S8 Ultra, you will see the difference of snapdragon 8 Gen 1 flagship performance, the technology trend-leading design and the perfect convenience of the new generation S-Pen pen.',
        N'Monitor: 14.0 inch, Super AMOLED, WQHD+, 2800 x 1752 Pixels<br>
Rear camera: 13.0 MP + 5.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 8 Gen 1<br>
Battery capacity: 11200 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 12', 30990000.0000, 0, 29, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (54, N'Samsung Galaxy Tab S8 Plus', 2, 2, CAST(N'2022-01-01' AS DATE),
        N'Holding the Galaxy Tab S8 Plus in your hand, you like to hold the vast world of entertainment with a super smooth 120Hz Super AMOLED display and Snapdragon 8 Gen 1 chip for great performance power. The large capacity battery of 10,090 mAh easily provides operating power to the device for a long time.',
        N'Monitor: 12.4 inch, Super AMOLED, WQHD+, 2800 x 1752 Pixels<br>
Rear camera: 13.0 MP + 5.0 MP<br>
Camera Selfie: 12.0 MP<br>
RAM: 8 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 8 Gen 1<br>
Battery capacity: 10090 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 12', 25990000.0000, 0, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (55, N'Samsung Galaxy Tab S7 FE', 2, 2, CAST(N'2021-07-01' AS DATE),
        N'A large-screen tablet will make every experience, whether learning or playing, extremely attractive. Samsung Galaxy Tab S7 FE With excellent performance and professional S Pen will always bring you fun.',
        N'Monitor: 12.4 inch, TFT LCD, WQXGA, 2560 x 1600 Pixels<br>
Rear camera: 13.0 MP + 5.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Snapdragon 750G<br>
Battery capacity: 10090 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 10', 13990000.0000, 0, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (56, N'Samsung Galaxy Tab S6 Lite 2022', 2, 2, CAST(N'2022-02-01' AS DATE),
        N'Meet the Samsung Galaxy Tab S6 Lite 2022 - the new version with a strong upgrade in Snapdragon 720G performance, for every smooth task, perfect multitasking from learning, work to entertainment. The support of the S-Pen pen is also a great friend to enjoy creativity, increase work performance.',
        N'Monitor: 10.4 inch, TFT LCD, FHD, 1200 x 2000 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Snapdragon 720G<br>
Battery capacity: 7040 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 12', 9990000.0000, 9, 60, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (57, N'Samsung Galaxy Tab A8 2022', 2, 2, CAST(N'2022-01-01' AS DATE),
        N'The 2022 Samsung Galaxy Tab A8 offers an efficient learning, work and entertainment solution on a spacious 10.5-inch screen. The product features a minimalist elegant design, features a lively Dolby Atmos sound system, recognizes an impressive configuration in the price range and offers a series of handy features that enhance the user experience.',
        N'Monitor: 10.5 inch, TFT LCD, WUXGA, 1920 x 1200 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 4 GB<br>
Internal memory: 64 GB<br>
CPU: Unisoc T618<br>
Battery capacity: 7040 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 11', 8490000.0000, 0, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (58, N'Samsung Galaxy Tab A7 Lite', 2, 2, CAST(N'2021-05-01' AS DATE),
        N'With its ultra-thin design, attractive entertainment features and superior performance, the Samsung Galaxy Tab A7 Lite will be a stylish companion for your life. It is free to learn, explore, connect in the inspiration of technology.',
        N'Monitor: 8.7 inch, TFT LCD, HD+, 1340 x 800 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 2.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: MediaTek MT8768T<br>
Battery capacity: 5100 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 11', 4490000.0000, 0, 45, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (59, N'Masstel Tab 10M 4G', 2, 2, CAST(N'2021-11-01' AS DATE),
        N'Possessing an excellent configuration in the price range and equipped with the new 11-generation Android 11 operating system, the Masstel Tab 10M 4G tablet is the best choice in the low-cost segment when recording a huge battery capacity of 6,000 mAh. The spacious HD screen will help you a lot in the process of entertainment or study, online meetings.',
        N'Monitor: 10.1 inch, IPS, 800 x 1280 Pixels<br>
Rear camera: 5.0 MP<br>
Camera Selfie: 2.0 MP<br>
RAM: 3 GB<br>
Internal memory: 32 GB<br>
CPU: SCT310<br>
GPU: PowerVR GE8300<br>
Battery capacity: 6000 mAh<br>
Sim card: 2 - 2 Nano SIM<br>
Operating system: Android 11', 3990000.0000, 5, 58, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (60, N'Masstel Tab 10 Wifi ', 2, 10, CAST(N'2021-10-01' AS DATE),
        N'With a smooth Android 11 Go operating system and a luxurious, high-end metal body, the Masstel Tab 10 Wi-Fi is the choice not to be missed if you are looking for a tablet that excels in the affordable segment. It has a 10.1-inch wide screen and battery life that can be used throughout the day.',
        N'Monitor: 10.1 inch, IPS, 800 x 1280 Pixels<br>
Rear camera: 5.0 MP<br>
Camera Selfie: 2.0 MP<br>
RAM: 2 GB<br>
Internal memory: 32 GB<br>
GPU: Mali-G52 2EE<br>
Battery capacity: 5000 mAh<br>
Operating system: Android 11', 2990000.0000, 5, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (61, N'Lenovo Tab P11 Pro WI-FI 4G 128GB', 2, 9, CAST(N'2020-09-01' AS DATE),
        N'Enjoy an unlimited entertainment experience with the Lenovo Tab P11 Pro, a high-end Android tablet with an ultra-thin design, extremely powerful performance, and a sharp 2K display. Youll be holding a mobile cinema, a professional means of work and more.',
        N'Monitor: 11.5 inches, OLED, HD, 2560 x 1600 Pixels<br>
Rear camera: 13.0 MP + 5.0 MP<br>
Camera Selfie: 8.0 MP<br>
RAM: 4 GB<br>
Internal memory: 128 GB<br>
CPU: Snapdragon 730G<br>
GPU: Adreno 618<br>
Battery capacity: 8600 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 10', 14590000.0000, 35, 30, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (62, N'Lenovo Tab M10 32GB (Gen 2)', 2, 9, CAST(N'2020-07-01' AS DATE),
        N'Tablets The second-generation Lenovo Tab M10 is a great choice if you want to buy your child a device that is both useful and safe, well-censored in terms of content and has a very affordable price.',
        N'Monitor: 10.1 inch, IPS, HD, 1280 x 800 Pixels<br>
Rear camera: 8.0 MP<br>
Camera Selfie: 5.0 MP<br>
RAM: 2 GB<br>
Internal memory: 32 GB<br>
CPU: MediaTek Helio P22 (MT6762R)<br>
Battery capacity: 5000 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 10', 5190000.0000, 15, 48, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (63, N'Lenovo Tab M8-Gen 2', 2, 9, CAST(N'2019-10-01' AS DATE),
        N'The Lenovo Tab M8-Gen 2 is a multipurpose tablet for those who want to get a smart experience on the big screen at a reasonable cost. The product has an 8-inch wide display space with a resolution of 1280 x 800 pixels and uses Dolby Audio technology. Up to 18 hours of battery life allows you to use throughout the day.',
        N'Monitor: 8.0 inches, HD, 1280 x 800 Pixels<br>
Rear camera: 5.0 MP<br>
Camera Selfie: 2.0 MP<br>
RAM: 2 GB<br>
Internal memory: 32 GB<br>
CPU: Helio A22<br>
Battery capacity: 5000 mAh<br>
Sim card: 1 - 1 Nano SIM<br>
Operating system: Android 9.0', 3790000.0000, 10, 49, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (64, N'Apple Watch Series 7 GPS + Cellular 41mm Steel Wire Bezel', 3, 1, CAST(N'2021-04-01' AS DATE),
        N'Apple Watch Series 7 GPS + Cellular version made of high-end steel is the perfect combination of technology and fashion. The watch shines right on your wrist not only from its stunning design but also from its top-notch smart features.',
        N'Monitor: 1.61 inch, LTPO OLED, 430 x 352 Pixels<br>
Internal memory: 32 GB<br>
Material: Machine Border: Stainless Steel<br>
Compatible operating system: IOS<br>
Battery life: 18 hours', 20990000.0000, 10, 88, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (65, N'Apple Watch Series 7 GPS 41mm Aluminum Trim Rubber Band', 3, 1, CAST(N'2021-04-01' AS DATE),
        N'Experiencing an impressive screen smartwatch with the largest, most advanced screen ever, super durable premium design, breakthrough health features and convenient fast charging technology, Apple Watch Series 7 is the complete smartwatch version, Gather all that the user needs.',
        N'Monitor: 1.61 inch, LTPO OLED, 430 x 352 Pixels<br>
CPU: Apple S7<br>
Internal memory: 32 GB<br>
Material: Glass: Ion-X Strengthened Glass - Wire: Rubber<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: 18 hours', 11990000.0000, 10, 80, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (66, N'Apple Watch SE GPS + Cellular 44mm Aluminum Bezel Wire Sport Loop', 3, 1, CAST(N'2020-06-01' AS DATE),
        N'Integrated with eSIM and 4G LTE network connectivity, the Apple Watch SE can operate independently, communicate, into the network without the phone on the side. And yet, the impressive design, powerful configuration and sharp Retina display make up the distinct class for the Apple Watch SE.',
        N'Monitor: 448 x 368 Pixels<br>
Internal memory: 32 GB<br>
Material: Wire: Fabric - Glass Face: Ion-X Strengthened Glass<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: 18 hours', 11999000.0000, 20, 60, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (67, N'Apple Watch SE GPS 40mm Aluminum Trim Rubber Band', 3, 1, CAST(N'2020-04-04' AS DATE),
        N'A beautifully thin-bezeled retina display, equipped with advanced sensors and top-notch health features, the Apple Watch SE gives you more than youd expect at an attractive price.',
        N'Monitor: 394 x 324 Pixels<br>
Internal memory: 32 GB<br>
Material: Wire: Rubber - Glass: Ion-X Strengthened Glass<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: 18 hours', 8999000.0000, 25, 59, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (68, N'Apple Watch Series 3 GPS 38mm Aluminum Trim Rubber Band', 3, 1, CAST(N'2019-04-01' AS DATE),
        N'Apple Watch Series 3 GPS 38mm aluminum trim white rubber band – an Apple-branded watch, possessing a modern and youthful design, suitable for sports activities or picnics. You will be amazed at the features that this watch owns.',
        N'Monitor: 340 x 272 Pixels<br>
Internal memory: 8 GB<br>
Material: Glass: Ion-X Strengthened Glass - Wire: Rubber<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: 18 hours', 5999000.0000, 20, 45, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (69, N'Apple Watch Nike Series 7 GPS + Cellular 41mm Aluminum Trim Rubber Band', 3, 1,
        CAST(N'2021-06-01' AS DATE),
        N'Fashionable, sporty and handy, the Apple Watch Nike Series 7 will accompany you in every workout, helping to improve sportsmanship, while effectively supporting through the Nike Run Club app. The inspiring design and ability to simultaneously support GPS + 4G LTE connectivity provide experiences that cannot be searched in other versions.',
        N'Monitor: 1.61 inches, OLED, 430 x 352 Pixels<br>
CPU: Apple S7<br>
Internal memory: 32 GB<br>
Material: Glass Surface: Ion-X Strengthened Glass - Wire: Silicone - Bezel Machine: Aluminum<br>
Operating system: watchOS<br>
Compatible operating system: Ios<br>
Battery life: About 1.5 days', 14990000.0000, 8, 48, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (70, N'Garmin MARQ Smartwatch, Aviator', 3, 12, CAST(N'2021-11-01' AS DATE),
        N'A smartwatch built by Garmin specifically for pilots, the MARQ Aviator uses a permanent anti-glare display, and has a special route navigation mode to effectively support pilots on long flights. Garmin MARQ Aviator brings together a series of outstanding features, worthy of its value and class.',
        N'Monitor: 240 x 240 Pixels<br>
Internal memory: 32 GB<br>
Material: Wire: Titanium - Glass: Sapphire Glass<br>
Compatible operating system: Android, iOS', 48990000.0000, 5, 20, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (71, N'Garmin Venu Sq Smartwatch', 3, 12, CAST(N'2021-07-01' AS DATE),
        N'As part of Garmins recently launched product line, the Venu Sq watch aims at fashion, convenience and price optimization to provide the best experience for users. This is a small, lightweight smartwatch with a unisex appearance suitable for male and female users.',
        N'Monitor: 1.3 inches, LCD, 240 x 240 Pixels<br>
Material: Glass: Gorilla Glass 3 - Wire: Silicone<br>
Compatible operating system: iOS, Android<br>
Battery life: 6 days', 4990000.0000, 0, 40, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (72, N'Garmin Instinct 2S Smartwatch, Camo PatternEd Version', 3, 12, CAST(N'2022-01-01' AS DATE), N'',
        N'Monitor: 1.13 Inch, MIP Anti-Glare<br>
Material: Polymer<br>
Compatible operating system: Android, iOS<br>
Battery life: 14 days', 9990000.0000, 0, 30, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (73, N'Garmin Vivomove 3S smartwatch ', 3, 12, CAST(N'2021-05-01' AS DATE),
        N'With its elegant appearance, state-of-the-art sensor system and optimal user health care capabilities, the Garmin vivomove 3S is the number one choice in the smart wearables market today.',
        N'Monitor: OLED<br>
Material: Wire: Silicone - Glass: Gorilla Glass 3<br>
Compatible operating system: Android, iOS', 5990000.0000, 3, 40, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (74, N'Garmin Fenix 7S Smartwatch, Sapphire, Solar, Titanium Yellow Pink', 3, 12, CAST(N'2021-12-01' AS DATE),
        N'',
        N'Monitor: 1.2 inches, MIP Anti-Glare, 240 x 240 Pixels<br>
Internal memory: 32 GB<br>
Material: Glass: Sapphire Glass - Wire: Silicone<br>
Compatible operating system: iOS, Android<br>
Battery life: 11 days', 24990000.0000, 15, 35, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (75, N'Mi Band 6 Smart Bracelet', 3, 4, CAST(N'2021-06-01' AS DATE),
        N'Inheriting the essence of previous generations, xiaomi Mi Band 6 is the perfect smart bracelet when it comes to having a sharp AMOLED screen, supports heart rate measurement and SpO2, 2-week battery life, professional workout activity and durable water resistance.',
        N'Monitor: 1.56 inches, 152 x 486 Pixels<br>
CPU: DA14697<br>
Internal memory: 32 MB<br>
Material: Wire: Silicone - Glass Face: Tempered Glass<br>
Operating system: RTOS<br>
Compatible operating system: iOS, Android<br>
Battery life: 14 days', 1290000.0000, 10, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (76, N'Xiaomi Redmi Watch 2 Lite ', 3, 4, CAST(N'2021-10-01' AS DATE),
        N'With the spirit of being the world leader in smart wearables, Xiaomi continues to bring impressive points to the Redmi Watch 2 Lite smartwatch. It is improved over the Mi Watch Lite with a large 1.55-inch screen, over 100 workout modes and integrated SpO2 sensor.',
        N'Monitor: 1.55 inches, 320 x 360 Pixels<br>
Material: Wire: TPU - Glass: Tempered Glass: Tempered Glass<br>
Compatible operating system: iOS, Android<br>
Battery life: 10 days', 1490000.0000, 12, 40, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (77, N'Xiaomi Watch S1 Active Smartwatch ', 3, 4, CAST(N'2022-03-01' AS DATE),
        N'The Xiaomi Watch S1 Active will put the world of smart technology on top of your wrist. It has a 1.43-inch AMOLED display and records up to 12 days of battery life, supports bluetooth calls, and offers 117 different workout modes.',
        N'Monitor: 1.43 inches, AMOLED, 466 x 466 pixels<br>
Internal memory: 4 GB<br>
Material: Wire: TPE Plastic - Glass: Gorilla Glass 3<br>
Operating system: RTOS<br>
Compatible operating system: iOS, Android<br>
Battery life: About 18 days', 4490000.0000, 0, 49, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (78, N'Samsung Galaxy Watch 4 40mm', 3, 2, CAST(N'2021-05-01' AS DATE),
        N'Not only is the smartwatch full of both technological features and fashion beauty, Samsung Galaxy Watch 4 is also a companion who always understands your health and what you need, with you perfecting yourself every day.',
        N'Monitor: 1.2 inches, Super AMOLED, 396 x 396 Pixels<br>
CPU	Exynos: W920<br>
Internal memory: 16 GB<br>
Material: Wire: Silicone - Glass: Gorilla Glass Dx+<br>
Operating system: One UI Watch<br>
Compatible operating system: Android<br>
Battery life: About 1.5 days', 6490000.0000, 15, 60, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (79, N'Samsung Galaxy Watch 4 Classic 46mm', 3, 2, CAST(N'2021-05-05' AS DATE),
        N'Samsung Galaxy Watch 4 Classic is a masterpiece with a beautiful design like high-end classic wristwatches but carries a series of leading smart features today. The most advanced health monitoring and exercise support sensors will help you get healthier and healthier.',
        N'Monitor: 1.4 inches, 450 x 450 Pixels<br>
Internal memory: 16 GB<br>
Material: Wire: Silicone - Glass: Gorilla Glass Dx+<br>
Operating system: One UI Watch<br>
Compatible operating system: Android<br>
Battery life: About 1.5 days', 8990000.0000, 15, 60, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (80, N'Super Hero 4G Childrens Locator Watch', 3, 10, CAST(N'2021-01-02' AS DATE),
        N'The smart watch in your babys hand is now more useful than ever. Besides location control, you can also make 4G video calls for your child anytime, anywhere and a series of interesting features with Masstel Super HERO 4G.',
        N'Monitor: 240 x 240 Pixels<br>
Internal memory: 4 GB<br>
Material: Wire: Plastic - Glass: Glass: Glass<br>
Operating system: Android<br>
Compatible operating system: Android<br>
Battery life: 48 hours', 2490000.0000, 15, 99, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (81, N'OPPO Band Smart Bracelet (OB19B1)', 3, 3, CAST(N'2021-06-01' AS DATE),
        N'Oppo Band with a sharp AMOLED color screen, supports heart rate measurement, blood oxygen level measurement, 12 exercise modes and water resistance at a depth of 50m will be the smart bracelet full of energy for you.',
        N'Monitor: 126 x 294 Pixels<br>
Internal memory: 16 MB<br>
Material: Wire: TPU - Glass: 2.5D Curved Glass<br>
Operating system: Android<br>
Compatible operating system: Android<br>
Battery life: About 12 days', 790000.0000, 5, 66, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (82, N'Huawei Watch Fit', 3, 11, CAST(N'2020-01-01' AS DATE),
        N'The perfect Huawei Watch Fit lightweight watch on your wrist, the stunning AMOLED display will act as a professional trainer, helping your exercises to be more effective and healthy every day.',
        N'Monitor: 1.64 inches, AMOLED, 456 x 280 Pixels<br>
CPU: Kirin A1<br>
Internal memory: 4 GB<br>
Material: Glass: Gorilla Glass 3 - Wire: Silicone<br>
Operating system: Lite OS<br>
Compatible operating system: Ios<br>
Battery life: 10 days', 3290000.0000, 0, 30, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (83, N'Anker PowerCore Select 10000mAh A1223', 4, 13, CAST(N'2021-09-01' AS DATE),
        N'The PowerCore Select A1223 battery charger comes from Anker, a brand that has long been well known in the manufacturing and sales of phone accessories with high-quality products. The 10,000 mAh battery capacity of the Anker PowerCore Select A1223 combines with modern features that allow users to enjoy charging the battery for the smartphone to be assured of use throughout the day.',
        N'Battery capacity: 10000 mAh<br>
Battery core: Lithium-ion<br>
Gateway	Input: Micro-USB, Output: USB 2.0<br>
Feature: Automatically balance charging time and line calibration', 699000.0000, 5, 60, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (84, N'Anker PowerCore Slim 10000mAh PD - A1231', 4, 13, CAST(N'2021-10-01' AS DATE),
        N'The Anker PowerCore Slim has a compact design with a thickness of only 14.5mm and an ultra-light weight of 212g. With these parameters, users can easily carry the backup rechargeable battery anywhere without feeling entangled. The compact size of the product also allows it to fit in the pocket of jeans or handbags.',
        N'Battery capacity: 10000 mAh<br>
Battery core: Lithium-ion<br>
Gateway	Output: USB 2.0, Input: Type C, Output: Type C<br>
Feature: PD standard fast charging', 1000000.0000, 10, 49, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (85, N'Anker PowerCore 20000mAh Speed QC 3.0', 4, 13, CAST(N'2021-11-01' AS DATE),
        N'Designed with a lightweight minimalist style, featuring three leading fast charging technologies and compatible with every smartphone on the market, the PowerCore Speed QC 3.0 20,000mAh is a great solution for busy people to charge their phones and other electronic devices during a long business trip.',
        N'Battery capacity: 20000 mAh<br>
Battery core: Lithium-ion<br>
Feature: Premium Battery Core, Power Management, Automatic Charging Time Balance and Line Calibration', 1550000.0000,
        15, 38, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (86, N'Samsung Battery Pack 10,000 mAh', 4, 2, CAST(N'2022-01-01' AS DATE),
        N'Despite being only a spare rechargeable battery, the Samsung Battery Pack is still taken care of by the manufacturer right from the outside. The entire exterior of the backup charger is completed with aluminum alloy material, giving a high-end and luxurious appearance.',
        N'Battery capacity: 10000 mAh<br>
Battery core: Lithium polymer<br>
Gateway: Output: USB 2.0, Input: Type C<br>
Feature: Power Management, Premium Battery Core, Automatic Charging Time Balance and Line Calibration', 390000.0000, 5,
        50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (87, N'Ivalue 20000mAh MT-P200-001 (HK-108)', 4, 14, CAST(N'2022-01-01' AS DATE), N'',
        N'Battery capacity: 20000 mAh', 999000.0000, 10, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (88, N'ivalue 10000mAh Y1-5 Port Micro & Type-C', 4, 14, CAST(N'2021-06-02' AS DATE), N'',
        N'Battery capacity: 20000 mAh
		Gateway: Micro & Type-C', 599000.0000, 25, 60, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (89, N'UmeTravel 10000mAH PW1 Wireless ', 4, 15, CAST(N'2022-05-01' AS DATE),
        N'The Umetravel PW1 rechargeable battery has an exterior case design made from ultra-durable ABS resin with effective external resistance. In addition, the spare battery case is added with a shock-proof rubber layer for maximum protection for the battery cells and the inner board. Users can choose Umetravel PW1 in two color options, Black and Blue. Both of these colors are very modern and luxurious.',
        N'Battery capacity: 10000 mAh<br>
Battery core: Lithium polymer<br>
Gateway: Output: USB 2.0, Output: Type C, Input: Micro-USB<br>
Feature: Automatic balance of charging time and line calibration, Premium battery core, Wireless charging support for qi-enabled devices',
        999000.0000, 10, 54, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (90, N'UmeTravel 20000mAh TRIP20000 Quick Charge', 4, 15, CAST(N'2021-12-01' AS DATE),
        N'With a smart design, many modern features and extremely durable, the Quick Charge UMETRAVEL TRIP20000 spare rechargeable battery will be the optimal solution for you to bring your energy reserves with you. The compact size of the product allows the charger to maximize mobility in order to better support the user.',
        N'Battery capacity: 20000 mAh<br>
Battery core: Lithium polymer<br>
Gateway	Input: Type C, Input: Micro-USB, Output: Type C, Output: USB 2.0<br>
Feature: Premium Battery Core, Automatic Charging Time Balance and Line Correction, Power Manage', 999000.0000, 15, 77,
        1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (91, N'Veger 10000mAh L10 PD&QC3.0 ', 4, 16, CAST(N'2021-02-08' AS DATE),
        N'The Li-Polymer VEGER L10 PD&QC3.0 rechargeable battery pack brings together the most modern technologies in the field including Power Delivery power control and Quick Charge 3.0 fast charging. As a result, the product ensures two key factors: safety and convenience. In addition, the luxurious modern design is also a big plus that VEGER brings to the device',
        N'Battery capacity: 10000 mAh<br>
Battery core: Lithium polymer<br>
Gateway: Output: Type C, Output: USB 3.0<br>
Feature: Power Management, Automatic Balance of Charging Time and Line Correction, Premium Battery Core', 799000.0000,
        5, 66, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (92, N'Anker 20W Powerport III A2033 Fast Charger', 4, 13, CAST(N'2022-02-25' AS DATE),
        N'If youre struggling to find an effective charging solution for the iPhone 12, Android smartphone or tablets in your home, this Anker 20W Powerport III A2633 fast charger is the ideal choice. The ultra-compact nano design, high-speed charging capabilities and guaranteed safety from the worlds leading brand of rechargeable batteries are brief descriptions of this product.',
        N'Kind: Charging adapter<br>
Material: Resin<br>
Communication port: Type C<br>
Use for equipment: Tablet, iPhone, Phone<br>
Feature: 20W Fast Charging, Quick Charge 3.0 Compatibility', 400000.0000, 10, 65, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (93, N'USB-C to Lightning Anker PowerLine Select A8613', 4, 13, CAST(N'2022-02-25' AS DATE),
        N'PowerLine Select A8613 - the product that Anker is proud to be the fastest and most durable connected cable on the market today. Manufactured to support fast charging technology on compatible models and ensure safe battery charging, both saving waiting time and achieving optimal stability efficiency.',
        N'Kind: Conversion Cable<br>
Material: Resin<br>
Communication port: Input: Type C, Output: Lightning<br>
Use for equipment: Tablets, Phones<br>
Feature: PD standard fast charging', 500000.0000, 0, 46, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (94, N'MagSafe Duo Charger Double Charging Dock', 4, 1, CAST(N'2022-04-16' AS DATE),
        N'The MagSafe Duo Charger double charging dock helps users power the AirPods, Apple Watch and iPhone in the simplest way. In particular, this wireless charging dock also supports charging two Apple devices at the same time.',
        N'Communication port: Input: Type C, Output: Magsafe Charger<br>
Current intensity: 14W<br>
Use for equipment: Phone, Apple Watch, iPhone<br>
Feature: Fast charging', 2990000.0000, 5, 45, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (95, N'USB-C to Lightning Apple Cable', 4, 1, CAST(N'2021-07-17' AS DATE),
        N'Lightning to USB-C cable is the best solution for you to connect your iPhone, iPad, or iPod Touch to USB-C devices such as a Macbook or iPad Pro. The product allows you to promote fast charging on supported devices, while also helping to transmit data in the most agile and efficient way.',
        N'Kind: Charging cable<br>
Communication port: Type C, Lightning<br>
Feature: Fast Charging, Data Transfer<br>
Use for equipment: iPhone, Laptop, Tablet, Phone, iPad, Desktop, Mac', 999000.0000, 15, 50, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (96, N'Apple Power Adapter 20W Type-C Charger', 4, 1, CAST(N'2021-10-11' AS DATE),
        N'Fast charging 20W USB-C Power Adapter is the perfect accessory for iPhone, iPad has fast charging support, especially the newly launched iPhone 12 series. A genuine accessory product from Apple will bring optimal charging performance and safety to your iPhone, iPad.',
        N'Kind: Charging adapter<br>
Communication port: Type C<br>
Feature: Fast charging<br>
Use for equipment: Tablet, iPhone, Phone, iPad', 500000.0000, 5, 60, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (97, N'Belkin 37W 2 Port Fast Charger (USB-C PD 25W + USB-A 12W)', 4, 17, CAST(N'2021-12-12' AS DATE),
        N'Coming from the worlds leading accessory manufacturer, the Belkin 37W fast charging adapter includes a 25W USB-C charging port and a 12W USB-A port. The product is designed to take advantage of the optimal fast charging capacity on the iPhone of 20W and for Android smartphones is 25W, while also possessing many technologies to ensure the safety of users.',
        N'Kind: Charging adapter<br>
Material: Premium plastic<br>
Communication port: Type C, USB<br>
Current intensity: 3A<br>
Feature: Fast charging, Charging at the same time is multiple devices, Smart charging protected when overcharged<br>
Use for equipment: Phone, Tablet, Smartwatch', 799000.0000, 8, 65, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (98, N'Belkin Playa MFI Lightning Cable 1m PVC Shell', 4, 17, CAST(N'2021-11-01' AS DATE),
        N'The Belkin Playa 1m Lightning MFI connector cable is a good choice for those who are looking for battery charging accessories and connectivity for iPhone, iPad or AirPods. The product is perfectly compatible with those produced by Apple when it achieves the permanent MFi certification provided by Apple.',
        N'Kind: Charging cable<br>
Material: Premium plastic<br>
Communication port: Output: Lightning, Input: USB<br>
Feature: Data Transfer, 12W Fast Charging<br>
Use for equipment: Phone, iPad, iPhone, Tablet', 350000.0000, 5, 44, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (99, N'UmeTravel 18W A3X 1 Port Fast Charger', 4, 15, CAST(N'2021-02-09' AS DATE),
        N'With efficient 18W fast charging technology, the Umetravel A3X fast charger will help you quickly restore power to your smartphone or tablet without much waiting time. The product can be well compatible with many mobile devices, from Android models to iPhone or iPad.',
        N'Kind: Charging adapter<br>
Material: Resin<br>
Communication port: USB<br>
Current intensity: Up to 18W<br>
Feature: Fast charging<br>
Use for equipment: Phone, Tablet', 350000.0000, 4, 55, 1);
GO
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (100, N'UmeTravel Military fibre C3L Lightning Cable', 4, 15, CAST(N'2021-09-27' AS DATE),
        N'The Lightning Umetravel Military fibre C3L cable will greatly support iPhone/iPad users during use when not only supporting efficient battery charging, but also very useful when it comes to connecting a mobile device to a PC or laptop to transmit or copy data.',
        N'Kind: Charging cable<br>
Material: Fibre yarn<br>
Communication port: Output: Lightning, Input: USB<br>
Feature: Data Transfer, Charging<br>
Use for equipment: Phone, Tablet', 169000.0000, 10, 100, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (101, N'Type-C UmeTravel Military fibre C1 1m Cable', 4, 15, CAST(N'2022-01-01' AS DATE),
        N'Type-C UmeTravel Military fibre C1 1m Cable',
        N'Kind: Charging cable<br>
Material: Fibre yarn<br>
Communication port: Output: Type C, Input: USB<br>
Use for equipment: Phone, Tablet<br>
Feature: Data Transfer, Charging', 169000.0000, 0, 46, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (102, N'TWS Anker Soundcore Liberty Air 2 Bluetooth Headphones - A3910', 4, 13, CAST(N'2021-07-12' AS DATE),
        N'',
        N'Headphone type: Wireless headphones<br>
Battery capacity: 1000 mAh<br>
Feature: IPX5 Water Resistance, Noise Protection', 3000000.0000, 10, 70, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (103, N'AirPods Pro ', 4, 1, CAST(N'2021-12-01' AS DATE),
        N'AirPods Pro will immerse you in a deep music space and provide an unprecedented entertainment experience on apple wireless headphones. Powerful upgrades in design and technology make AirPods Pro headphones a true professional music player.',
        N'Headphone type: Wireless headphones<br>
Feature: Waterproof, Noise Resistant, Listening to Music, Conversation Mic', 5999000.0000, 20, 52, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (104, N'EarPods with Lightning Connector', 4, 1, CAST(N'2021-05-01' AS DATE),
        N'Earpods with Lightning Connection headphones are a great product exclusively for iPhone lines (from the iPhone 7 series onwards). If you are a sound fanatic then this headset will be an option because of its high convenience and good sound.',
        N'Headphone type: Earbuds', 599000.0000, 12, 90, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (105, N'Ivalue BT008 Bluetooth Headphones ', 4, 14, CAST(N'2022-01-10' AS DATE),
        N'The design of the strap around the mini neck combined with the ear insert mechanism helps the I.value BT008 earbuds maximize the strengths of bluetooth wireless connectivity, thereby supporting users effectively during jogging or sports, avoiding causing unpleasant entanglement.',
        N'Headphone type: Wireless headphones<br>
Battery capacity: 110 mAh<br>
Feature: Listen to music, talk mic, watch movies', 450000.0000, 0, 60, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (106, N'Sony Extra Bass MDR-EX155AP earbuds', 4, 19, CAST(N'2021-12-09' AS DATE), N'',
        N'Headphone type: Earbuds
Origin: China', 390000.0000, 5, 90, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (107, N'JBL T115TWSREDAS Bluetooth Headphones', 4, 20, CAST(N'2022-03-01' AS DATE),
        N'Designed with a small size, a comfortable feeling on the ears and a subtle bass, the JBL T115TWS is a very bright choice in the True-Wireless headphone market today. The plus point of the product lies in the battery life totaling 21 hours when combined with the included charging case.',
        N'Headphone type: Wireless headphones<br>
Origin: China', 1490000.0000, 0, 45, 1);
INSERT [dbo].[product] ([id],
                        [name],
                        [categoryId],
                        [brandId],
                        [releaseDate],
                        [description],
                        [specification],
                        [price],
                        [discount],
                        [quantity],
                        [stateId])
VALUES (108, N'JBL QUANTUM50BLKAS earbuds with mic', 4, 20, CAST(N'2022-01-01' AS DATE),
        N'Coming from one of the worlds leading audio equipment brands, the JBL Quantum 50 headphones deliver an honest, edgy sound quality thanks to the use of an 8.6mm driver. The product has a youthful design and modern color scheme, which is very suitable for enjoying entertainment tasks such as playing games or watching movies, the built-in microphone on the cable will support clear conversation.',
        N'Headphone type: Earbuds<br>
Origin: China', 890000.0000, 10, 100, 1);
SET IDENTITY_INSERT [dbo].[product] OFF;
GO
SET IDENTITY_INSERT [dbo].[state] ON;

INSERT [dbo].[state] ([id],
                      [name])
VALUES (1, N'In stock');
INSERT [dbo].[state] ([id],
                      [name])
VALUES (2, N'Out of stock');
INSERT [dbo].[state] ([id],
                      [name])
VALUES (3, N'');
SET IDENTITY_INSERT [dbo].[state] OFF;
GO
SET IDENTITY_INSERT [dbo].[transport] ON;

INSERT [dbo].[transport] ([id],
                          [name],
                          [price])
VALUES (1, N'MyExpress', 0.0000);
INSERT [dbo].[transport] ([id],
                          [name],
                          [price])
VALUES (2, N'Viettel Post', 20000.0000);
INSERT [dbo].[transport] ([id],
                          [name],
                          [price])
VALUES (3, N'Vietnam Post', 30000.0000);
INSERT [dbo].[transport] ([id],
                          [name],
                          [price])
VALUES (4, N'GrabExpress', 45000.0000);
SET IDENTITY_INSERT [dbo].[transport] OFF;
GO
SET ANSI_PADDING ON;
GO
/****** Object:  Index [UQ__account__AB6E616443FE0E9A]    Script Date: 7/19/2022 8:14:41 AM ******/
ALTER TABLE [dbo].[account]
ADD
    UNIQUE NONCLUSTERED ([email] ASC)
    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF,
          ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY];
GO
ALTER TABLE [dbo].[account] ADD DEFAULT ('default.png') FOR [avatar];
GO
ALTER TABLE [dbo].[account] ADD DEFAULT ((0)) FOR [amount];
GO
ALTER TABLE [dbo].[account] ADD DEFAULT ((100000000)) FOR [role];
GO
ALTER TABLE [dbo].[order] ADD DEFAULT ((1)) FOR [stateId];
GO
ALTER TABLE [dbo].[image] WITH CHECK
ADD
    FOREIGN KEY ([productId]) REFERENCES [dbo].[product] ([id]);
GO
ALTER TABLE [dbo].[order] WITH CHECK
ADD
    FOREIGN KEY ([accountId]) REFERENCES [dbo].[account] ([id]);
GO
ALTER TABLE [dbo].[order] WITH CHECK
ADD
    FOREIGN KEY ([stateId]) REFERENCES [dbo].[orderState] ([id]);
GO
ALTER TABLE [dbo].[order] WITH CHECK
ADD
    FOREIGN KEY ([transportId]) REFERENCES [dbo].[transport] ([id]);
GO
ALTER TABLE [dbo].[orderDetail] WITH CHECK
ADD
    FOREIGN KEY ([orderId]) REFERENCES [dbo].[order] ([id]);
GO
ALTER TABLE [dbo].[orderDetail] WITH CHECK
ADD
    FOREIGN KEY ([productId]) REFERENCES [dbo].[product] ([id]);
GO
ALTER TABLE [dbo].[product] WITH CHECK
ADD
    FOREIGN KEY ([brandId]) REFERENCES [dbo].[brand] ([id]);
GO
ALTER TABLE [dbo].[product] WITH CHECK
ADD
    FOREIGN KEY ([categoryId]) REFERENCES [dbo].[category] ([id]);
GO
ALTER TABLE [dbo].[product] WITH CHECK
ADD
    FOREIGN KEY ([stateId]) REFERENCES [dbo].[state] ([id]);
GO
USE [master];
GO
ALTER DATABASE [ProjectPRJ301] SET READ_WRITE;
GO
