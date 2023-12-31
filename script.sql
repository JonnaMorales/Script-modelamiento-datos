USE [master]
GO
/****** Object:  Database [Modelamiento de datos ]    Script Date: 02/10/2023 17:30:02 ******/
CREATE DATABASE [Modelamiento de datos ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Modelamiento de datos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Modelamiento de datos .mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Modelamiento de datos _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Modelamiento de datos _log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Modelamiento de datos ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Modelamiento de datos ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Modelamiento de datos ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Modelamiento de datos ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Modelamiento de datos ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Modelamiento de datos ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Modelamiento de datos ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET RECOVERY FULL 
GO
ALTER DATABASE [Modelamiento de datos ] SET  MULTI_USER 
GO
ALTER DATABASE [Modelamiento de datos ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Modelamiento de datos ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Modelamiento de datos ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Modelamiento de datos ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Modelamiento de datos ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Modelamiento de datos ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Modelamiento de datos ', N'ON'
GO
ALTER DATABASE [Modelamiento de datos ] SET QUERY_STORE = OFF
GO
USE [Modelamiento de datos ]
GO
/****** Object:  Table [dbo].[Afiliacion]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Afiliacion](
	[ID] [int] NOT NULL,
	[PersonaID] [int] NULL,
	[CajaCompensacionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CajaCompensacion]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CajaCompensacion](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Direccion] [varchar](255) NULL,
	[Telefono] [varchar](20) NULL,
	[CorreoElectronico] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credito]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credito](
	[ID] [int] NOT NULL,
	[TipoCredito] [varchar](100) NULL,
	[Monto] [decimal](18, 0) NULL,
	[TasaInteres] [decimal](18, 0) NULL,
	[FechaSolicitud] [date] NULL,
	[Estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuota]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuota](
	[ID] [int] NOT NULL,
	[CreditoID] [int] NULL,
	[PersonaID] [int] NULL,
	[Monto] [decimal](18, 0) NULL,
	[FechaPago] [date] NULL,
	[EstadoCuota] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[ID] [int] NOT NULL,
	[CreditoID] [int] NULL,
	[TipoDocumento] [varchar](50) NULL,
	[EstadoDocumento] [varchar](50) NULL,
	[DetallesDocumento] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[ID_Empresa] [int] NULL,
	[Rut_Empresa] [varchar](15) NULL,
	[Nombre_Empresa] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Apellido] [varchar](255) NULL,
	[Tipo] [varchar](50) NULL,
	[NivelIngresos] [decimal](18, 0) NULL,
	[NivelEndeudamiento] [decimal](18, 0) NULL,
	[DireccionParticular] [varchar](255) NULL,
	[DireccionLaboral] [varchar](255) NULL,
	[CorreoElectronico] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotor]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotor](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](255) NULL,
	[SucursalChile] [varchar](255) NULL,
	[Comision] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SucursalChile]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SucursalChile](
	[ID] [int] NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Direccion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 02/10/2023 17:30:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajador](
	[ID_Trabajador] [int] NULL,
	[Rut_Trabajador] [varchar](15) NULL,
	[Nombre_Trabajador] [varchar](500) NULL,
	[Edad_Trabajador] [int] NULL,
	[Sexo_Trabajador] [varchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Afiliacion]  WITH CHECK ADD FOREIGN KEY([CajaCompensacionID])
REFERENCES [dbo].[CajaCompensacion] ([ID])
GO
ALTER TABLE [dbo].[Afiliacion]  WITH CHECK ADD FOREIGN KEY([PersonaID])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Afiliacion]  WITH CHECK ADD  CONSTRAINT [FK_Afiliacion_CajaCompensacion] FOREIGN KEY([CajaCompensacionID])
REFERENCES [dbo].[CajaCompensacion] ([ID])
GO
ALTER TABLE [dbo].[Afiliacion] CHECK CONSTRAINT [FK_Afiliacion_CajaCompensacion]
GO
ALTER TABLE [dbo].[Afiliacion]  WITH CHECK ADD  CONSTRAINT [FK_Afiliacion_Persona] FOREIGN KEY([PersonaID])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Afiliacion] CHECK CONSTRAINT [FK_Afiliacion_Persona]
GO
ALTER TABLE [dbo].[Cuota]  WITH CHECK ADD FOREIGN KEY([CreditoID])
REFERENCES [dbo].[Credito] ([ID])
GO
ALTER TABLE [dbo].[Cuota]  WITH CHECK ADD FOREIGN KEY([PersonaID])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Cuota]  WITH CHECK ADD  CONSTRAINT [FK_Cuota_Credito] FOREIGN KEY([CreditoID])
REFERENCES [dbo].[Credito] ([ID])
GO
ALTER TABLE [dbo].[Cuota] CHECK CONSTRAINT [FK_Cuota_Credito]
GO
ALTER TABLE [dbo].[Cuota]  WITH CHECK ADD  CONSTRAINT [FK_Cuota_Persona] FOREIGN KEY([PersonaID])
REFERENCES [dbo].[Persona] ([ID])
GO
ALTER TABLE [dbo].[Cuota] CHECK CONSTRAINT [FK_Cuota_Persona]
GO
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD FOREIGN KEY([CreditoID])
REFERENCES [dbo].[Credito] ([ID])
GO
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_Documento_Credito] FOREIGN KEY([CreditoID])
REFERENCES [dbo].[Credito] ([ID])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_Documento_Credito]
GO
USE [master]
GO
ALTER DATABASE [Modelamiento de datos ] SET  READ_WRITE 
GO
