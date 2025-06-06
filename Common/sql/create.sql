USE [master]
GO
/****** Object:  Database [CaiNiaoStationDBase]    Script Date: 2024/11/9 22:00:33 ******/
CREATE DATABASE [CaiNiaoStationDBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaiNiaoStationDBase', FILENAME = N'D:\IT\developenv\SQLServer\CaiNiaoStationDBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CaiNiaoStationDBase_log', FILENAME = N'D:\IT\developenv\SQLServer\CaiNiaoStationDBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CaiNiaoStationDBase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CaiNiaoStationDBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CaiNiaoStationDBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET RECOVERY FULL 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET  MULTI_USER 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CaiNiaoStationDBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CaiNiaoStationDBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CaiNiaoStationDBase', N'ON'
GO
ALTER DATABASE [CaiNiaoStationDBase] SET QUERY_STORE = ON
GO
ALTER DATABASE [CaiNiaoStationDBase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CaiNiaoStationDBase]
GO
/****** Object:  Table [dbo].[StationInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StationInfos](
	[StationId] [int] IDENTITY(101,1) NOT NULL,
	[StationNo] [varchar](10) NOT NULL,
	[StationName] [nvarchar](50) NOT NULL,
	[StationPYNo] [varchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Manager] [nvarchar](20) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[IsRunning] [bit] NOT NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_StationInfos] PRIMARY KEY CLUSTERED 
(
	[StationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpTypeInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpTypeInfos](
	[EmpTypeId] [int] IDENTITY(1,1) NOT NULL,
	[EmpTypeName] [nvarchar](20) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_EmpTypeInfos] PRIMARY KEY CLUSTERED 
(
	[EmpTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeInfos](
	[EmpId] [int] IDENTITY(1001,1) NOT NULL,
	[EmpNo] [varchar](10) NOT NULL,
	[EmpName] [nvarchar](20) NOT NULL,
	[EmpPYNo] [varchar](20) NOT NULL,
	[Sex] [nvarchar](1) NOT NULL,
	[Age] [int] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[StationId] [int] NOT NULL,
	[EmpTypeId] [int] NOT NULL,
	[IsOn] [bit] NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeInfos] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_EmployeeInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_EmployeeInfos]
AS
SELECT   dbo.EmployeeInfos.EmpId, dbo.EmployeeInfos.EmpNo, dbo.EmployeeInfos.EmpName, dbo.EmployeeInfos.EmpPYNo, 
                dbo.EmployeeInfos.Sex, dbo.EmployeeInfos.Age, dbo.EmployeeInfos.Phone, dbo.EmployeeInfos.StationId, 
                dbo.EmployeeInfos.EmpTypeId, dbo.EmployeeInfos.IsOn, dbo.EmployeeInfos.Remark, dbo.EmployeeInfos.IsDeleted, 
                dbo.EmpTypeInfos.EmpTypeName, dbo.StationInfos.StationName
FROM      dbo.EmployeeInfos INNER JOIN
                dbo.EmpTypeInfos ON dbo.EmployeeInfos.EmpTypeId = dbo.EmpTypeInfos.EmpTypeId INNER JOIN
                dbo.StationInfos ON dbo.EmployeeInfos.StationId = dbo.StationInfos.StationId
GO
/****** Object:  Table [dbo].[ShelfInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShelfInfos](
	[ShelfId] [int] IDENTITY(1,1) NOT NULL,
	[ShelfNo] [varchar](10) NOT NULL,
	[ShelfName] [nvarchar](20) NOT NULL,
	[StationId] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_ShelfInfos] PRIMARY KEY CLUSTERED 
(
	[ShelfId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpressInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpressInfos](
	[ExpId] [int] IDENTITY(1,1) NOT NULL,
	[ExpNumber] [varchar](20) NOT NULL,
	[StationId] [int] NOT NULL,
	[ShelfId] [int] NULL,
	[Sender] [nvarchar](20) NOT NULL,
	[SenderAddress] [nvarchar](100) NOT NULL,
	[SenderPhone] [varchar](20) NOT NULL,
	[Receiver] [nvarchar](20) NOT NULL,
	[ReceiveAddress] [nvarchar](100) NOT NULL,
	[ReceiverPhone] [varchar](20) NOT NULL,
	[ExpRemark] [nvarchar](100) NULL,
	[ExpState] [nvarchar](10) NOT NULL,
	[ExpType] [nvarchar](50) NOT NULL,
	[EnterPerson] [nvarchar](20) NOT NULL,
	[EnterTime] [datetime] NOT NULL,
	[PickWay] [nvarchar](10) NOT NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_ExpressInfos] PRIMARY KEY CLUSTERED 
(
	[ExpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_ExpressInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_ExpressInfos]
AS
SELECT   dbo.ExpressInfos.ExpId, dbo.ExpressInfos.ExpNumber, dbo.ExpressInfos.StationId, dbo.ExpressInfos.ShelfId, 
                dbo.ExpressInfos.Sender, dbo.ExpressInfos.SenderAddress, dbo.ExpressInfos.SenderPhone, 
                dbo.ExpressInfos.Receiver, dbo.ExpressInfos.ReceiveAddress, dbo.ExpressInfos.ReceiverPhone, 
                dbo.ExpressInfos.ExpRemark, dbo.ExpressInfos.ExpState, dbo.ExpressInfos.ExpType, dbo.ExpressInfos.EnterPerson, 
                dbo.ExpressInfos.EnterTime, dbo.ExpressInfos.PickWay, dbo.ExpressInfos.IsDeleted, dbo.StationInfos.StationName, 
                dbo.ShelfInfos.ShelfName
FROM      dbo.ExpressInfos INNER JOIN
                dbo.StationInfos ON dbo.ExpressInfos.StationId = dbo.StationInfos.StationId INNER JOIN
                dbo.ShelfInfos ON dbo.ExpressInfos.ShelfId = dbo.ShelfInfos.ShelfId
GO
/****** Object:  Table [dbo].[ExpDistributeInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpDistributeInfos](
	[DistributedId] [int] IDENTITY(1,1) NOT NULL,
	[ExpId] [int] NOT NULL,
	[EmpId] [int] NOT NULL,
	[IsSignFor] [bit] NOT NULL,
	[SignTime] [datetime] NULL,
	[DistributeTime] [datetime] NOT NULL,
	[InsertTime] [datetime] NOT NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_ExpDistributeInfos] PRIMARY KEY CLUSTERED 
(
	[DistributedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_DistributeExpressInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DistributeExpressInfos]
AS
SELECT   dbo.ExpressInfos.ExpId, dbo.ExpressInfos.ExpNumber, dbo.ExpressInfos.StationId, dbo.StationInfos.StationName, 
                dbo.ExpressInfos.ShelfId, dbo.ShelfInfos.ShelfName, dbo.ExpressInfos.Receiver, dbo.ExpressInfos.ReceiveAddress, 
                dbo.ExpressInfos.ReceiverPhone, dbo.ExpressInfos.ExpRemark, dbo.ExpressInfos.ExpState, 
                dbo.ExpDistributeInfos.EmpId, dbo.EmployeeInfos.EmpName, dbo.ExpDistributeInfos.IsSignFor, 
                dbo.ExpDistributeInfos.SignTime, dbo.ExpDistributeInfos.DistributeTime, dbo.EmployeeInfos.Phone, 
                dbo.ExpressInfos.IsDeleted
FROM      dbo.ExpressInfos LEFT OUTER JOIN
                dbo.ShelfInfos ON dbo.ExpressInfos.ShelfId = dbo.ShelfInfos.ShelfId INNER JOIN
                dbo.StationInfos ON dbo.ExpressInfos.StationId = dbo.StationInfos.StationId LEFT OUTER JOIN
                dbo.ExpDistributeInfos ON dbo.ExpressInfos.ExpId = dbo.ExpDistributeInfos.ExpId LEFT OUTER JOIN
                dbo.EmployeeInfos ON dbo.ExpDistributeInfos.EmpId = dbo.EmployeeInfos.EmpId
WHERE   (dbo.ExpressInfos.PickWay = '派送')
GO
/****** Object:  Table [dbo].[ExpSelfPickInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpSelfPickInfos](
	[PickUpId] [int] IDENTITY(1,1) NOT NULL,
	[ExpId] [int] NOT NULL,
	[PickingCode] [varchar](20) NOT NULL,
	[IsPickUp] [bit] NOT NULL,
	[PickingTime] [datetime] NULL,
	[InsertTime] [datetime] NOT NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_ExpSelfPickInfos] PRIMARY KEY CLUSTERED 
(
	[PickUpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_SelfPickUpExpressInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_SelfPickUpExpressInfos]
AS
SELECT   dbo.ExpressInfos.ExpId, dbo.ExpressInfos.ExpNumber, dbo.ExpressInfos.StationId, dbo.StationInfos.StationName, 
                dbo.ExpressInfos.ShelfId, dbo.ShelfInfos.ShelfName, dbo.ExpressInfos.Receiver, dbo.ExpressInfos.ReceiveAddress, 
                dbo.ExpressInfos.ReceiverPhone, dbo.ExpressInfos.ExpRemark, dbo.ExpressInfos.ExpState, 
                dbo.ExpSelfPickInfos.PickingCode, dbo.ExpSelfPickInfos.IsPickUp, dbo.ExpSelfPickInfos.PickingTime, 
                dbo.ExpressInfos.IsDeleted
FROM      dbo.ExpressInfos INNER JOIN
                dbo.StationInfos ON dbo.ExpressInfos.StationId = dbo.StationInfos.StationId INNER JOIN
                dbo.ShelfInfos ON dbo.ExpressInfos.ShelfId = dbo.ShelfInfos.ShelfId INNER JOIN
                dbo.ExpSelfPickInfos ON dbo.ExpressInfos.ExpId = dbo.ExpSelfPickInfos.ExpId
GO
/****** Object:  UserDefinedFunction [dbo].[StatisticsExpCompletion]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 统计已完成数与未完成数
create function [dbo].[StatisticsExpCompletion](@stationId int=0)
returns table
as
return
(
	select CompletedCount=(select count(1) from ExpressInfos where ExpState='已签收' and ((@stationId>0 and
	StationId=@stationId) or @stationId=0)),
	UnCompletedCount=(select count(1) from ExpressInfos where ExpState<>'已签收' and ((@stationId>0 and
	StationId=@stationId) or @stationId=0))
)
GO
/****** Object:  Table [dbo].[ExpressTypeInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpressTypeInfos](
	[ExpTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ExpTypeName] [nvarchar](20) NOT NULL,
	[ExpTypePYNo] [varchar](20) NOT NULL,
	[ParentId] [int] NOT NULL,
	[OrderNum] [int] NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_ExpressTypeInfos] PRIMARY KEY CLUSTERED 
(
	[ExpTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_ExpressTypeInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[View_ExpressTypeInfos]
as
select t1.ExpTypeId,t1.ExpTypeName,t1.ExpTypePYNo,t1.ParentId,t2.ExpTypeName
 ParentName,t1.OrderNum,t1.Remark,t1.IsDeleted
 from ExpressTypeInfos t1 left join ExpressTypeInfos t2
 on t1.ParentId = t2.ExpTypeId
GO
/****** Object:  Table [dbo].[MenuInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuInfos](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](20) NOT NULL,
	[ParentId] [int] NOT NULL,
	[MKey] [varchar](20) NULL,
	[FrmURL] [varchar](100) NULL,
	[MOrder] [int] NOT NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_MenuInfos] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfos]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfos](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[UserPwd] [varchar](20) NOT NULL,
	[UserState] [bit] NOT NULL,
	[IsDeleted] [int] NOT NULL,
 CONSTRAINT [PK_UserInfos] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployeeInfos] ADD  CONSTRAINT [DF_EmployeeInfos_Sex]  DEFAULT (N'男') FOR [Sex]
GO
ALTER TABLE [dbo].[EmployeeInfos] ADD  CONSTRAINT [DF_EmployeeInfos_IsOn]  DEFAULT ((0)) FOR [IsOn]
GO
ALTER TABLE [dbo].[EmployeeInfos] ADD  CONSTRAINT [DF_EmployeeInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[EmpTypeInfos] ADD  CONSTRAINT [DF_EmpTypeInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ExpDistributeInfos] ADD  CONSTRAINT [DF_ExpDistributeInfos_IsSignFor]  DEFAULT ((0)) FOR [IsSignFor]
GO
ALTER TABLE [dbo].[ExpDistributeInfos] ADD  CONSTRAINT [DF_ExpDistributeInfos_InsertTime]  DEFAULT (getdate()) FOR [InsertTime]
GO
ALTER TABLE [dbo].[ExpDistributeInfos] ADD  CONSTRAINT [DF_ExpDistributeInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ExpressInfos] ADD  CONSTRAINT [DF_ExpressInfos_ExpState]  DEFAULT (N'已入库') FOR [ExpState]
GO
ALTER TABLE [dbo].[ExpressInfos] ADD  CONSTRAINT [DF_ExpressInfos_EnterTime]  DEFAULT (getdate()) FOR [EnterTime]
GO
ALTER TABLE [dbo].[ExpressInfos] ADD  CONSTRAINT [DF_ExpressInfos_PickWay]  DEFAULT (N'派送') FOR [PickWay]
GO
ALTER TABLE [dbo].[ExpressInfos] ADD  CONSTRAINT [DF_ExpressInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ExpressTypeInfos] ADD  CONSTRAINT [DF_ExpressTypeInfos_OrderNum]  DEFAULT ((1)) FOR [OrderNum]
GO
ALTER TABLE [dbo].[ExpressTypeInfos] ADD  CONSTRAINT [DF_ExpressTypeInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ExpSelfPickInfos] ADD  CONSTRAINT [DF_ExpSelfPickInfos_IsPickUp]  DEFAULT ((0)) FOR [IsPickUp]
GO
ALTER TABLE [dbo].[ExpSelfPickInfos] ADD  CONSTRAINT [DF_ExpSelfPickInfos_InsertTime]  DEFAULT (getdate()) FOR [InsertTime]
GO
ALTER TABLE [dbo].[ExpSelfPickInfos] ADD  CONSTRAINT [DF_ExpSelfPickInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MenuInfos] ADD  CONSTRAINT [DF_MenuInfos_MOrder]  DEFAULT ((1)) FOR [MOrder]
GO
ALTER TABLE [dbo].[MenuInfos] ADD  CONSTRAINT [DF_MenuInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ShelfInfos] ADD  CONSTRAINT [DF_ShelfInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StationInfos] ADD  CONSTRAINT [DF_StationInfos_IsRunning]  DEFAULT ((0)) FOR [IsRunning]
GO
ALTER TABLE [dbo].[StationInfos] ADD  CONSTRAINT [DF_StationInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserInfos] ADD  CONSTRAINT [DF_UserInfos_UserState]  DEFAULT ((1)) FOR [UserState]
GO
ALTER TABLE [dbo].[UserInfos] ADD  CONSTRAINT [DF_UserInfos_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[GetExpressListByState]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetExpressListByState]
(
	@isCompleted int,
	@stationId int
)
as
begin
	if @isCompleted=1
	begin
		select ExpId,ExpNumber,ExpRemark,StationName,PickWay,ExpState from View_ExpressInfos
		where ExpState='已签收' and ((@stationId>0 and StationId=@stationId) or @stationId=0)
	end
	else
	begin
		select ExpId,ExpNumber,ExpRemark,StationName,PickWay,ExpState from View_ExpressInfos
		where ExpState<>'已签收' and ((@stationId>0 and StationId=@stationId) or @stationId=0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[StatisticsEmpExpressData]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StatisticsEmpExpressData]
(
	@year int
)
as
begin
	-- 总派送量
	select count(1) TotalCount from ExpressInfos where PickWay='派送' and isDeleted=0
	-- 已完成量
	select count(1) HasDisCount from ExpressInfos where PickWay='派送' and ExpState='已签收' and isDeleted=0
	-- 未完成量
	select count(1) UnDisCount from ExpressInfos where PickWay='派送' and ExpState='派送中' and isDeleted=0
	-- 员工的派送信息：员工编号 快递编号 是否签收 员工名称
	select emp.EmpId,EmpName,ExpId,IsSignFor from ExpDistributeInfos dis
	inner join EmployeeInfos emp on dis.EmpId=emp.EmpId
	where datepart(year,InsertTime)=@year
end
GO
/****** Object:  StoredProcedure [dbo].[StatisticsExpCountByDay]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StatisticsExpCountByDay]
(
	@year int,
	@month int
)
as
begin
	select InsertDate,ExpState,count(1) ExpCount from
	(
		select left(convert(varchar,EnterTime,120),10) InsertDate,ExpId,(case when ExpState='已签收' then 
		'已完成' when ExpState<>'已签收' then '未完成' end) ExpState from ExpressInfos
		where datepart(year,EnterTime)=@year and datepart(month,EnterTime)=@month and isDeleted=0
	) as ExpInfos
	group by InsertDate,ExpState
end
GO
/****** Object:  StoredProcedure [dbo].[StatisticsExpCountByMonth]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StatisticsExpCountByMonth]
(
	@year int
)
as
begin
	select MonthNumber,ExpState,count(1) ExpCount from
	(
		select datepart(month,EnterTime)MonthNumber,ExpId,(case when ExpState='已签收' then 
		'已完成' when ExpState<>'已签收' then '未完成' end) ExpState from ExpressInfos
		where datepart(year,EnterTime)=@year and isDeleted=0
	) as ExpInfos
	group by MonthNumber,ExpState
end

exec StatisticsExpCountByMonth 2024
GO
/****** Object:  StoredProcedure [dbo].[StatisticsExpCountByWeek]    Script Date: 2024/11/9 22:00:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StatisticsExpCountByWeek]
(
	@year int
)
as
begin
	select WeekNumber,ExpState,count(1) ExpCount from
	(
		select datepart(week,EnterTime)WeekNumber,ExpId,(case when ExpState='已签收' then 
		'已完成' when ExpState<>'已签收' then '未完成' end) ExpState from ExpressInfos
		where datepart(year,EnterTime)=@year and isDeleted=0
	) as ExpInfos
	group by WeekNumber,ExpState
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExpDistributeInfos', @level2type=N'COLUMN',@level2name=N'SignTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ExpressInfos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 314
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShelfInfos"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 146
               Right = 409
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "StationInfos"
            Begin Extent = 
               Top = 73
               Left = 448
               Bottom = 213
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ExpDistributeInfos"
            Begin Extent = 
               Top = 144
               Left = 709
               Bottom = 284
               Right = 882
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "EmployeeInfos"
            Begin Extent = 
               Top = 2
               Left = 1028
               Bottom = 142
               Right = 1183
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Be' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DistributeExpressInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'gin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DistributeExpressInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DistributeExpressInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "EmployeeInfos"
            Begin Extent = 
               Top = 50
               Left = 46
               Bottom = 190
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "EmpTypeInfos"
            Begin Extent = 
               Top = 180
               Left = 442
               Bottom = 320
               Right = 620
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StationInfos"
            Begin Extent = 
               Top = 6
               Left = 447
               Bottom = 146
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_EmployeeInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_EmployeeInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ExpressInfos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 146
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "StationInfos"
            Begin Extent = 
               Top = 4
               Left = 261
               Bottom = 144
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShelfInfos"
            Begin Extent = 
               Top = 158
               Left = 272
               Bottom = 298
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpressInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ExpressInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ExpressInfos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 298
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "StationInfos"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 269
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ShelfInfos"
            Begin Extent = 
               Top = 6
               Left = 459
               Bottom = 200
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ExpSelfPickInfos"
            Begin Extent = 
               Top = 6
               Left = 649
               Bottom = 200
               Right = 810
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SelfPickUpExpressInfos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_SelfPickUpExpressInfos'
GO
USE [master]
GO
ALTER DATABASE [CaiNiaoStationDBase] SET  READ_WRITE 
GO
