USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 18/03/2024 2:55:39 CH ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assignment.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Assignment_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment', N'ON'
GO
ALTER DATABASE [Assignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 18/03/2024 2:55:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[id] [int] NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[leid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[isPresent] [bit] NOT NULL,
	[capturetime] [datetime] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[leid] [int] IDENTITY(1,1) NOT NULL,
	[gid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[isAttended] [bit] NOT NULL,
 CONSTRAINT [PK_Lession] PRIMARY KEY CLUSTERED 
(
	[leid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[pid] [int] NOT NULL,
	[pname] [varchar](50) NOT NULL,
	[suid] [int] NOT NULL,
	[weight] [real] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleid] [int] NOT NULL,
	[rolename] [varchar](150) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[username] [varchar](150) NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[roleid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[scoreid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[value] [real] NOT NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[scoreid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
	[img] [nvarchar](150) NOT NULL,
	[member] [nvarchar](150) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[gid] [int] NOT NULL,
	[gname] [varchar](50) NOT NULL,
	[suid] [int] NOT NULL,
	[lid] [int] NOT NULL,
 CONSTRAINT [PK_StudentGroup] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[suid] [int] NOT NULL,
	[suname] [varchar](50) NOT NULL,
	[credit] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[suid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 18/03/2024 2:55:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[tname] [varchar](50) NOT NULL,
	[tperiod] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [id], [displayname]) VALUES (N'admin@fpt.edu.vn', N'123', 1, N'Admin')
INSERT [dbo].[Account] ([username], [password], [id], [displayname]) VALUES (N'ducdm@fpt.edu.vn', N'123', 4, N'DangMinhDuc')
INSERT [dbo].[Account] ([username], [password], [id], [displayname]) VALUES (N'dungltk@fpt.edu.vn', N'123', 3, N'LuuThiKimDung')
INSERT [dbo].[Account] ([username], [password], [id], [displayname]) VALUES (N'hungvd@fpt.edu.vn', N'123', 1, N'VoDinhHung')
INSERT [dbo].[Account] ([username], [password], [id], [displayname]) VALUES (N'sonnt@fpt.edu.vn', N'123', 1, N'NgoTungSon')
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (141, 42, 1, N'rat nghich', 1, CAST(N'2024-03-14T15:22:52.533' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (142, 42, 2, N'', 1, CAST(N'2024-03-14T15:22:52.533' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (143, 42, 3, N'', 1, CAST(N'2024-03-14T15:22:52.537' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (144, 42, 4, N'', 0, CAST(N'2024-03-14T15:22:52.550' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (145, 42, 5, N'', 1, CAST(N'2024-03-14T15:22:52.560' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (146, 42, 6, N'', 1, CAST(N'2024-03-14T15:22:52.563' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (147, 42, 7, N'', 0, CAST(N'2024-03-14T15:22:52.570' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (148, 42, 8, N'', 1, CAST(N'2024-03-14T15:22:52.570' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (149, 42, 9, N'', 0, CAST(N'2024-03-14T15:22:52.570' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (150, 42, 10, N'', 0, CAST(N'2024-03-14T15:22:52.580' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (151, 42, 11, N'', 1, CAST(N'2024-03-14T15:22:52.593' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (152, 42, 12, N'', 0, CAST(N'2024-03-14T15:22:52.610' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (153, 42, 13, N'', 0, CAST(N'2024-03-14T15:22:52.623' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (154, 42, 14, N'', 0, CAST(N'2024-03-14T15:22:52.623' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (155, 42, 15, N'', 0, CAST(N'2024-03-14T15:22:52.647' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (156, 42, 16, N'', 0, CAST(N'2024-03-14T15:22:52.650' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (157, 42, 17, N'', 0, CAST(N'2024-03-14T15:22:52.677' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (158, 42, 18, N'', 0, CAST(N'2024-03-14T15:22:52.693' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (159, 42, 19, N'', 0, CAST(N'2024-03-14T15:22:52.717' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (160, 42, 20, N'', 0, CAST(N'2024-03-14T15:22:52.720' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (161, 42, 21, N'', 0, CAST(N'2024-03-14T15:22:52.720' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (162, 42, 22, N'', 0, CAST(N'2024-03-14T15:22:52.720' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (163, 42, 23, N'', 0, CAST(N'2024-03-14T15:22:52.750' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (164, 42, 24, N'', 0, CAST(N'2024-03-14T15:22:52.763' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (165, 42, 25, N'', 0, CAST(N'2024-03-14T15:22:52.763' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (166, 42, 26, N'', 0, CAST(N'2024-03-14T15:22:52.767' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (167, 42, 27, N'', 0, CAST(N'2024-03-14T15:22:52.787' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (168, 42, 28, N'', 0, CAST(N'2024-03-14T15:22:52.807' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (169, 42, 29, N'', 0, CAST(N'2024-03-14T15:22:52.807' AS DateTime))
INSERT [dbo].[Attendance] ([aid], [leid], [sid], [description], [isPresent], [capturetime]) VALUES (170, 42, 30, N'', 0, CAST(N'2024-03-14T15:22:52.810' AS DateTime))
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Progress test 1')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Progress test 2')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Workshop 1')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Workshop 2')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'Practical Exam')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (6, N'Assignment')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (7, N'Final Exam')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (8, N'Final Exam Resit')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (9, N'Computer Project')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (10, N'Progress Test')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (11, N'Participation')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (12, N'Mid-term test')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (13, N'Active learning')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (14, N'Exercise')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (15, N'Presentation')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (16, N'Project')
GO
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (6, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (6, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (6, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (8, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (8, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (9, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (9, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (9, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (9, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (9, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (10, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (10, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (10, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (11, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (11, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (11, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (11, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (12, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (12, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (12, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (12, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (13, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (13, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (13, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (13, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (14, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (14, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (14, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (15, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (15, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (15, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (15, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (15, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (16, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (16, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (16, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (16, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (17, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (17, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (17, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (17, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (18, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (18, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (18, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (18, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (19, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (19, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (19, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (19, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (20, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (20, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (20, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (20, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (21, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (21, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (21, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (21, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (21, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (21, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (22, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (22, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (22, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (22, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (23, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (23, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (23, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (23, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (23, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (24, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (24, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (24, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (24, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (24, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (25, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (25, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (25, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (25, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (25, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (26, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (26, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (26, 6)
GO
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (27, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (27, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (27, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (27, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (27, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (28, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (28, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (28, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (29, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (29, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (29, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (29, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (29, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (30, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (30, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (30, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (30, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (31, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (31, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (31, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (31, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (31, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (32, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (32, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (32, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (33, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (33, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (33, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (33, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (33, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (33, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (34, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (34, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (34, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (35, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (35, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (35, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (35, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (35, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (36, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (36, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (36, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (36, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (37, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (37, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (37, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (37, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (38, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (38, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (38, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (39, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (39, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (39, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (39, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (39, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (40, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (40, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (40, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (41, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (41, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (41, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (41, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (42, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (42, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (42, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (42, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (43, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (43, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (43, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (43, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (44, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (44, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (44, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (45, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (45, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (45, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (45, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (45, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (46, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (46, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (46, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (47, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (47, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (47, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (47, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (48, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (48, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (48, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (48, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (49, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (49, 6)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (49, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (49, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (50, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (50, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (51, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (51, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (51, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (51, 8)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (52, 3)
GO
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (52, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (52, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (53, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (53, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (54, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (54, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (54, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (54, 7)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (55, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (56, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (57, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (57, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (58, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (59, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (60, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (60, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (60, 5)
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'Lecturer Schedule', N'/lecturer/schedule')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Lecturer Take Attendance', N'/lecturer/takeattendance')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'Student Schedule', N'/student/schedule')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'Student List', N'/student/list')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (5, N'Student Score List', N'/student/score')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (6, N'Lecturer Give Score', N'/lecturer/givescore')
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (1, N'Sonnt5')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (2, N'NgoanNT7')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (3, N'DungLTK')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (4, N'Ducdm39')
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1, 1, 1, 1, 1, CAST(N'2024-01-03' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (2, 1, 2, 1, 1, CAST(N'2024-01-05' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (5, 1, 1, 1, 1, CAST(N'2024-01-10' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (7, 1, 2, 1, 1, CAST(N'2024-01-12' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (11, 1, 1, 1, 1, CAST(N'2024-01-17' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (12, 1, 2, 1, 1, CAST(N'2024-01-19' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (32, 1, 1, 1, 1, CAST(N'2024-01-24' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (33, 1, 2, 1, 1, CAST(N'2024-01-26' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (34, 1, 1, 1, 1, CAST(N'2024-01-31' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (35, 1, 2, 1, 1, CAST(N'2024-02-02' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (36, 1, 1, 1, 1, CAST(N'2024-02-21' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (37, 1, 2, 1, 1, CAST(N'2024-02-23' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (38, 1, 1, 1, 1, CAST(N'2024-02-28' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (39, 1, 2, 1, 1, CAST(N'2024-03-01' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (40, 1, 1, 1, 1, CAST(N'2024-03-06' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (41, 1, 2, 1, 1, CAST(N'2024-03-08' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (42, 1, 1, 1, 1, CAST(N'2024-03-13' AS Date), 1)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (43, 1, 2, 1, 1, CAST(N'2024-03-15' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (44, 1, 1, 1, 1, CAST(N'2024-03-20' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (45, 1, 2, 1, 1, CAST(N'2024-03-22' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (48, 2, 2, 2, 1, CAST(N'2024-01-02' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (49, 2, 1, 2, 1, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (50, 2, 2, 2, 1, CAST(N'2024-01-09' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (51, 2, 1, 2, 1, CAST(N'2024-01-11' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (52, 2, 2, 2, 1, CAST(N'2024-01-16' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (53, 2, 1, 2, 1, CAST(N'2024-01-18' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (54, 2, 2, 2, 1, CAST(N'2024-01-23' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (55, 2, 1, 2, 1, CAST(N'2024-01-25' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (56, 2, 2, 2, 1, CAST(N'2024-01-30' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (57, 2, 1, 2, 1, CAST(N'2024-02-01' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (58, 2, 2, 2, 1, CAST(N'2024-02-20' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (59, 2, 1, 2, 1, CAST(N'2024-02-22' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (60, 2, 2, 2, 1, CAST(N'2024-02-27' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (61, 2, 1, 2, 1, CAST(N'2024-02-29' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (62, 2, 2, 2, 1, CAST(N'2024-03-05' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (63, 2, 1, 2, 1, CAST(N'2024-03-07' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (64, 2, 2, 2, 1, CAST(N'2024-03-12' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (65, 2, 1, 2, 1, CAST(N'2024-03-14' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (66, 2, 2, 2, 1, CAST(N'2024-03-19' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (67, 2, 1, 2, 1, CAST(N'2024-03-21' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (68, 3, 1, 3, 1, CAST(N'2024-01-02' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (69, 3, 2, 3, 1, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (70, 3, 1, 3, 1, CAST(N'2024-01-09' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (71, 3, 2, 3, 1, CAST(N'2024-01-11' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (72, 3, 1, 3, 1, CAST(N'2024-01-16' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (73, 3, 2, 3, 1, CAST(N'2024-01-18' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (74, 3, 1, 3, 1, CAST(N'2024-01-23' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (75, 3, 2, 3, 1, CAST(N'2024-01-25' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (76, 3, 1, 3, 1, CAST(N'2024-01-30' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (77, 3, 2, 3, 1, CAST(N'2024-02-01' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (78, 3, 1, 3, 1, CAST(N'2024-02-20' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (79, 3, 2, 3, 1, CAST(N'2024-02-22' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (80, 3, 1, 3, 1, CAST(N'2024-02-27' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (81, 3, 2, 3, 1, CAST(N'2024-02-29' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (82, 3, 1, 3, 1, CAST(N'2024-03-05' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (83, 3, 2, 3, 1, CAST(N'2024-03-07' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (84, 3, 1, 3, 1, CAST(N'2024-03-12' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (85, 3, 2, 3, 1, CAST(N'2024-03-14' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (86, 3, 1, 3, 1, CAST(N'2024-03-19' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (87, 3, 2, 3, 1, CAST(N'2024-03-21' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (88, 4, 2, 4, 1, CAST(N'2024-01-03' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (89, 4, 1, 4, 1, CAST(N'2024-01-05' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (90, 4, 2, 4, 1, CAST(N'2024-01-10' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (91, 4, 1, 4, 1, CAST(N'2024-01-12' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (92, 4, 2, 4, 1, CAST(N'2024-01-17' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (93, 4, 1, 4, 1, CAST(N'2024-01-19' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (94, 4, 2, 4, 1, CAST(N'2024-01-24' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (95, 4, 1, 4, 1, CAST(N'2024-01-26' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (96, 4, 2, 4, 1, CAST(N'2024-01-31' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (97, 4, 1, 4, 1, CAST(N'2024-02-02' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (98, 4, 2, 4, 1, CAST(N'2024-02-21' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (99, 4, 1, 4, 1, CAST(N'2024-02-23' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (100, 4, 2, 4, 1, CAST(N'2024-02-28' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (101, 4, 1, 4, 1, CAST(N'2024-03-01' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (102, 4, 2, 4, 1, CAST(N'2024-03-06' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (103, 4, 1, 4, 1, CAST(N'2024-03-08' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (104, 4, 2, 4, 1, CAST(N'2024-03-13' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (105, 4, 1, 4, 1, CAST(N'2024-03-15' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (106, 4, 2, 4, 1, CAST(N'2024-03-20' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (107, 4, 1, 4, 1, CAST(N'2024-03-22' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (108, 5, 3, 3, 1, CAST(N'2024-01-02' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (109, 5, 4, 3, 1, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (110, 5, 3, 3, 1, CAST(N'2024-01-09' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (111, 5, 4, 3, 1, CAST(N'2024-01-11' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (112, 5, 3, 3, 1, CAST(N'2024-01-16' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (113, 5, 4, 3, 1, CAST(N'2024-01-18' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (114, 5, 3, 3, 1, CAST(N'2024-01-23' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (115, 5, 4, 3, 1, CAST(N'2024-01-25' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (116, 5, 3, 3, 1, CAST(N'2024-01-30' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (117, 5, 4, 3, 1, CAST(N'2024-02-01' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (118, 5, 3, 3, 1, CAST(N'2024-02-20' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (119, 5, 4, 3, 1, CAST(N'2024-02-22' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (120, 5, 3, 3, 1, CAST(N'2024-02-27' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (121, 5, 4, 3, 1, CAST(N'2024-02-29' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (122, 5, 3, 3, 1, CAST(N'2024-03-05' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (123, 5, 4, 3, 1, CAST(N'2024-03-07' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (124, 5, 3, 3, 1, CAST(N'2024-03-12' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (125, 5, 4, 3, 1, CAST(N'2024-03-14' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (126, 5, 3, 3, 1, CAST(N'2024-03-19' AS Date), 0)
GO
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (127, 5, 4, 3, 1, CAST(N'2024-03-21' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (128, 6, 4, 2, 1, CAST(N'2024-01-02' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (129, 6, 3, 2, 1, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (130, 6, 4, 2, 1, CAST(N'2024-01-09' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (131, 6, 3, 2, 1, CAST(N'2024-01-11' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (132, 6, 4, 2, 1, CAST(N'2024-01-16' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (133, 6, 3, 2, 1, CAST(N'2024-01-18' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (134, 6, 4, 2, 1, CAST(N'2024-01-23' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (135, 6, 3, 2, 1, CAST(N'2024-01-25' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (136, 6, 4, 2, 1, CAST(N'2024-01-30' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (137, 6, 3, 2, 1, CAST(N'2024-02-01' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (138, 6, 4, 2, 1, CAST(N'2024-02-20' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (139, 6, 3, 2, 1, CAST(N'2024-02-22' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (140, 6, 4, 2, 1, CAST(N'2024-02-27' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (141, 6, 3, 2, 1, CAST(N'2024-02-29' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (142, 6, 4, 2, 1, CAST(N'2024-03-05' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (143, 6, 3, 2, 1, CAST(N'2024-03-07' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (144, 6, 4, 2, 1, CAST(N'2024-03-12' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (145, 6, 3, 2, 1, CAST(N'2024-03-14' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (146, 6, 4, 2, 1, CAST(N'2024-03-19' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (147, 6, 3, 2, 1, CAST(N'2024-03-21' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (148, 7, 2, 1, 4, CAST(N'2024-01-03' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (149, 7, 1, 1, 4, CAST(N'2024-01-05' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (150, 7, 2, 1, 4, CAST(N'2024-01-10' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (151, 7, 1, 1, 4, CAST(N'2024-01-12' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (152, 7, 2, 1, 4, CAST(N'2024-01-17' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (153, 7, 1, 1, 4, CAST(N'2024-01-19' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (154, 7, 2, 1, 4, CAST(N'2024-01-24' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (155, 7, 1, 1, 4, CAST(N'2024-01-26' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (156, 7, 2, 1, 4, CAST(N'2024-01-31' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (157, 7, 1, 1, 4, CAST(N'2024-02-02' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (158, 7, 2, 1, 4, CAST(N'2024-02-21' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (159, 7, 1, 1, 4, CAST(N'2024-02-23' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (160, 7, 2, 1, 4, CAST(N'2024-02-28' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (161, 7, 1, 1, 4, CAST(N'2024-03-01' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (162, 7, 2, 1, 4, CAST(N'2024-03-06' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (163, 7, 1, 1, 4, CAST(N'2024-03-08' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (164, 7, 2, 1, 4, CAST(N'2024-03-13' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (165, 7, 1, 1, 4, CAST(N'2024-03-15' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (166, 7, 2, 1, 4, CAST(N'2024-03-20' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (167, 7, 1, 1, 4, CAST(N'2024-03-22' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (210, 8, 1, 1, 3, CAST(N'2024-01-02' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (211, 8, 2, 1, 3, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (212, 8, 1, 1, 3, CAST(N'2024-01-09' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (213, 8, 2, 1, 3, CAST(N'2024-01-11' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (214, 8, 1, 1, 3, CAST(N'2024-01-16' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (215, 8, 2, 1, 3, CAST(N'2024-01-18' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (216, 8, 1, 1, 3, CAST(N'2024-01-23' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (217, 8, 2, 1, 3, CAST(N'2024-01-25' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (218, 8, 1, 1, 3, CAST(N'2024-01-30' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (219, 8, 2, 1, 3, CAST(N'2024-02-01' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (220, 8, 1, 1, 3, CAST(N'2024-02-20' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (221, 8, 2, 1, 3, CAST(N'2024-02-22' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (222, 8, 1, 1, 3, CAST(N'2024-02-27' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (223, 8, 2, 1, 3, CAST(N'2024-02-29' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (224, 8, 1, 1, 3, CAST(N'2024-03-05' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (225, 8, 2, 1, 3, CAST(N'2024-03-07' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (226, 8, 1, 1, 3, CAST(N'2024-03-12' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (227, 8, 2, 1, 3, CAST(N'2024-03-14' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (228, 8, 1, 1, 3, CAST(N'2024-03-19' AS Date), 0)
INSERT [dbo].[Lesson] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (229, 8, 2, 1, 3, CAST(N'2024-03-21' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (1, N'Progress test 1', 1, 0.05, 1)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (2, N'Progress test 2', 1, 0.05, 2)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (3, N'Workshop 1', 1, 0.05, 3)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (4, N'Workshop 2', 1, 0.05, 4)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (5, N'Practical Exam', 1, 0.2, 5)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (6, N'Assignment', 1, 0.4, 6)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (7, N'Final Exam', 1, 0.2, 7)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (8, N'	Final Exam Resit', 1, 0.2, 8)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (9, N'Computer Project', 2, 0.15, 9)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (10, N'Assignment 1', 2, 0.1, 6)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (11, N'Assignment 2', 2, 0.1, 6)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (12, N'Progress Test 1', 2, 0.1, 10)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (13, N'Progress Test 2', 2, 0.1, 10)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (14, N'Progress Test 3', 2, 0.1, 10)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (15, N'Final Exam', 2, 0.35, 7)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (16, N'Final Exam Resit', 2, 0.35, 8)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (17, N'Participation', 3, 0.1, 11)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (18, N'Progress test 1', 3, 0.1, 10)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (19, N'Progress test 2', 3, 0.1, 10)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (20, N'Mid-term test', 3, 0.3, 12)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (21, N'FE: Listening', 3, 0.1, 7)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (22, N'FE: GVR', 3, 0.3, 7)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (23, N'FE: Listening Resit', 3, 0.1, 8)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (24, N'FE: GVR Resit', 3, 0.3, 8)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (25, N'Active learning', 4, 0.1, 13)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (26, N'Exercise 1', 4, 0.05, 14)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (27, N'Exercise 2', 4, 0.05, 14)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (28, N'Presentation', 4, 0.1, 15)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (29, N'Project', 4, 0.3, 16)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (30, N'Final Exam', 4, 0.4, 7)
INSERT [dbo].[Point] ([pid], [pname], [suid], [weight], [cid]) VALUES (31, N'Final Exam Resit', 4, 0.4, 8)
GO
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (1, N'Student')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (2, N'Lecturer')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (3, N'Admin')
GO
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'admin@fpt.edu.vn', 3)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'ducdm@fpt.edu.vn', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'dungltk@fpt.edu.vn', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'hungvd@fpt.edu.vn', 1)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'sonnt@fpt.edu.vn', 2)
GO
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 4)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 5)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 1)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 2)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 6)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (3, 1)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (3, 2)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (3, 3)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (3, 4)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (3, 5)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'BE-112')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'BE-110')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (3, N'DE-222')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (4, N'DE-310')
GO
SET IDENTITY_INSERT [dbo].[Score] ON 

INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (1, 1, 1, 1, 7)
INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (2, 1, 1, 2, 8)
INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (3, 1, 1, 3, 8)
INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (4, 1, 1, 4, 9)
INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (5, 1, 1, 5, 10)
INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (6, 1, 1, 6, 7)
INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (7, 1, 1, 7, 5)
INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (8, 1, 1, 8, 9)
INSERT [dbo].[Score] ([scoreid], [sid], [gid], [pid], [value]) VALUES (10, 1, 1, 9, 8)
SET IDENTITY_INSERT [dbo].[Score] OFF
GO
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (1, N'Võ Đình Hưng', N'S1.jpg', N'HE186864')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (2, N'Nguyễn Tiến Toàn', N'S2.jpg', N'HE161779')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (3, N'Bùi Hoàng Hiệp', N'S3.jpg', N'HE170388')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (4, N'Đỗ Minh Dương', N'S4.jpg', N'HE170406')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (5, N'Chu Bảo Khánh', N'S5.jpg', N'HE171093')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (6, N'Vũ Minh Quân', N'S6.jpg', N'HE171227')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (7, N'Phạm Đức Trung', N'S7.jpg', N'HE171749')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (8, N'Nguyễn Việt Anh', N'S8.jpg', N'HE171958')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (9, N'Trần Việt Duy', N'S9.jpg', N'HE172200')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (10, N'Nguyễn Huy Anh', N'S10.jpg', N'HE172209')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (11, N'Nguyễn Văn Đạt', N'S11.jpg', N'HE172295')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (12, N'Phạm Quốc Duy', N'S12.jpg', N'HE172390')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (13, N'Ngô Hải Yến', N'S13.jpg', N'HE173190	')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (14, N'Lê Minh Thắng', N'S14.jpg', N'HE173199')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (15, N'Tô Tuấn Anh', N'S15.jpg', N'HE173227')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (16, N'Nguyễn Thành Trung', N'S16.jpg', N'HE173337')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (17, N'Nguyễn Minh Tuấn', N'S17.jpg', N'HE173518')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (18, N'Hoàng Trung Kiên', N'S18.jpg', N'HE173590')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (19, N'Cao Văn Quân', N'S19.jpg', N'HE176299')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (20, N'Bùi Bách Tùng', N'S20.jpg', N'HE176368')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (21, N'Hồ Tài Huy', N'S21.jpg', N'HE176394')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (22, N'Đinh Hoàng Việt', N'S22.jpg', N'HE176404')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (23, N'Trương Xuân Quý', N'S23.jpg', N'HE176405')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (24, N'Lê Anh Vũ', N'S24.jpg', N'HE176419')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (25, N'Trần Hồng Phúc', N'S25.jpg', N'HE176709	')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (26, N'Quan Gia Huy', N'S26.jpg', N'HE176809')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (27, N'Nguyễn Tuấn Anh', N'S27.jpg', N'HE181166')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (28, N'Vũ Lê Anh', N'S28.jpg', N'HE181266')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (29, N'Nguyễn Đức Cảnh', N'S29.jpg', N'HE150931')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (30, N'Nguyễn Mạnh Thắng', N'S30.jpg', N'HE187107')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (31, N'Đỗ Như Mạnh', N'S31.jpg', N'HE163519')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (32, N'Hoàng Duy Khánh', N'S32.jpg', N'HE163671')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (33, N'Trần Quân Lực', N'S33.jpg', N'HE170342')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (34, N'Đặng Quốc Vương', N'S34.jpg', N'HE170389')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (35, N'Hoàng Danh Hào', N'S35.jpg', N'HE171439')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (36, N'Nguyễn Thế Anh', N'S36.jpg', N'HE172469')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (37, N'Nguyễn Hoàng Long', N'S37.jpg', N'HE172497')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (38, N'Nguyễn Văn Hùng', N'S38.jpg', N'HE173013')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (39, N'Nguyễn Duy Phúc', N'S39.jpg', N'HE173030')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (40, N'Vũ Trí Dũng', N'S40.jpg', N'HE173074')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (41, N'Nguyễn Huy Đức', N'S41.jpg', N'HE173230')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (42, N'Nguyễn Phú An', N'S42.jpg', N'HE173268')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (43, N'Vũ Hoàng Sơn', N'S43.jpg', N'HE173320')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (44, N'Lê Văn Toàn', N'S44.jpg', N'HE173348')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (45, N'Trần Ngô Hùng Vĩ', N'S45.jpg', N'HE173419')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (46, N'Trần Đình Đức', N'S46.jpg', N'HE176150')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (47, N'Đỗ Đại Lộc', N'S47.jpg', N'HE176242')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (48, N'Đỗ Đức Ngọc', N'S48.jpg', N'HE176562')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (49, N'Nguyễn Trung Kiên', N'S49.jpg', N'HE176725')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (50, N'Lê Công Hiếu', N'S50.jpg', N'HE176738')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (51, N'Nguyễn Xuân Tâm', N'S51.jpg', N'HE176903')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (52, N'Trần Nhật Minh', N'S52.jpg', N'HE180070')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (53, N'Nguyễn Vĩnh Việt Hà', N'S53.jpg', N'HE180111')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (54, N'Nguyễn Minh Hiếu', N'S54.jpg', N'HE181421')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (55, N'Lường Hữu Tuấn', N'S55.jpg', N'HE163470')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (56, N'Nguyễn Quỳnh Chi', N'S56.jpg', N'HE178833')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (57, N'Nguyễn Tất Quân', N'S57.jpg', N'HE182214')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (58, N'Võ Văn Khánh', N'S58.jpg', N'HE184539')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (59, N'Lê Nam Cường', N'S59.jpg', N'HE187462')
INSERT [dbo].[Student] ([sid], [sname], [img], [member]) VALUES (60, N'Nguyễn Xuân Hồng', N'S60.jpg', N'HE187329')
GO
INSERT [dbo].[StudentGroup] ([gid], [gname], [suid], [lid]) VALUES (1, N'SE1818', 1, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [suid], [lid]) VALUES (2, N'SE1818', 2, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [suid], [lid]) VALUES (3, N'SE1836', 1, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [suid], [lid]) VALUES (4, N'SE1705', 5, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [suid], [lid]) VALUES (5, N'SE1856', 5, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [suid], [lid]) VALUES (6, N'SE1915', 6, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [suid], [lid]) VALUES (7, N'SE1818', 4, 4)
INSERT [dbo].[StudentGroup] ([gid], [gname], [suid], [lid]) VALUES (8, N'SE1818', 3, 3)
GO
INSERT [dbo].[Subject] ([suid], [suname], [credit]) VALUES (1, N'PRJ301', 3)
INSERT [dbo].[Subject] ([suid], [suname], [credit]) VALUES (2, N'MAS291', 3)
INSERT [dbo].[Subject] ([suid], [suname], [credit]) VALUES (3, N'JPD123', 3)
INSERT [dbo].[Subject] ([suid], [suname], [credit]) VALUES (4, N'IOT102', 3)
INSERT [dbo].[Subject] ([suid], [suname], [credit]) VALUES (5, N'DBI202', 3)
INSERT [dbo].[Subject] ([suid], [suname], [credit]) VALUES (6, N'PRF192', 3)
GO
INSERT [dbo].[TimeSlot] ([tid], [tname], [tperiod]) VALUES (1, N'Slot 1', N'7:30-9:50')
INSERT [dbo].[TimeSlot] ([tid], [tname], [tperiod]) VALUES (2, N'Slot 2', N'10:00-12:20')
INSERT [dbo].[TimeSlot] ([tid], [tname], [tperiod]) VALUES (3, N'Slot 3', N'12:50-15:10')
INSERT [dbo].[TimeSlot] ([tid], [tname], [tperiod]) VALUES (4, N'Slot 4', N'15:20-17:40')
INSERT [dbo].[TimeSlot] ([tid], [tname], [tperiod]) VALUES (5, N'Slot 5', N'17:50-19:10')
INSERT [dbo].[TimeSlot] ([tid], [tname], [tperiod]) VALUES (6, N'Slot 6', N'19:40-22:00')
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Lesson] FOREIGN KEY([leid])
REFERENCES [dbo].[Lesson] ([leid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Lesson]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_StudentGroup]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lession_Lecturer]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lession_Room]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lession_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lession_StudentGroup]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_TimeSlot]
GO
ALTER TABLE [dbo].[Point]  WITH CHECK ADD  CONSTRAINT [FK_Point_Category] FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Point] CHECK CONSTRAINT [FK_Point_Category]
GO
ALTER TABLE [dbo].[Point]  WITH CHECK ADD  CONSTRAINT [FK_Point_Subject] FOREIGN KEY([suid])
REFERENCES [dbo].[Subject] ([suid])
GO
ALTER TABLE [dbo].[Point] CHECK CONSTRAINT [FK_Point_Subject]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([roleid])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([roleid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Point] FOREIGN KEY([pid])
REFERENCES [dbo].[Point] ([pid])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Point]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Student]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_StudentGroup]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Lecturer]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Subject] FOREIGN KEY([suid])
REFERENCES [dbo].[Subject] ([suid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Subject]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
