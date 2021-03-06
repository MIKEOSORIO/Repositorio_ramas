USE [master]
GO
/****** Object:  Database [dbpasos]    Script Date: 18/10/2021 11:08:08 p. m. ******/
CREATE DATABASE [dbpasos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbpasos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbpasos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbpasos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbpasos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbpasos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbpasos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbpasos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbpasos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbpasos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbpasos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbpasos] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbpasos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbpasos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbpasos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbpasos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbpasos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbpasos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbpasos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbpasos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbpasos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbpasos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbpasos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbpasos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbpasos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbpasos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbpasos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbpasos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbpasos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbpasos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbpasos] SET  MULTI_USER 
GO
ALTER DATABASE [dbpasos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbpasos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbpasos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbpasos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbpasos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbpasos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbpasos] SET QUERY_STORE = OFF
GO
USE [dbpasos]
GO
/****** Object:  Table [dbo].[acceso]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acceso](
	[idacceso] [int] IDENTITY(1,1) NOT NULL,
	[ventana] [varchar](50) NOT NULL,
	[idrol] [int] NOT NULL,
	[idpermisos] [int] NOT NULL,
 CONSTRAINT [PK_acceso] PRIMARY KEY CLUSTERED 
(
	[idacceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[archivos]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[archivos](
	[idarchivos] [int] IDENTITY(1,1) NOT NULL,
	[nombreArchivo] [varchar](50) NOT NULL,
	[ubicacion] [text] NOT NULL,
	[fechaAlta] [date] NOT NULL,
	[descripcion] [text] NULL,
	[iduser] [int] NOT NULL,
 CONSTRAINT [PK_archivos] PRIMARY KEY CLUSTERED 
(
	[idarchivos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[citas]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citas](
	[idcitas] [int] IDENTITY(1,1) NOT NULL,
	[fechaCita] [date] NOT NULL,
	[descripcion] [text] NULL,
	[lugar] [varchar](100) NULL,
	[idempresa] [int] NOT NULL,
	[idestadoCita] [int] NOT NULL,
	[idresponsables] [int] NOT NULL,
 CONSTRAINT [PK_citas] PRIMARY KEY CLUSTERED 
(
	[idcitas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[idclientes] [int] IDENTITY(1,1) NOT NULL,
	[rfc] [varchar](45) NULL,
	[razonSocial] [varchar](45) NULL,
	[domicilio] [text] NULL,
	[telefono] [varchar](10) NULL,
	[fechaAlta] [date] NOT NULL,
	[tipoCliente] [varchar](10) NOT NULL,
	[idestadoCliente] [int] NOT NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[idclientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cotizaciones]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cotizaciones](
	[idcotizaciones] [int] IDENTITY(1,1) NOT NULL,
	[fechaAlta] [date] NOT NULL,
	[descripcion] [text] NOT NULL,
	[monto] [decimal](10, 2) NOT NULL,
	[fechaLimite] [date] NULL,
	[iduser] [int] NOT NULL,
 CONSTRAINT [PK_cotizaciones] PRIMARY KEY CLUSTERED 
(
	[idcotizaciones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentas](
	[idcuentas] [int] IDENTITY(1,1) NOT NULL,
	[cuenta] [varchar](100) NOT NULL,
	[saldo] [decimal](10, 2) NOT NULL,
	[cargo] [decimal](10, 2) NOT NULL,
	[abono] [decimal](10, 2) NOT NULL,
	[idempresa] [int] NOT NULL,
	[idtipoCuenta] [int] NOT NULL,
 CONSTRAINT [PK_cuentas] PRIMARY KEY CLUSTERED 
(
	[idcuentas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cxc]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cxc](
	[idcxc] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](10, 2) NOT NULL,
	[nota] [varchar](45) NOT NULL,
	[fechaAlta] [date] NOT NULL,
	[fechaFinal] [date] NOT NULL,
	[idestado] [int] NOT NULL,
	[idempresa] [int] NOT NULL,
	[idclientes] [int] NOT NULL,
 CONSTRAINT [PK_cxc] PRIMARY KEY CLUSTERED 
(
	[idcxc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresa](
	[idempresa] [int] IDENTITY(1,1) NOT NULL,
	[rfc] [varchar](45) NULL,
	[razonSocial] [varchar](45) NULL,
	[domicilio] [text] NULL,
	[telefono] [varchar](10) NULL,
	[idclientes] [int] NOT NULL,
 CONSTRAINT [PK_empresa] PRIMARY KEY CLUSTERED 
(
	[idempresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[idestado] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](45) NOT NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[idestado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadoCita]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoCita](
	[idestadoCita] [int] IDENTITY(1,1) NOT NULL,
	[estadoCita] [varchar](30) NOT NULL,
 CONSTRAINT [PK_estadoCita] PRIMARY KEY CLUSTERED 
(
	[idestadoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadoCliente]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoCliente](
	[idestadoCliente] [int] IDENTITY(1,1) NOT NULL,
	[estadoCliente] [varchar](30) NOT NULL,
 CONSTRAINT [PK_estadoCliente] PRIMARY KEY CLUSTERED 
(
	[idestadoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimientos]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientos](
	[idmovimientos] [int] IDENTITY(1,1) NOT NULL,
	[monto] [decimal](10, 2) NOT NULL,
	[fecha] [date] NOT NULL,
	[nota] [varchar](45) NOT NULL,
	[descripcion] [text] NULL,
	[idcuentas] [int] NOT NULL,
	[idtipoMovimiento] [int] NOT NULL,
 CONSTRAINT [PK_movimientos] PRIMARY KEY CLUSTERED 
(
	[idmovimientos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permisos]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos](
	[idpermisos] [int] IDENTITY(1,1) NOT NULL,
	[escritura] [int] NOT NULL,
	[lectura] [int] NOT NULL,
	[actualizacion] [int] NOT NULL,
	[eliminacion] [int] NOT NULL,
 CONSTRAINT [PK_permisos] PRIMARY KEY CLUSTERED 
(
	[idpermisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prestamos]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prestamos](
	[idprestamos] [int] IDENTITY(1,1) NOT NULL,
	[montos] [decimal](10, 2) NOT NULL,
	[pagos] [decimal](10, 2) NULL,
	[nota] [varchar](45) NULL,
	[fechaAlta] [date] NOT NULL,
	[fechaPago] [date] NULL,
	[idcliente] [int] NOT NULL,
	[idestado] [int] NOT NULL,
 CONSTRAINT [PK_prestamos] PRIMARY KEY CLUSTERED 
(
	[idprestamos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[responsables]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[responsables](
	[idresponsables] [int] IDENTITY(1,1) NOT NULL,
	[responsables] [text] NOT NULL,
 CONSTRAINT [PK_responsables] PRIMARY KEY CLUSTERED 
(
	[idresponsables] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[idrol] [int] IDENTITY(1,1) NOT NULL,
	[rol] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[idrol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoCuenta]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoCuenta](
	[tipoCuenta] [int] IDENTITY(1,1) NOT NULL,
	[idtipoCuenta] [varchar](45) NOT NULL,
 CONSTRAINT [PK_tipoCuenta] PRIMARY KEY CLUSTERED 
(
	[tipoCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoMovimiento]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoMovimiento](
	[idtipoMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[tipoMovimiento] [varchar](25) NOT NULL,
 CONSTRAINT [PK_tipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[idtipoMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 18/10/2021 11:08:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[iduser] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](16) NOT NULL,
	[email] [varchar](100) NULL,
	[password] [varchar](32) NOT NULL,
	[fechaAlta] [date] NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellidos] [varchar](100) NOT NULL,
	[idrol] [int] NOT NULL,
	[idempresa] [int] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[iduser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[acceso]  WITH CHECK ADD  CONSTRAINT [FK_acceso_permisos] FOREIGN KEY([idpermisos])
REFERENCES [dbo].[permisos] ([idpermisos])
GO
ALTER TABLE [dbo].[acceso] CHECK CONSTRAINT [FK_acceso_permisos]
GO
ALTER TABLE [dbo].[acceso]  WITH CHECK ADD  CONSTRAINT [FK_acceso_rol] FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
ALTER TABLE [dbo].[acceso] CHECK CONSTRAINT [FK_acceso_rol]
GO
ALTER TABLE [dbo].[archivos]  WITH CHECK ADD  CONSTRAINT [FK_archivos_user] FOREIGN KEY([iduser])
REFERENCES [dbo].[user] ([iduser])
GO
ALTER TABLE [dbo].[archivos] CHECK CONSTRAINT [FK_archivos_user]
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD  CONSTRAINT [FK_citas_empresa] FOREIGN KEY([idempresa])
REFERENCES [dbo].[empresa] ([idempresa])
GO
ALTER TABLE [dbo].[citas] CHECK CONSTRAINT [FK_citas_empresa]
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD  CONSTRAINT [FK_citas_estadoCita] FOREIGN KEY([idestadoCita])
REFERENCES [dbo].[estadoCita] ([idestadoCita])
GO
ALTER TABLE [dbo].[citas] CHECK CONSTRAINT [FK_citas_estadoCita]
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD  CONSTRAINT [FK_citas_responsables] FOREIGN KEY([idresponsables])
REFERENCES [dbo].[responsables] ([idresponsables])
GO
ALTER TABLE [dbo].[citas] CHECK CONSTRAINT [FK_citas_responsables]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [FK_clientes_estadoCliente] FOREIGN KEY([idestadoCliente])
REFERENCES [dbo].[estadoCliente] ([idestadoCliente])
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [FK_clientes_estadoCliente]
GO
ALTER TABLE [dbo].[cotizaciones]  WITH CHECK ADD  CONSTRAINT [FK_cotizaciones_user] FOREIGN KEY([iduser])
REFERENCES [dbo].[user] ([iduser])
GO
ALTER TABLE [dbo].[cotizaciones] CHECK CONSTRAINT [FK_cotizaciones_user]
GO
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuentas_empresa] FOREIGN KEY([idempresa])
REFERENCES [dbo].[empresa] ([idempresa])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuentas_empresa]
GO
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuentas_tipoCuenta] FOREIGN KEY([idtipoCuenta])
REFERENCES [dbo].[tipoCuenta] ([tipoCuenta])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuentas_tipoCuenta]
GO
ALTER TABLE [dbo].[cxc]  WITH CHECK ADD  CONSTRAINT [FK_cxc_clientes] FOREIGN KEY([idclientes])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[cxc] CHECK CONSTRAINT [FK_cxc_clientes]
GO
ALTER TABLE [dbo].[cxc]  WITH CHECK ADD  CONSTRAINT [FK_cxc_empresa] FOREIGN KEY([idempresa])
REFERENCES [dbo].[empresa] ([idempresa])
GO
ALTER TABLE [dbo].[cxc] CHECK CONSTRAINT [FK_cxc_empresa]
GO
ALTER TABLE [dbo].[cxc]  WITH CHECK ADD  CONSTRAINT [FK_cxc_estado] FOREIGN KEY([idestado])
REFERENCES [dbo].[estado] ([idestado])
GO
ALTER TABLE [dbo].[cxc] CHECK CONSTRAINT [FK_cxc_estado]
GO
ALTER TABLE [dbo].[empresa]  WITH CHECK ADD  CONSTRAINT [FK_empresa_clientes] FOREIGN KEY([idclientes])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[empresa] CHECK CONSTRAINT [FK_empresa_clientes]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_cuentas] FOREIGN KEY([idcuentas])
REFERENCES [dbo].[cuentas] ([idcuentas])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_cuentas]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_tipoMovimiento] FOREIGN KEY([idtipoMovimiento])
REFERENCES [dbo].[tipoMovimiento] ([idtipoMovimiento])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_tipoMovimiento]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_prestamos_clientes] FOREIGN KEY([idcliente])
REFERENCES [dbo].[clientes] ([idclientes])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_prestamos_clientes]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_prestamos_estado] FOREIGN KEY([idestado])
REFERENCES [dbo].[estado] ([idestado])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_prestamos_estado]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_empresa] FOREIGN KEY([idempresa])
REFERENCES [dbo].[empresa] ([idempresa])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_empresa]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_rol] FOREIGN KEY([idrol])
REFERENCES [dbo].[rol] ([idrol])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_rol]
GO
USE [master]
GO
ALTER DATABASE [dbpasos] SET  READ_WRITE 
GO
