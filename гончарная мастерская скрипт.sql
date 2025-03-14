USE [master]
GO
/****** Object:  Database [pottery]    Script Date: 13.06.2024 19:28:53 ******/
CREATE DATABASE [pottery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pottery', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pottery.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pottery_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\pottery_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [pottery] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pottery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pottery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pottery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pottery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pottery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pottery] SET ARITHABORT OFF 
GO
ALTER DATABASE [pottery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pottery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pottery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pottery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pottery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pottery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pottery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pottery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pottery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pottery] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pottery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pottery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pottery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pottery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pottery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pottery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pottery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pottery] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pottery] SET  MULTI_USER 
GO
ALTER DATABASE [pottery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pottery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pottery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pottery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pottery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pottery] SET QUERY_STORE = OFF
GO
USE [pottery]
GO
/****** Object:  Table [dbo].[color_table]    Script Date: 13.06.2024 19:28:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color_table](
	[color_name] [nvarchar](50) NOT NULL,
	[id_color] [int] NOT NULL,
 CONSTRAINT [PK_color_table] PRIMARY KEY CLUSTERED 
(
	[id_color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_group_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_group_table](
	[id_course_group] [int] IDENTITY(1,1) NOT NULL,
	[id_name_group] [int] NOT NULL,
	[counte_person] [int] NOT NULL,
	[first_date] [date] NULL,
	[last_date] [date] NULL,
	[curator_id] [int] NOT NULL,
 CONSTRAINT [PK_course_group_table] PRIMARY KEY CLUSTERED 
(
	[id_course_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dolzhnost_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dolzhnost_table](
	[dolzhnost_name] [nvarchar](50) NOT NULL,
	[id_dolzhnost] [int] NOT NULL,
 CONSTRAINT [PK_dolzhnost_table] PRIMARY KEY CLUSTERED 
(
	[id_dolzhnost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[info_course_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[info_course_table](
	[id_course] [int] NOT NULL,
	[name_course] [nvarchar](max) NOT NULL,
	[number_hours] [int] NOT NULL,
	[price] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_info_course_table] PRIMARY KEY CLUSTERED 
(
	[id_course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kategory_product_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategory_product_table](
	[id_kategory] [int] NOT NULL,
	[name_kategory] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_kategory_product_table] PRIMARY KEY CLUSTERED 
(
	[id_kategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[klient_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klient_table](
	[id_klient] [int] IDENTITY(1,1) NOT NULL,
	[name_klient] [nvarchar](50) NOT NULL,
	[surname_klient] [nvarchar](50) NOT NULL,
	[phone_number_klient] [nvarchar](50) NOT NULL,
	[e_mail_klient] [nvarchar](50) NULL,
 CONSTRAINT [PK_klient_table] PRIMARY KEY CLUSTERED 
(
	[id_klient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material_category_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_category_table](
	[material_category_name] [nvarchar](50) NOT NULL,
	[id_category] [int] NOT NULL,
 CONSTRAINT [PK_material_category_table] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material_table](
	[id_material] [int] NOT NULL,
	[name_material] [nvarchar](50) NOT NULL,
	[color_id] [int] NULL,
	[proizvoditel_id] [int] NULL,
	[count_package] [int] NOT NULL,
	[weight_kg] [float] NOT NULL,
	[srok_godnosti] [date] NULL,
	[barcode] [int] NOT NULL,
	[ogneypornost_id] [int] NULL,
	[material_category_id] [int] NOT NULL,
	[postavshik_id] [int] NOT NULL,
 CONSTRAINT [PK_material_table] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogneypornost_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogneypornost_table](
	[ogneypornost_name] [nvarchar](50) NOT NULL,
	[max_temperatura_C] [int] NOT NULL,
	[id_ogneypornost] [int] NOT NULL,
 CONSTRAINT [PK_ogneypornost_table] PRIMARY KEY CLUSTERED 
(
	[id_ogneypornost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[postavshiki_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[postavshiki_table](
	[id_postavshika] [int] NOT NULL,
	[name_postavshik] [nvarchar](50) NOT NULL,
	[index_postavshik] [nvarchar](50) NULL,
	[surname_director] [nvarchar](50) NOT NULL,
	[name_director] [nvarchar](50) NOT NULL,
	[phone_number_postavshik] [nvarchar](50) NOT NULL,
	[e_mail_postavshik] [nvarchar](50) NULL,
	[inn] [nvarchar](50) NOT NULL,
	[kpp] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_postavshiki_table] PRIMARY KEY CLUSTERED 
(
	[id_postavshika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_table](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[articul] [int] NOT NULL,
	[name_product] [nvarchar](max) NOT NULL,
	[category_product] [int] NOT NULL,
	[price] [int] NOT NULL,
	[material_id] [int] NULL,
	[color_id] [int] NOT NULL,
	[master_id] [int] NOT NULL,
	[lenght] [float] NULL,
	[width] [float] NULL,
	[height] [float] NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_product_table] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proizvoditeli_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proizvoditeli_table](
	[name_proizvoditel] [nvarchar](50) NULL,
	[id_proizvoditel] [int] NOT NULL,
 CONSTRAINT [PK_proizvoditeli_table] PRIMARY KEY CLUSTERED 
(
	[id_proizvoditel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration_table](
	[id_registration] [int] IDENTITY(1,1) NOT NULL,
	[klient] [int] NOT NULL,
	[course] [int] NOT NULL,
 CONSTRAINT [PK_registration_table] PRIMARY KEY CLUSTERED 
(
	[id_registration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workers_table]    Script Date: 13.06.2024 19:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workers_table](
	[id_workers] [int] NOT NULL,
	[surname_workers] [nvarchar](50) NOT NULL,
	[name_workers] [nvarchar](50) NOT NULL,
	[otchestvo_workers] [nvarchar](50) NULL,
	[dolznost_id] [int] NOT NULL,
	[phone_number_workers] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NULL,
	[street] [nvarchar](50) NULL,
	[house] [nvarchar](50) NULL,
	[kvartira] [nvarchar](50) NULL,
	[date_rozhdeniya] [date] NOT NULL,
	[date_priema_na_raboty] [date] NOT NULL,
	[oklad_no_nds] [int] NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_workers_table] PRIMARY KEY CLUSTERED 
(
	[id_workers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Бежевый ', 1)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Белый', 2)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Глубокий розовый', 3)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Голубой', 4)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Жёлтый', 5)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Зелёный', 6)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Золотой', 7)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Индиго', 8)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Коричнево-малиновый', 9)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Красный', 10)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Лайм', 11)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Лиловый', 12)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Оливковый', 13)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Оранжевый', 14)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Прозрачный', 15)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Пурпурный', 16)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Розовый', 17)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Серебристый', 18)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Серебряный', 19)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Серый', 20)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Синий', 21)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Фиолетовый', 22)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Фуксия, Маджента', 23)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Цвет морской волны', 24)
INSERT [dbo].[color_table] ([color_name], [id_color]) VALUES (N'Черный', 25)
SET IDENTITY_INSERT [dbo].[course_group_table] ON 

INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (1, 2, 1, CAST(N'2020-03-01' AS Date), CAST(N'2020-04-07' AS Date), 2)
INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (2, 1, 1, CAST(N'2020-03-01' AS Date), CAST(N'2020-03-17' AS Date), 2)
INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (3, 2, 1, CAST(N'2020-03-05' AS Date), CAST(N'2020-04-14' AS Date), 3)
INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (4, 6, 6, CAST(N'2020-03-08' AS Date), CAST(N'2020-03-10' AS Date), 4)
INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (5, 4, 10, CAST(N'2020-03-08' AS Date), CAST(N'2020-03-10' AS Date), 4)
INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (6, 3, 1, CAST(N'2020-03-06' AS Date), CAST(N'2020-04-12' AS Date), 2)
INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (7, 2, 1, CAST(N'2020-03-07' AS Date), CAST(N'2020-04-13' AS Date), 2)
INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (8, 2, 1, CAST(N'2020-03-08' AS Date), CAST(N'2020-04-14' AS Date), 3)
INSERT [dbo].[course_group_table] ([id_course_group], [id_name_group], [counte_person], [first_date], [last_date], [curator_id]) VALUES (9, 2, 1, CAST(N'2020-03-09' AS Date), CAST(N'2020-04-15' AS Date), 3)
SET IDENTITY_INSERT [dbo].[course_group_table] OFF
INSERT [dbo].[dolzhnost_table] ([dolzhnost_name], [id_dolzhnost]) VALUES (N'дирекор', 1)
INSERT [dbo].[dolzhnost_table] ([dolzhnost_name], [id_dolzhnost]) VALUES (N'администраор', 2)
INSERT [dbo].[dolzhnost_table] ([dolzhnost_name], [id_dolzhnost]) VALUES (N'мастер гончарного круга', 3)
INSERT [dbo].[dolzhnost_table] ([dolzhnost_name], [id_dolzhnost]) VALUES (N'мастер ручной лепки', 4)
INSERT [dbo].[info_course_table] ([id_course], [name_course], [number_hours], [price]) VALUES (1, N'курс "НАЧИНАЮЩИЙ"', 16, N'18000')
INSERT [dbo].[info_course_table] ([id_course], [name_course], [number_hours], [price]) VALUES (2, N'курс "МАСТЕР"', 24, N'30000')
INSERT [dbo].[info_course_table] ([id_course], [name_course], [number_hours], [price]) VALUES (3, N'курс "ПРОФИ"', 36, N'45000')
INSERT [dbo].[info_course_table] ([id_course], [name_course], [number_hours], [price]) VALUES (4, N'мастер-класс "НАЧАЛО"', 3, N'2000')
INSERT [dbo].[info_course_table] ([id_course], [name_course], [number_hours], [price]) VALUES (5, N'миникурс набор из 6 предметов ', 12, N'10000')
INSERT [dbo].[info_course_table] ([id_course], [name_course], [number_hours], [price]) VALUES (6, N'мастер-класс "ПРОДВИНУТЫЙ"', 8, N'5000')
INSERT [dbo].[info_course_table] ([id_course], [name_course], [number_hours], [price]) VALUES (7, N'мастер-класс по лепке на гончарном круге "ГОНЧАР"', 3, N'3000')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (1, N'ваза')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (2, N'другое - кухонное')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (3, N'другое - предмет интерьера')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (4, N'значок')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (5, N'кашпо')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (6, N'кружка')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (7, N'мыльница')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (8, N'посвечник')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (9, N'стакан')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (10, N'статуэтка')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (11, N'столовые приборы')
INSERT [dbo].[kategory_product_table] ([id_kategory], [name_kategory]) VALUES (12, N'тарелка кухонная')
SET IDENTITY_INSERT [dbo].[klient_table] ON 

INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (1, N'Варвара', N'Жукова', N'79664246019', N'hayet-idiyi44@yahoo.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (2, N'Милана', N'Полякова', N'79415443483', N'nixi_yuwubo36@yahoo.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (3, N'Арсений', N'Журавлев', N'79382968423', N'wofos_ixugu61@aol.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (4, N'Василиса', N'Прохорова', N'79860703135', N'buri-fajuca33@outlook.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (5, N'Фёдор', N'Романов', N'79537165818', N'hanuke-lera11@mail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (6, N'Виктория', N'Боброва', N'79395179895', N'bulu_riyoyi18@hotmail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (7, N'Лев', N'Баженов', N'79286909164', N'geyilat-oki24@aol.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (8, N'Диана', N'Емельянова', N'79814231801', N'vobi-ximite43@aol.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (9, N'Эмир', N'Миронов', N'79953666475', N'forekex_ebu20@yahoo.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (10, N'Милана', N'Иванова', N'79380768359', N'tasefum_ozu72@gmail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (11, N'Алина', N'Зайцева', N'79780627624', N'pepodi-gawa47@aol.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (12, N'Никита', N'Макаров', N'79360633774', N'now_usiwina67@gmail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (13, N'Ксения', N'Миронова', N'79586715915', N'mejozec-ozo8@mail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (14, N'Фёдор', N'Покровский', N'79239420651', N'woh-ahidusu15@aol.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (15, N'Вера', N'Зимина', N'79370946541', N'mozob_ixute52@yahoo.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (16, N'Андрей', N'Захаров', N'79890714583', N'feno_xijiyo15@gmail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (17, N'Иван', N'Шубин', N'79063057082', N'roseca_doho68@mail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (18, N'Андрей', N'Нестеров', N'79657153946', N'kanod-amuti34@gmail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (19, N'Мелания', N'Нечаева', N'79956843693', N'bolevi_tike77@gmail.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (20, N'Александр', N'Гаврилов', N'79547751556', N'mepum_ekegu70@yahoo.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (21, N'Милана', N'Никитина', N'79934218974', N'podevow-exe82@aol.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (22, N'Артур', N'Майоров', N'79386233327', N'vez_ofikube27@outlook.com')
INSERT [dbo].[klient_table] ([id_klient], [name_klient], [surname_klient], [phone_number_klient], [e_mail_klient]) VALUES (23, N'Сергей', N'Жаров', N'79214878177', N'dipebig_ike91@yahoo.com')
SET IDENTITY_INSERT [dbo].[klient_table] OFF
INSERT [dbo].[material_category_table] ([material_category_name], [id_category]) VALUES (N'глина', 1)
INSERT [dbo].[material_category_table] ([material_category_name], [id_category]) VALUES (N'краска', 2)
INSERT [dbo].[material_category_table] ([material_category_name], [id_category]) VALUES (N'глазурь', 3)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (1, N'красная глина', 10, 5, 4, 20, NULL, 985347, 1, 1, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (2, N'белая глина', 2, 6, 4, 20, NULL, 878538, 2, 1, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (3, N'глазурь прозрачная', 15, 1, 10, 0.3, CAST(N'2025-02-01' AS Date), 406434, 2, 2, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (4, N'цветная глазурь', 1, 1, 10, 0.3, CAST(N'2025-02-01' AS Date), 432854, 3, 2, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (5, N'глазурь прозрачная', 15, 1, 25, 0.3, CAST(N'2024-08-01' AS Date), 357673, 3, 2, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (6, N'краска', 1, 3, 7, 1, NULL, 241351, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (7, N'краска', 2, 3, 14, 1, NULL, 167073, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (8, N'краска', 3, 3, 13, 1, NULL, 467907, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (9, N'краска', 4, 4, 18, 1, NULL, 346874, 2, 3, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (10, N'краска', 5, 4, 10, 1, NULL, 356576, 2, 3, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (11, N'краска', 6, 4, 11, 1, NULL, 436575, 2, 3, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (12, N'краска', 10, 4, 22, 1, NULL, 537536, 2, 3, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (13, N'краска', 11, 4, 24, 1, NULL, 647334, 2, 3, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (14, N'краска', 12, 4, 9, 1, NULL, 462655, 2, 3, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (15, N'краска', 13, 3, 15, 1, NULL, 376542, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (16, N'краска', 14, 3, 19, 1, NULL, 463664, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (17, N'краска', 16, 3, 8, 1, NULL, 263254, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (18, N'краска', 17, 3, 12, 1, NULL, 547365, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (19, N'краска', 20, 3, 9, 1, NULL, 573457, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (20, N'краска', 21, 3, 6, 1, NULL, 547452, 2, 3, 1)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (21, N'глина из песчаника', 22, 5, 21, 10, NULL, 346456, 3, 1, 3)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (22, N'глина для фарфора', 23, 1, 20, 10, NULL, 537553, 3, 1, 3)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (23, N'глазурь прозрачная', 15, 1, 22, 0.3, CAST(N'2024-04-01' AS Date), 379879, 2, 2, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (24, N'цветная глазурь', 2, 2, 15, 0.3, CAST(N'2024-12-01' AS Date), 547867, 2, 2, 2)
INSERT [dbo].[material_table] ([id_material], [name_material], [color_id], [proizvoditel_id], [count_package], [weight_kg], [srok_godnosti], [barcode], [ogneypornost_id], [material_category_id], [postavshik_id]) VALUES (25, N'краска', 25, 4, 18, 1, NULL, 325235, 2, 3, 2)
INSERT [dbo].[ogneypornost_table] ([ogneypornost_name], [max_temperatura_C], [id_ogneypornost]) VALUES (N'легкоплавкие', 1350, 1)
INSERT [dbo].[ogneypornost_table] ([ogneypornost_name], [max_temperatura_C], [id_ogneypornost]) VALUES (N'тугоплавкие', 1580, 2)
INSERT [dbo].[ogneypornost_table] ([ogneypornost_name], [max_temperatura_C], [id_ogneypornost]) VALUES (N'огнеупорные', 1830, 3)
INSERT [dbo].[postavshiki_table] ([id_postavshika], [name_postavshik], [index_postavshik], [surname_director], [name_director], [phone_number_postavshik], [e_mail_postavshik], [inn], [kpp]) VALUES (1, N'Аврора-Канц', N'672748', N'Румянцев', N'Михаил', N'79362729173', N'avrora_canch@mail.ru', N'284924820182', N'347587642')
INSERT [dbo].[postavshiki_table] ([id_postavshika], [name_postavshik], [index_postavshik], [surname_director], [name_director], [phone_number_postavshik], [e_mail_postavshik], [inn], [kpp]) VALUES (2, N'Керамистам', N'982472', N'Денисова', N'Татьяна', N'79268722282', N'keramistam-shop@inbox.ru', N'283946182738', N'972685309')
INSERT [dbo].[postavshiki_table] ([id_postavshika], [name_postavshik], [index_postavshik], [surname_director], [name_director], [phone_number_postavshik], [e_mail_postavshik], [inn], [kpp]) VALUES (3, N'Глина гжели', N'472849', N'Нестеров', N'Артемий', N'79264832343', N'shop-clay-ru.@yandex.ru', N'192816720394', N'752804216')
SET IDENTITY_INSERT [dbo].[product_table] ON 

INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (1, 3510, N'подставка для яиц', 2, 1500, 1, 1, 3, 20, 7, 4, N'IMG_5880.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (2, 3511, N'гранат', 4, 400, 1, 10, 4, 4, 4, 1, N'IMG_5881.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (3, 3512, N'мыльница ', 7, 700, 1, 14, 3, 7, 8, 2, N'IMG_5909.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (4, 3513, N'подсвечник', 8, 600, 1, 22, 2, 7, 8, 5, N'IMG_5891.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (5, 3514, N'тарелка суповая', 12, 1800, 1, 1, 3, 14, 14, 4, N'IMG_5892.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (6, 3515, N'ваза для сухоцветов ', 1, 900, 2, 4, 4, 9, 9, 9, N'IMG_5893.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (7, 3516, N'кружка кофейная', 6, 900, 1, 4, 2, 8, 8, 11, N'IMG_5894.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (8, 3517, N'подставка под украшения', 3, 600, 2, 9, 3, 10, 7, 2, N'IMG_5896.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (9, 3518, N'подставка под горячее', 2, 400, 2, 25, 4, 10, 10, 2, N'IMG_5897.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (10, 3519, N'кораблик', 4, 350, 2, 21, 4, 4, 4, 1, N'IMG_5898.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (11, 3520, N'подсвечник', 8, 700, 2, 20, 3, 4, 4, 7, N'IMG_5899.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (12, 3522, N'птица', 4, 300, 1, 20, 2, 4, 4, 1, N'IMG_5900.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (13, 3523, N'утка', 10, 800, 1, 2, 2, 13, 7, 8, N'IMG_5901.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (14, 3524, N'ложка чайная', 11, 300, 1, 5, 2, 10, 3, 2, N'IMG_5902.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (15, 3525, N'кружка кофейная', 6, 1000, 1, 17, 4, 9, 9, 13, N'IMG_5895.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (16, 3527, N'тарелка суповая', 12, 1800, 2, 17, 4, 14, 14, 6, N'IMG_5903.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (17, 3528, N'подставка под благовония', 3, 600, 2, 17, 2, 1, 1, 5, N'IMG_5904.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (18, 3530, N'сердце', 4, 400, 2, 10, 2, 3, 3, 1, N'IMG_5905.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (19, 3531, N'мыльница в виде утки', 7, 800, 1, 2, 3, 9, 7, 7, N'IMG_5883.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (20, 3532, N'ваза для цветов цилиндр', 1, 2500, 1, 1, 4, 14, 14, 17, N'IMG_5906.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (21, 3537, N'тарелка суповая', 12, 2000, 1, 12, 3, 14, 14, 5, N'IMG_5907.JPG')
INSERT [dbo].[product_table] ([id_product], [articul], [name_product], [category_product], [price], [material_id], [color_id], [master_id], [lenght], [width], [height], [photo]) VALUES (22, 3539, N'тарелка суповая', 12, 2000, 1, 11, 2, 10, 10, 10, N'IMG_5908.JPG')
SET IDENTITY_INSERT [dbo].[product_table] OFF
INSERT [dbo].[proizvoditeli_table] ([name_proizvoditel], [id_proizvoditel]) VALUES (N'ГАММА', 1)
INSERT [dbo].[proizvoditeli_table] ([name_proizvoditel], [id_proizvoditel]) VALUES (N'Ломоносовская Керамика', 2)
INSERT [dbo].[proizvoditeli_table] ([name_proizvoditel], [id_proizvoditel]) VALUES (N'Витраж', 3)
INSERT [dbo].[proizvoditeli_table] ([name_proizvoditel], [id_proizvoditel]) VALUES (N'НЕВСКАЯ ПАЛИТРА', 4)
INSERT [dbo].[proizvoditeli_table] ([name_proizvoditel], [id_proizvoditel]) VALUES (N'ЛУЧ', 5)
INSERT [dbo].[proizvoditeli_table] ([name_proizvoditel], [id_proizvoditel]) VALUES (N'ЮНЛАНДИЯ', 6)
SET IDENTITY_INSERT [dbo].[registration_table] ON 

INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (1, 1, 1)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (2, 2, 2)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (3, 3, 3)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (4, 4, 6)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (5, 5, 7)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (6, 6, 8)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (7, 7, 9)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (8, 8, 4)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (9, 9, 4)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (10, 10, 4)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (11, 11, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (12, 12, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (13, 13, 4)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (14, 14, 4)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (15, 15, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (16, 16, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (17, 17, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (18, 18, 4)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (19, 19, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (20, 20, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (21, 21, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (22, 22, 5)
INSERT [dbo].[registration_table] ([id_registration], [klient], [course]) VALUES (23, 23, 5)
SET IDENTITY_INSERT [dbo].[registration_table] OFF
INSERT [dbo].[workers_table] ([id_workers], [surname_workers], [name_workers], [otchestvo_workers], [dolznost_id], [phone_number_workers], [city], [street], [house], [kvartira], [date_rozhdeniya], [date_priema_na_raboty], [oklad_no_nds], [login], [password]) VALUES (1, N'Мельникова', N'Ксения', N'Витальевна', 1, N'71082044484', N'Казань', N'Авангардная ', N'14', N'68', CAST(N'1995-04-13' AS Date), CAST(N'2020-02-22' AS Date), 100000, N'user1', N'user1')
INSERT [dbo].[workers_table] ([id_workers], [surname_workers], [name_workers], [otchestvo_workers], [dolznost_id], [phone_number_workers], [city], [street], [house], [kvartira], [date_rozhdeniya], [date_priema_na_raboty], [oklad_no_nds], [login], [password]) VALUES (2, N'Иванова', N'София', N'Ивановна', 3, N'72785115822', N'Казань', N'Академика Завойского', N'27', N'53', CAST(N'1998-02-14' AS Date), CAST(N'2020-02-23' AS Date), 45000, NULL, NULL)
INSERT [dbo].[workers_table] ([id_workers], [surname_workers], [name_workers], [otchestvo_workers], [dolznost_id], [phone_number_workers], [city], [street], [house], [kvartira], [date_rozhdeniya], [date_priema_na_raboty], [oklad_no_nds], [login], [password]) VALUES (3, N'Буракшаева', N'Юлия', N'Сергеевна', 3, N'76229030019', N'Казань', N'Рихарда Зорге', N'17', N'87', CAST(N'2001-04-25' AS Date), CAST(N'2020-02-23' AS Date), 45000, NULL, NULL)
INSERT [dbo].[workers_table] ([id_workers], [surname_workers], [name_workers], [otchestvo_workers], [dolznost_id], [phone_number_workers], [city], [street], [house], [kvartira], [date_rozhdeniya], [date_priema_na_raboty], [oklad_no_nds], [login], [password]) VALUES (4, N'Богословский', N'Артем', N'Михайлович', 4, N'72381699456', N'Казань', N'Тинчурина', N'11', N'64', CAST(N'2000-08-31' AS Date), CAST(N'2020-02-24' AS Date), 50000, NULL, NULL)
INSERT [dbo].[workers_table] ([id_workers], [surname_workers], [name_workers], [otchestvo_workers], [dolznost_id], [phone_number_workers], [city], [street], [house], [kvartira], [date_rozhdeniya], [date_priema_na_raboty], [oklad_no_nds], [login], [password]) VALUES (5, N'Пименов', N'Максим', N'Евгеньевич', 2, N'76244041264', N'Казань', N'Татарстан', N'10', N'84', CAST(N'2002-01-27' AS Date), CAST(N'2020-02-24' AS Date), 60000, N'user2', N'user2')
INSERT [dbo].[workers_table] ([id_workers], [surname_workers], [name_workers], [otchestvo_workers], [dolznost_id], [phone_number_workers], [city], [street], [house], [kvartira], [date_rozhdeniya], [date_priema_na_raboty], [oklad_no_nds], [login], [password]) VALUES (6, N'Безуглова', N'Анастасия', N'Александровна', 2, N'77586335599', N'Казань', N'Березовая', N'4', N'61', CAST(N'1997-03-01' AS Date), CAST(N'2020-03-31' AS Date), 60000, N'user3', N'user3')
ALTER TABLE [dbo].[course_group_table]  WITH CHECK ADD  CONSTRAINT [FK_course_group_table_info_course_table] FOREIGN KEY([id_name_group])
REFERENCES [dbo].[info_course_table] ([id_course])
GO
ALTER TABLE [dbo].[course_group_table] CHECK CONSTRAINT [FK_course_group_table_info_course_table]
GO
ALTER TABLE [dbo].[course_group_table]  WITH CHECK ADD  CONSTRAINT [FK_course_group_table_workers_table] FOREIGN KEY([curator_id])
REFERENCES [dbo].[workers_table] ([id_workers])
GO
ALTER TABLE [dbo].[course_group_table] CHECK CONSTRAINT [FK_course_group_table_workers_table]
GO
ALTER TABLE [dbo].[material_table]  WITH CHECK ADD  CONSTRAINT [FK_material_table_color_table] FOREIGN KEY([color_id])
REFERENCES [dbo].[color_table] ([id_color])
GO
ALTER TABLE [dbo].[material_table] CHECK CONSTRAINT [FK_material_table_color_table]
GO
ALTER TABLE [dbo].[material_table]  WITH CHECK ADD  CONSTRAINT [FK_material_table_material_category_table] FOREIGN KEY([material_category_id])
REFERENCES [dbo].[material_category_table] ([id_category])
GO
ALTER TABLE [dbo].[material_table] CHECK CONSTRAINT [FK_material_table_material_category_table]
GO
ALTER TABLE [dbo].[material_table]  WITH CHECK ADD  CONSTRAINT [FK_material_table_ogneypornost_table] FOREIGN KEY([ogneypornost_id])
REFERENCES [dbo].[ogneypornost_table] ([id_ogneypornost])
GO
ALTER TABLE [dbo].[material_table] CHECK CONSTRAINT [FK_material_table_ogneypornost_table]
GO
ALTER TABLE [dbo].[material_table]  WITH CHECK ADD  CONSTRAINT [FK_material_table_postavshiki_table] FOREIGN KEY([postavshik_id])
REFERENCES [dbo].[postavshiki_table] ([id_postavshika])
GO
ALTER TABLE [dbo].[material_table] CHECK CONSTRAINT [FK_material_table_postavshiki_table]
GO
ALTER TABLE [dbo].[material_table]  WITH CHECK ADD  CONSTRAINT [FK_material_table_proizvoditeli_table] FOREIGN KEY([proizvoditel_id])
REFERENCES [dbo].[proizvoditeli_table] ([id_proizvoditel])
GO
ALTER TABLE [dbo].[material_table] CHECK CONSTRAINT [FK_material_table_proizvoditeli_table]
GO
ALTER TABLE [dbo].[product_table]  WITH CHECK ADD  CONSTRAINT [FK_product_table_color_table] FOREIGN KEY([color_id])
REFERENCES [dbo].[color_table] ([id_color])
GO
ALTER TABLE [dbo].[product_table] CHECK CONSTRAINT [FK_product_table_color_table]
GO
ALTER TABLE [dbo].[product_table]  WITH CHECK ADD  CONSTRAINT [FK_product_table_kategory_product_table] FOREIGN KEY([category_product])
REFERENCES [dbo].[kategory_product_table] ([id_kategory])
GO
ALTER TABLE [dbo].[product_table] CHECK CONSTRAINT [FK_product_table_kategory_product_table]
GO
ALTER TABLE [dbo].[product_table]  WITH CHECK ADD  CONSTRAINT [FK_product_table_material_table] FOREIGN KEY([material_id])
REFERENCES [dbo].[material_table] ([id_material])
GO
ALTER TABLE [dbo].[product_table] CHECK CONSTRAINT [FK_product_table_material_table]
GO
ALTER TABLE [dbo].[product_table]  WITH CHECK ADD  CONSTRAINT [FK_product_table_workers_table] FOREIGN KEY([master_id])
REFERENCES [dbo].[workers_table] ([id_workers])
GO
ALTER TABLE [dbo].[product_table] CHECK CONSTRAINT [FK_product_table_workers_table]
GO
ALTER TABLE [dbo].[registration_table]  WITH CHECK ADD  CONSTRAINT [FK_registration_table_course_group_table] FOREIGN KEY([course])
REFERENCES [dbo].[course_group_table] ([id_course_group])
GO
ALTER TABLE [dbo].[registration_table] CHECK CONSTRAINT [FK_registration_table_course_group_table]
GO
ALTER TABLE [dbo].[registration_table]  WITH CHECK ADD  CONSTRAINT [FK_registration_table_klient_table] FOREIGN KEY([klient])
REFERENCES [dbo].[klient_table] ([id_klient])
GO
ALTER TABLE [dbo].[registration_table] CHECK CONSTRAINT [FK_registration_table_klient_table]
GO
ALTER TABLE [dbo].[workers_table]  WITH CHECK ADD  CONSTRAINT [FK_workers_table_dolzhnost_table] FOREIGN KEY([dolznost_id])
REFERENCES [dbo].[dolzhnost_table] ([id_dolzhnost])
GO
ALTER TABLE [dbo].[workers_table] CHECK CONSTRAINT [FK_workers_table_dolzhnost_table]
GO
USE [master]
GO
ALTER DATABASE [pottery] SET  READ_WRITE 
GO
