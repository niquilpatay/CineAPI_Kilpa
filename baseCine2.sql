USE [cineNov6_Nuevo]
GO
/****** Object:  User [nachuchi]    Script Date: 15/11/22 23:53:56 ******/
CREATE USER [nachuchi] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[proximoTicket]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[proximoTicket]
(@param int)
returns int
as
begin
declare @prox1 int
set @prox1 = (select max(id_ticket)+1 from Tickets);
return @prox1
end;
GO
/****** Object:  Table [dbo].[Butacas]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Butacas](
	[id_butaca] [int] IDENTITY(1,1) NOT NULL,
	[id_sala] [int] NULL,
 CONSTRAINT [pk_asiento] PRIMARY KEY CLUSTERED 
(
	[id_butaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[dni_cliente] [varchar](8) NULL,
	[email] [varchar](100) NULL,
	[calle] [varchar](50) NULL,
	[altura] [int] NULL,
	[telefono] [bigint] NULL,
	[nom_cliente] [varchar](100) NULL,
	[ape_cliente] [varchar](100) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Tickets]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Tickets](
	[id_detalle_ticket] [int] IDENTITY(1,1) NOT NULL,
	[descuento] [decimal](18, 0) NULL,
	[id_ticket] [int] NULL,
	[costo] [money] NULL,
	[id_butaca] [int] NULL,
	[id_funcion] [int] NULL,
 CONSTRAINT [pk_Detalle_Tickets] PRIMARY KEY CLUSTERED 
(
	[id_detalle_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funciones]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funciones](
	[id_funcion] [int] IDENTITY(1,1) NOT NULL,
	[id_pelicula] [int] NULL,
	[fecha_hora] [datetime] NULL,
	[pre_unitario] [money] NULL,
	[id_sala] [int] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [pk_funciones] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[contras] [varchar](50) NULL,
 CONSTRAINT [pk_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[id_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](500) NULL,
	[duracion] [int] NULL,
	[id_tipo] [int] NULL,
 CONSTRAINT [pk_peliculas] PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salas]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salas](
	[id_sala] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_sala] [int] NULL,
 CONSTRAINT [pk_salas] PRIMARY KEY CLUSTERED 
(
	[id_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[id_ticket] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_pago] [int] NULL,
	[id_cliente] [int] NULL,
	[fecha_compra] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [pk_Tickets] PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_peliculas]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_peliculas](
	[id_tipo] [int] IDENTITY(1,1) NOT NULL,
	[genero] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_peliculas] PRIMARY KEY CLUSTERED 
(
	[id_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_pagos]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_pagos](
	[id_tipo_pago] [int] IDENTITY(1,1) NOT NULL,
	[nombre_tipo_pago] [varchar](50) NULL,
 CONSTRAINT [pk_id_tipo_pago] PRIMARY KEY CLUSTERED 
(
	[id_tipo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipos_Salas]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Salas](
	[id_tipo_sala] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](20) NULL,
 CONSTRAINT [pk_tipo_sala] PRIMARY KEY CLUSTERED 
(
	[id_tipo_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Butacas] ON 

INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (1, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (2, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (3, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (4, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (5, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (6, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (7, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (8, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (9, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (10, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (11, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (12, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (13, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (14, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (15, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (16, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (17, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (18, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (19, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (20, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (21, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (22, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (23, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (24, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (25, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (26, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (27, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (28, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (29, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (30, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (31, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (32, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (33, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (34, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (35, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (36, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (37, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (38, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (39, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (40, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (41, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (42, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (43, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (44, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (45, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (46, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (47, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (48, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (49, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (50, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (51, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (52, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (53, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (54, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (55, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (56, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (57, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (58, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (59, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (60, 3)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (61, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (62, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (63, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (64, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (65, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (66, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (67, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (68, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (69, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (70, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (71, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (72, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (73, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (74, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (75, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (76, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (77, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (78, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (79, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (80, 4)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (81, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (82, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (83, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (84, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (85, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (86, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (87, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (88, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (89, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (90, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (91, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (92, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (93, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (94, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (95, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (96, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (97, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (98, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (99, 5)
GO
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (100, 5)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (101, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (102, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (103, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (104, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (105, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (106, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (107, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (108, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (109, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (110, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (111, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (112, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (113, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (114, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (115, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (116, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (117, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (118, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (119, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (120, 6)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (121, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (122, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (123, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (124, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (125, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (126, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (127, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (128, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (129, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (130, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (131, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (132, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (133, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (134, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (135, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (136, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (137, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (138, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (139, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (140, 7)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (141, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (142, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (143, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (144, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (145, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (146, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (147, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (148, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (149, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (150, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (151, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (152, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (153, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (154, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (155, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (156, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (157, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (158, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (159, 8)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala]) VALUES (160, 8)
SET IDENTITY_INSERT [dbo].[Butacas] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (1, N'28960045', N'euismod@google.ca', N'8272 Ullamcorper Rd.', 2842, 3536309358, N'Timon', N'Mercado', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (2, N'39553922', N'eu.elit@google.ca', N'8751 Et Ave', 590, 3525926877, N'Jessamine', N'Gibson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (3, N'42575832', N'ligula.donec@yahoo.ca', N'P.O. Box 576, 8737 Nisl. Rd.', 2957, 3518131960, N'Nash', N'Harvey', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (4, N'36492626', N'tempor.erat.neque@icloud.ca', N'Ap #920-4045 Eget, St.', 1375, 3516816475, N'Ali', N'Christensen', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (5, N'44945116', N'risus@protonmail.org', N'Ap #191-4050 Ac Rd.', 2515, 3533053432, N'Walter', N'Carey', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (6, N'23674857', N'consequat.lectus.sit@icloud.net', N'748-9200 Turpis Street', 3908, 3531851580, N'Dieter', N'Dillard', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (7, N'41537872', N'magna.tellus@google.edu', N'1696 Neque. St.', 264, 3525119944, N'Kirsten', N'Kaufman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (8, N'25182123', N'aliquam.eros.turpis@outlook.ca', N'Ap #486-6421 Malesuada St.', 1178, 3536735684, N'Ulric', N'Mooney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (9, N'38153241', N'ultrices@google.net', N'P.O. Box 979, 6726 Adipiscing St.', 1881, 3527088792, N'Alvin', N'Nguyen', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (10, N'29067548', N'mauris@aol.edu', N'P.O. Box 602, 5963 Aliquam St.', 1396, 3525140739, N'Melyssa', N'Beard', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (11, N'43169023', N'eget.dictum@icloud.org', N'Ap #150-8415 Nulla St.', 1790, 3517270089, N'Isabella', N'Durham', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (12, N'29928412', N'montes.nascetur.ridiculus@icloud.couk', N'274-2185 Adipiscing, Rd.', 1407, 3531950758, N'Dominique', N'Walton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (13, N'44475752', N'eu.metus@outlook.edu', N'744-9540 Risus. Avenue', 1246, 3538731044, N'Derek', N'Yates', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (14, N'42369484', N'gravida@protonmail.org', N'Ap #465-7531 Commodo Rd.', 2526, 3515968547, N'Melyssa', N'Becker', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (15, N'29248226', N'senectus@outlook.edu', N'427-599 Scelerisque Avenue', 2202, 3531375846, N'Ainsley', N'Cline', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (16, N'30822608', N'maecenas@aol.edu', N'P.O. Box 714, 2236 Adipiscing St.', 2327, 3532621297, N'Ali', N'Cunningham', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (17, N'31620284', N'lorem.lorem.luctus@google.org', N'1092 Est Road', 3006, 3538867410, N'Pearl', N'Pace', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (18, N'44151112', N'et.arcu@aol.edu', N'P.O. Box 966, 2269 In Avenue', 2082, 3528262626, N'Xandra', N'Gill', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (19, N'31829568', N'orci.sem@protonmail.com', N'518-8143 Adipiscing Rd.', 738, 3538993261, N'Adena', N'Singleton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (20, N'35492580', N'aliquam.tincidunt.nunc@protonmail.com', N'Ap #569-4019 Aenean Ave', 3981, 3534861091, N'Simone', N'Barton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (21, N'41338104', N'eu.tellus@yahoo.ca', N'Ap #321-6431 Facilisis. Rd.', 3242, 3533490322, N'Maxine', N'Vasquez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (22, N'27095691', N'et.euismod@aol.ca', N'167-8062 Etiam Rd.', 2190, 3535938146, N'Kiona', N'Frank', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (23, N'30545650', N'vulputate.risus.a@aol.com', N'546-3973 Tortor Av.', 572, 3530633895, N'Quon', N'Mcneil', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (24, N'31942270', N'ut.sagittis.lobortis@icloud.com', N'Ap #959-6054 Molestie Av.', 2930, 3535913833, N'Quinlan', N'Woods', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (25, N'37191594', N'ipsum.porta@hotmail.com', N'Ap #357-1985 Tellus St.', 1475, 3533332553, N'Allistair', N'Snyder', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (26, N'29900677', N'aliquet.vel@hotmail.ca', N'P.O. Box 209, 3895 Neque Rd.', 1996, 3524981436, N'Ryan', N'Mendez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (27, N'38544356', N'viverra.maecenas@icloud.org', N'822-4816 Velit Avenue', 1088, 3528361035, N'Maya', N'Tran', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (28, N'24879515', N'lorem@hotmail.edu', N'P.O. Box 282, 2740 Lorem, Road', 1948, 3539417389, N'Honorato', N'Walton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (29, N'25236543', N'quis.accumsan.convallis@icloud.couk', N'8823 Nullam Road', 3279, 3519152771, N'Burke', N'Golden', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (30, N'41322952', N'ante@aol.couk', N'Ap #783-108 Cursus, Avenue', 2749, 3527015152, N'Sophia', N'Weeks', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (31, N'42041028', N'tincidunt.nibh@yahoo.ca', N'P.O. Box 187, 1960 Tortor. Street', 163, 3522914908, N'Quinlan', N'George', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (32, N'36100171', N'tincidunt.nibh@protonmail.ca', N'9629 Nunc Road', 762, 3533302810, N'Hilel', N'Hobbs', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (33, N'34374760', N'feugiat@hotmail.net', N'399-2821 Orci. Road', 2607, 3534511696, N'Barry', N'Blake', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (34, N'44046260', N'enim.sit@icloud.com', N'Ap #321-1294 Mauris Avenue', 2100, 3528574019, N'Phyllis', N'Merrill', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (35, N'30587434', N'luctus.et.ultrices@outlook.com', N'775-3176 Lobortis Rd.', 1311, 3531210209, N'Britanni', N'Small', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (36, N'40847607', N'quisque.purus@yahoo.ca', N'268-843 Neque. Rd.', 2299, 3518974445, N'Shay', N'Newton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (37, N'41358161', N'mauris.magna@protonmail.net', N'Ap #622-944 Interdum. St.', 1999, 3519747208, N'Shelby', N'Wilcox', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (38, N'35209487', N'ante.lectus@google.edu', N'P.O. Box 227, 3755 Rhoncus. Rd.', 3883, 3533310674, N'Hilel', N'Ingram', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (39, N'42886964', N'lorem.ipsum@hotmail.net', N'P.O. Box 465, 5971 Vehicula. Avenue', 2914, 3523220288, N'Noelani', N'Patton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (40, N'30335245', N'eu.arcu@aol.couk', N'8036 Dui, Rd.', 517, 3527370232, N'Nell', N'Bean', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (41, N'25358239', N'nec@icloud.edu', N'Ap #176-8327 Nulla Road', 689, 3526840135, N'Ray', N'Burks', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (42, N'31180868', N'eu.neque.pellentesque@icloud.org', N'Ap #376-5650 Adipiscing. St.', 690, 3538607317, N'Nelle', N'Walker', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (43, N'27653790', N'vel@google.ca', N'177-627 Eget, Road', 982, 3531062916, N'Reed', N'Hyde', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (44, N'24406023', N'eros@protonmail.edu', N'652-9075 Interdum. Road', 1554, 3516434625, N'Mallory', N'Potts', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (45, N'31076573', N'orci.donec.nibh@protonmail.net', N'Ap #648-4250 Est St.', 190, 3517209372, N'Irma', N'Walton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (46, N'36220511', N'gravida.sit.amet@icloud.couk', N'Ap #230-4833 Tristique Road', 2900, 3518970343, N'Olivia', N'Deleon', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (47, N'40030218', N'velit@aol.org', N'Ap #505-4211 Nunc Ave', 3564, 3538565395, N'Lee', N'Noel', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (48, N'33960350', N'in@protonmail.org', N'P.O. Box 231, 9866 Metus Avenue', 2809, 3522933028, N'Jana', N'Bates', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (49, N'32930309', N'mauris.sagittis@aol.org', N'746-412 Orci, Rd.', 3597, 3529838612, N'Logan', N'Howell', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (50, N'43299224', N'duis.dignissim@icloud.couk', N'3774 Accumsan Rd.', 1488, 3530682345, N'Justin', N'Hicks', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (51, N'25037758', N'ridiculus@google.com', N'Ap #530-4947 Fusce Avenue', 697, 3536853002, N'Daphne', N'Mendoza', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (52, N'44730771', N'dui@google.org', N'P.O. Box 961, 2355 Turpis Rd.', 2494, 3535761041, N'Zoe', N'Merritt', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (53, N'27797007', N'cum.sociis@hotmail.net', N'P.O. Box 627, 2883 Dui. Street', 271, 3530131210, N'Paki', N'Stephens', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (54, N'23422784', N'placerat.orci@hotmail.ca', N'Ap #192-2497 Risus, St.', 768, 3518217793, N'Ila', N'Carr', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (55, N'27179456', N'montes.nascetur@icloud.ca', N'647-7933 Sed Ave', 2426, 3526313113, N'Samuel', N'Roth', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (56, N'34819213', N'pede.nonummy.ut@yahoo.couk', N'Ap #657-1918 Velit Rd.', 2509, 3526468596, N'Neve', N'Beasley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (57, N'34577263', N'ridiculus@icloud.ca', N'491-7568 Amet St.', 1987, 3527090768, N'Randall', N'Waller', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (58, N'29290886', N'et@yahoo.couk', N'319-9116 Dignissim Av.', 3963, 3522026878, N'Kyla', N'Pacheco', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (59, N'42719429', N'vel.pede@yahoo.couk', N'3079 Nec Rd.', 966, 3533896865, N'Josiah', N'Henderson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (60, N'36880562', N'eu.enim.etiam@aol.ca', N'P.O. Box 494, 6455 Tempor, St.', 2338, 3532838890, N'Otto', N'Fleming', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (61, N'30647689', N'tellus.aenean@protonmail.ca', N'464-1056 Erat Road', 3373, 3525008969, N'Ignatius', N'Mejia', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (62, N'37936663', N'sagittis.placerat@aol.net', N'P.O. Box 227, 1827 Fermentum St.', 1663, 3525131358, N'Jerry', N'Lloyd', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (63, N'40073474', N'orci.ut@protonmail.ca', N'Ap #671-1819 Gravida. St.', 803, 3529810280, N'Bell', N'Justice', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (64, N'42267753', N'fermentum.convallis.ligula@icloud.net', N'Ap #173-2157 Gravida. Road', 696, 3520440428, N'Stacy', N'Shaffer', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (65, N'26386673', N'velit@protonmail.net', N'P.O. Box 986, 4269 Ipsum St.', 3741, 3521709738, N'Dominic', N'Cochran', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (66, N'43757380', N'velit.in.aliquet@aol.edu', N'Ap #583-668 Augue. Ave', 101, 3526744563, N'Barrett', N'Henderson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (67, N'26723611', N'vel.arcu@google.org', N'120-7603 Lorem, Street', 1665, 3535419879, N'Mariam', N'Browning', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (68, N'33377676', N'lacus.quisque@hotmail.com', N'P.O. Box 579, 4150 Nullam Road', 1818, 3521853429, N'Kalia', N'Ortega', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (69, N'38032883', N'vitae.mauris@yahoo.com', N'P.O. Box 816, 5765 Amet, Av.', 2011, 3538436346, N'Lisandra', N'Conner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (70, N'41223372', N'eleifend.nunc@outlook.ca', N'5199 Mauris Avenue', 1774, 3516539900, N'Amery', N'Freeman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (71, N'34948931', N'in.mi@outlook.net', N'777-7408 Nisi Rd.', 2664, 3527473718, N'Anjolie', N'Lane', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (72, N'32234619', N'proin@google.couk', N'574-7700 Sem St.', 1973, 3526892820, N'Grady', N'Gamble', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (73, N'23397902', N'phasellus.in.felis@aol.couk', N'Ap #426-2779 Felis, St.', 576, 3532724748, N'Solomon', N'Morgan', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (74, N'42612980', N'vestibulum.massa.rutrum@outlook.ca', N'919-4849 Non, St.', 3182, 3524388164, N'Quinn', N'Bowers', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (75, N'44168016', N'taciti.sociosqu@google.edu', N'Ap #627-455 Donec Ave', 2313, 3518481305, N'Kyra', N'Warren', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (76, N'35386125', N'lectus.pede.et@hotmail.com', N'Ap #581-1894 Lacus. Street', 547, 3527979057, N'Keane', N'Huffman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (77, N'25559495', N'ut.dolor.dapibus@aol.edu', N'P.O. Box 436, 8436 Blandit St.', 2748, 3535099611, N'Elvis', N'Blake', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (78, N'33484501', N'enim@outlook.net', N'3333 Egestas Road', 2096, 3529420009, N'Nora', N'Beck', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (79, N'40423676', N'convallis@protonmail.com', N'Ap #337-3914 Libero. Street', 2861, 3525092693, N'Gary', N'Medina', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (80, N'44490533', N'gravida.praesent@outlook.com', N'Ap #227-7911 Vitae Avenue', 2906, 3534201306, N'Bevis', N'Finley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (81, N'27383860', N'parturient@google.com', N'2473 Mattis Rd.', 3606, 3525547014, N'Shay', N'Mckenzie', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (82, N'43039303', N'ante@protonmail.com', N'Ap #386-900 Ipsum Av.', 3741, 3530305747, N'Breanna', N'Horne', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (83, N'24666719', N'tincidunt.pede@aol.edu', N'248-8227 Cras St.', 231, 3536994196, N'Marah', N'Coffey', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (84, N'44445409', N'leo.cras@icloud.edu', N'P.O. Box 159, 5092 Gravida Ave', 2896, 3515058586, N'Timon', N'Conner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (85, N'39840966', N'magna@icloud.com', N'944-8851 Dui. Rd.', 685, 3536867004, N'Victoria', N'Lowe', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (86, N'44037030', N'tristique.aliquet.phasellus@google.org', N'P.O. Box 609, 4005 Sit Avenue', 2282, 3531057537, N'Quemby', N'Porter', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (87, N'38947041', N'cursus.diam@aol.org', N'Ap #499-8562 Nunc Ave', 596, 3528648566, N'Ralph', N'Richardson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (88, N'41397922', N'luctus.ipsum@aol.net', N'Ap #936-6049 Sed, Road', 3424, 3520161781, N'Herrod', N'Miles', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (89, N'39181677', N'augue@icloud.couk', N'709-1658 Faucibus Avenue', 3087, 3515843309, N'Skyler', N'Buckley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (90, N'43336160', N'risus.a@icloud.net', N'6720 Leo Rd.', 2411, 3528554981, N'Wynter', N'Russell', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (91, N'29487721', N'lorem.ipsum.dolor@google.com', N'Ap #935-4363 Gravida St.', 859, 3525973981, N'Katelyn', N'Scott', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (92, N'44766582', N'ipsum.cursus@hotmail.ca', N'P.O. Box 811, 6086 Ante, Road', 3746, 3532391835, N'Felicia', N'Suarez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (93, N'28599942', N'enim@hotmail.com', N'740 Vestibulum Rd.', 2062, 3517104046, N'Odette', N'Warner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (94, N'42750984', N'turpis.in@hotmail.org', N'P.O. Box 692, 5557 Pede, Ave', 3228, 3539603127, N'Hanae', N'Hammond', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (95, N'42757686', N'egestas.lacinia@protonmail.ca', N'Ap #993-6220 Pede Avenue', 1779, 3522269304, N'Gillian', N'Barrera', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (96, N'26658441', N'vitae.erat@outlook.edu', N'752-404 Orci. Avenue', 2652, 3518671126, N'Armand', N'Delacruz', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (97, N'39051753', N'arcu.morbi.sit@outlook.ca', N'8035 Ut St.', 1973, 3536354675, N'Clementine', N'Beck', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (98, N'37005245', N'donec@aol.couk', N'112-2434 Cras Street', 2716, 3539017717, N'Laurel', N'Blair', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (99, N'26567616', N'quisque.imperdiet@aol.net', N'Ap #268-6674 Fringilla St.', 3532, 3538129013, N'Hope', N'Melendez', 1)
GO
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (100, N'23829913', N'pellentesque.tincidunt@protonmail.org', N'205-2084 Nec Street', 3181, 3524670813, N'Yasir', N'Lucas', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (101, N'40028784', N'dolor@icloud.com', N'3567 Etiam Street', 374, 3524165205, N'Jason', N'Haley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (102, N'39870589', N'quam@google.edu', N'P.O. Box 163, 1132 Erat, Road', 679, 3516295590, N'Warren', N'Singleton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (103, N'33221586', N'semper.et.lacinia@outlook.edu', N'Ap #774-700 Dapibus Rd.', 1034, 3522989463, N'Russell', N'Alston', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (104, N'30516613', N'curabitur.dictum@icloud.couk', N'879-9044 Morbi St.', 2348, 3536912714, N'Pearl', N'Case', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (105, N'34590485', N'mollis.vitae.posuere@aol.net', N'9241 Velit Rd.', 1776, 3524117712, N'Deacon', N'Mendoza', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (106, N'42387322', N'velit.eget@icloud.ca', N'Ap #932-9851 In Rd.', 2976, 3538722221, N'Rigel', N'Clayton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (107, N'42998194', N'hymenaeos@aol.edu', N'P.O. Box 841, 6779 Ad Road', 231, 3523751918, N'Ignacia', N'Mccray', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (108, N'24944018', N'ut.semper@outlook.com', N'P.O. Box 387, 8532 In Ave', 1470, 3519495249, N'Laura', N'Johns', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (109, N'36688067', N'duis@google.com', N'Ap #270-5364 Facilisis St.', 473, 3516881911, N'Malik', N'Boyer', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (110, N'33460227', N'ligula.nullam.feugiat@protonmail.edu', N'P.O. Box 385, 3015 Imperdiet Rd.', 293, 3537777812, N'Damian', N'Spencer', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (111, N'24670140', N'ac.fermentum.vel@yahoo.net', N'Ap #181-2240 Nunc Ave', 2324, 3522410484, N'Hannah', N'Evans', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (112, N'27730171', N'urna.ut.tincidunt@aol.edu', N'262-4334 Aliquet Ave', 2310, 3520037992, N'Damian', N'Whitney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (113, N'29079556', N'lorem.auctor@yahoo.ca', N'P.O. Box 585, 218 Congue. Street', 2787, 3529939103, N'Montana', N'Weeks', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (114, N'42603385', N'non.lacinia@hotmail.net', N'797-6497 Dolor. Av.', 2561, 3529200642, N'Rachel', N'Stephenson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (115, N'35665675', N'ultricies.ornare@protonmail.ca', N'Ap #890-4562 Lobortis Rd.', 2005, 3518843074, N'Jonas', N'Davenport', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (116, N'32106942', N'sed.eu.eros@aol.ca', N'834-418 Elit. Street', 1129, 3521590564, N'Buckminster', N'Padilla', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (117, N'26403821', N'nulla@outlook.org', N'Ap #822-4610 Quis St.', 2890, 3537951437, N'Miriam', N'Houston', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (118, N'30547428', N'commodo.auctor@hotmail.org', N'P.O. Box 420, 4978 Lectus, Rd.', 2412, 3534306692, N'Dominique', N'Fry', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (119, N'26842085', N'sed.sapien@protonmail.ca', N'5109 Odio Rd.', 1613, 3516287640, N'Zachery', N'Lee', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (120, N'25798419', N'cursus.et@hotmail.couk', N'Ap #915-7218 Est Ave', 588, 3535397107, N'Genevieve', N'Mack', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (121, N'33085284', N'tellus@aol.edu', N'Ap #678-1421 Suspendisse Road', 2936, 3524827800, N'Alec', N'Goodwin', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (122, N'41822038', N'nascetur.ridiculus@hotmail.com', N'P.O. Box 108, 1987 Aliquet Avenue', 1833, 3534355977, N'Alden', N'Haynes', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (123, N'39715878', N'posuere@hotmail.edu', N'655 Urna. Rd.', 1080, 3524700998, N'Dennis', N'Ware', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (124, N'24789886', N'nascetur@yahoo.edu', N'P.O. Box 346, 3408 Ac, Rd.', 2324, 3521994190, N'Georgia', N'Vance', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (125, N'28716956', N'nulla.facilisi@google.org', N'Ap #238-3285 Euismod St.', 3228, 3537856725, N'Kennedy', N'Berg', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (126, N'41691598', N'neque.pellentesque.massa@aol.couk', N'635-1179 Aliquam Rd.', 3492, 3520794445, N'Ingrid', N'Mckenzie', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (127, N'33568762', N'nibh.sit.amet@hotmail.couk', N'701-7794 Arcu Rd.', 2971, 3533679581, N'Britanni', N'Powell', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (128, N'27688732', N'orci.donec.nibh@google.net', N'474-173 Nisi Road', 2989, 3523937716, N'Melanie', N'Frank', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (129, N'36252767', N'massa.mauris.vestibulum@google.edu', N'384-3245 Nec, Avenue', 3477, 3531108312, N'Stuart', N'Rich', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (130, N'23472067', N'amet.metus.aliquam@protonmail.com', N'Ap #674-1912 In Avenue', 1097, 3521239299, N'Vaughan', N'Tate', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (131, N'25285929', N'etiam.imperdiet.dictum@hotmail.ca', N'Ap #543-6105 Luctus St.', 1827, 3529743703, N'Kennan', N'Campos', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (132, N'26629907', N'a@aol.ca', N'3714 Massa. Rd.', 2915, 3530064784, N'Demetrius', N'Duke', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (133, N'28433397', N'auctor.velit@google.org', N'Ap #259-6722 Consectetuer Rd.', 2839, 3528227737, N'Rafael', N'Stephenson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (134, N'28029397', N'eget@aol.couk', N'Ap #131-6569 Diam St.', 3031, 3534818133, N'Lane', N'Hamilton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (135, N'29056570', N'suspendisse@aol.edu', N'234-2608 Eu St.', 2452, 3538951262, N'Oleg', N'Norris', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (136, N'42244799', N'ligula@yahoo.edu', N'1062 Aliquam Rd.', 2373, 3529536237, N'Noah', N'Levine', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (137, N'33291767', N'fringilla.euismod@protonmail.ca', N'1794 Euismod Road', 1240, 3533278814, N'Kelsey', N'Marquez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (138, N'32462964', N'sagittis.felis.donec@icloud.edu', N'779 Dolor Rd.', 2698, 3515604080, N'Murphy', N'Barrett', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (139, N'29489731', N'congue.turpis@protonmail.com', N'5347 A Street', 3806, 3518625341, N'Breanna', N'Stanton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (140, N'39689853', N'arcu.curabitur@icloud.com', N'353-9900 Ac St.', 3183, 3533370189, N'Gail', N'Clements', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (141, N'27588349', N'placerat.eget.venenatis@icloud.net', N'Ap #112-136 Ullamcorper Rd.', 1682, 3530612681, N'Xenos', N'Mann', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (142, N'25379255', N'nullam.scelerisque@hotmail.com', N'178-8482 Scelerisque, Ave', 2313, 3518517287, N'Keith', N'Montgomery', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (143, N'36221485', N'nunc.in.at@hotmail.ca', N'Ap #604-8731 Cursus Rd.', 1193, 3526481662, N'Matthew', N'Gregory', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (144, N'44701938', N'at.auctor.ullamcorper@aol.edu', N'577-6586 Pellentesque, Ave', 3149, 3515193236, N'Omar', N'Benton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (145, N'26006260', N'ut.sagittis@icloud.net', N'Ap #819-7708 Dolor. Rd.', 880, 3531620190, N'Scott', N'Rosales', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (146, N'33445901', N'placerat.orci@google.edu', N'707-9300 Molestie Av.', 2826, 3530341798, N'Zane', N'Mendez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (147, N'37110038', N'nonummy@yahoo.couk', N'Ap #444-8453 Luctus Avenue', 2026, 3533849667, N'Karen', N'Riddle', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (148, N'44618260', N'ligula@hotmail.ca', N'P.O. Box 254, 5389 Vestibulum St.', 2271, 3534537620, N'Gary', N'Elliott', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (149, N'39861050', N'sit@google.org', N'Ap #592-5488 Sed Rd.', 1677, 3532676824, N'Hedda', N'Wolfe', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (150, N'34047459', N'tristique.ac@google.couk', N'941-2944 Nulla Rd.', 2366, 3525773215, N'Carson', N'Curry', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (151, N'30313855', N'ut@outlook.couk', N'Ap #848-2562 Donec Street', 3838, 3529889699, N'Mollie', N'Vargas', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (152, N'43318985', N'massa.suspendisse.eleifend@protonmail.com', N'387-6643 Suspendisse Avenue', 2088, 3518217156, N'Austin', N'Melendez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (153, N'36804776', N'lorem.ipsum.dolor@icloud.com', N'116-3629 A, Avenue', 2617, 3525235930, N'Bernard', N'Ferguson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (154, N'43023569', N'etiam.bibendum@icloud.com', N'967-9690 Lorem Ave', 3674, 3538043333, N'Gil', N'Miller', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (155, N'37488737', N'mus.donec@google.ca', N'2438 Sed St.', 712, 3521186446, N'Colt', N'Hurst', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (156, N'23899016', N'donec.consectetuer@protonmail.ca', N'846-3194 Sed Street', 3606, 3517633610, N'Charissa', N'Ortega', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (157, N'29515348', N'nec.quam.curabitur@icloud.ca', N'Ap #893-8827 Cursus Ave', 2312, 3532589295, N'Stone', N'Valentine', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (158, N'40301769', N'nunc@google.net', N'3104 Vitae Rd.', 1061, 3536388393, N'Ursa', N'Stuart', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (159, N'37599822', N'tincidunt.neque@hotmail.com', N'389-6798 Ac St.', 614, 3516612304, N'Ariana', N'Goff', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (160, N'39858591', N'eleifend.nunc@icloud.couk', N'958-1635 Tempor Road', 2263, 3516642803, N'Winter', N'Kent', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (161, N'26378294', N'adipiscing.mauris@icloud.ca', N'P.O. Box 397, 3095 Lorem Rd.', 1844, 3531232844, N'Oprah', N'Dillard', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (162, N'43808412', N'nunc@outlook.edu', N'Ap #672-7898 Vitae Av.', 3482, 3530202384, N'Sawyer', N'Small', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (163, N'39278067', N'interdum.sed@outlook.ca', N'554-7849 Sem St.', 870, 3535793426, N'Justine', N'Moss', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (164, N'36298751', N'sit.amet@icloud.couk', N'8339 Lectus Street', 1292, 3529943597, N'Isaiah', N'Bridges', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (165, N'33228833', N'donec.sollicitudin.adipiscing@hotmail.com', N'Ap #774-7971 Tellus Ave', 1925, 3522886306, N'Hiram', N'Nguyen', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (166, N'36884216', N'mus.proin@icloud.net', N'Ap #158-4641 Donec Avenue', 3515, 3534019047, N'Jacob', N'Hammond', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (167, N'36934761', N'mauris.ipsum@google.com', N'403-3538 Commodo Avenue', 675, 3528064590, N'Emerald', N'Cherry', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (168, N'38273644', N'arcu.et@icloud.net', N'753-2363 Semper St.', 3375, 3523291850, N'Demetrius', N'Ferrell', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (169, N'25037883', N'et.commodo@icloud.net', N'547-1512 Ac Road', 2496, 3515333114, N'Rosalyn', N'Barnett', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (170, N'23491226', N'in@aol.ca', N'2180 Faucibus Road', 3294, 3517471005, N'Quynn', N'Bartlett', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (171, N'44075569', N'in.mi.pede@protonmail.net', N'707-8229 Bibendum St.', 1776, 3539776098, N'Lester', N'Poole', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (172, N'43208232', N'aliquam.eu@yahoo.net', N'Ap #306-7439 Sed, Ave', 2482, 3519153971, N'Dennis', N'Ortega', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (173, N'34896478', N'nullam.nisl@aol.ca', N'407-7264 Interdum Rd.', 3590, 3539910865, N'Nigel', N'Avery', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (174, N'39029690', N'euismod.mauris@google.ca', N'125-5759 Enim. Rd.', 3845, 3534780741, N'Daryl', N'Collier', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (175, N'23857451', N'lorem.lorem@google.edu', N'Ap #953-7172 Vivamus Street', 2718, 3518404926, N'Yoko', N'Walker', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (176, N'32960612', N'nunc@yahoo.edu', N'P.O. Box 778, 4073 Enim, St.', 3423, 3537540382, N'Sierra', N'Lindsey', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (177, N'32745520', N'suspendisse.aliquet.sem@hotmail.edu', N'888-4519 Nec Av.', 2442, 3517901399, N'Aspen', N'Ball', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (178, N'38882800', N'ipsum@protonmail.edu', N'Ap #297-5860 Sit Rd.', 922, 3530545708, N'Leslie', N'Wallace', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (179, N'32296308', N'pellentesque.tincidunt.tempus@google.net', N'P.O. Box 361, 7870 Lobortis Avenue', 3342, 3517316852, N'Aimee', N'Cruz', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (180, N'35174954', N'orci.phasellus@hotmail.org', N'Ap #814-8210 Faucibus St.', 2242, 3532902373, N'Camilla', N'Harmon', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (181, N'30935915', N'proin.mi@yahoo.edu', N'1071 Enim, Ave', 2236, 3536017595, N'Neve', N'Snyder', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (182, N'34079097', N'dapibus.gravida.aliquam@google.com', N'Ap #436-7750 Scelerisque, St.', 3741, 3537230122, N'Orla', N'Melendez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (183, N'36461691', N'ante.blandit@protonmail.com', N'Ap #914-9072 Magna. Road', 3315, 3524395793, N'Stewart', N'Clark', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (184, N'40986829', N'velit.justo@icloud.com', N'5516 Non Rd.', 997, 3538086154, N'Lacy', N'Elliott', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (185, N'24607603', N'et@aol.ca', N'Ap #781-4046 Quis Av.', 1212, 3524314647, N'Helen', N'Weiss', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (186, N'28554352', N'nibh.enim@protonmail.couk', N'855-6927 Habitant Rd.', 1459, 3522600505, N'Ali', N'Diaz', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (187, N'36728504', N'erat@aol.net', N'Ap #897-3027 Lorem Ave', 3776, 3530687518, N'Jane', N'Chambers', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (188, N'26631566', N'leo.vivamus@hotmail.com', N'3078 Molestie Rd.', 683, 3517369583, N'Emerson', N'Lindsey', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (189, N'44318484', N'ut@outlook.edu', N'Ap #181-319 Urna. Av.', 1303, 3515647797, N'Cairo', N'Huber', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (190, N'24618518', N'mauris.molestie@icloud.net', N'Ap #257-9468 Sodales Rd.', 594, 3531357149, N'Orson', N'Hyde', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (191, N'44787906', N'donec.tempor@google.ca', N'8454 Feugiat St.', 294, 3522203915, N'Lareina', N'Quinn', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (192, N'41533047', N'dui.in@google.com', N'P.O. Box 849, 5929 Vitae Street', 276, 3530189660, N'Nicole', N'Craig', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (193, N'41303262', N'etiam@hotmail.org', N'P.O. Box 802, 2313 Duis St.', 3015, 3530533748, N'Jayme', N'Bernard', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (194, N'25698529', N'posuere.vulputate@aol.edu', N'Ap #198-3817 Sollicitudin Road', 1741, 3532136316, N'Melodie', N'Serrano', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (195, N'37633612', N'viverra.donec@protonmail.com', N'Ap #981-1207 Nunc. Street', 2260, 3527080458, N'Kennan', N'Rice', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (196, N'32052403', N'tincidunt.aliquam@hotmail.ca', N'632-7837 Vitae Rd.', 3235, 3522199636, N'Keegan', N'Peterson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (197, N'35138344', N'mauris.erat@protonmail.org', N'Ap #719-7007 Iaculis Rd.', 3508, 3533581252, N'Paul', N'Cruz', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (198, N'37562191', N'at.augue.id@outlook.ca', N'P.O. Box 441, 1591 Imperdiet Avenue', 3341, 3538944009, N'Kiona', N'Davis', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (199, N'32647996', N'porttitor@hotmail.com', N'Ap #937-9105 Consectetuer St.', 3871, 3530402841, N'Kylan', N'Tran', 1)
GO
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (200, N'39202725', N'a.neque@icloud.org', N'Ap #608-4935 Egestas Rd.', 2825, 3521607059, N'Freya', N'Buchanan', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (201, N'27999158', N'arcu.vestibulum@outlook.com', N'989-6903 Mauris Rd.', 3769, 3517967935, N'Edan', N'Gamble', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (202, N'33182289', N'consequat@hotmail.edu', N'109-6126 Feugiat. Avenue', 2089, 3536029484, N'Halla', N'Wall', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (203, N'23996856', N'turpis.aliquam@protonmail.com', N'165-1934 Non Road', 2015, 3530945496, N'Christian', N'Crane', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (204, N'35879346', N'mattis.integer@icloud.ca', N'P.O. Box 236, 2336 Ac St.', 436, 3517789377, N'Darrel', N'Carpenter', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (205, N'36586700', N'sollicitudin@protonmail.org', N'Ap #664-1327 Vivamus Rd.', 2422, 3538777317, N'Sara', N'Roman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (206, N'25816541', N'malesuada.fames.ac@icloud.couk', N'8346 Vivamus St.', 3968, 3525648973, N'Rudyard', N'Lee', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (207, N'41422713', N'risus.in@hotmail.edu', N'633-1833 Nostra, Rd.', 3341, 3521077052, N'Kareem', N'Langley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (208, N'42364527', N'placerat.eget@hotmail.org', N'6601 Neque St.', 3785, 3516070303, N'Blythe', N'George', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (209, N'34164916', N'pharetra@yahoo.org', N'1427 Etiam Avenue', 1046, 3515733691, N'Emery', N'Sloan', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (210, N'30167621', N'pede@outlook.net', N'P.O. Box 633, 4672 Tempor Avenue', 1102, 3537573106, N'Donna', N'Herring', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (211, N'26488684', N'et.euismod.et@google.ca', N'669-954 Enim Road', 1886, 3538231108, N'Grace', N'Mullins', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (212, N'41504612', N'a.odio@icloud.edu', N'Ap #954-3157 Metus Av.', 1197, 3535353001, N'Brandon', N'Mcneil', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (213, N'25214347', N'hendrerit.a.arcu@protonmail.couk', N'458-176 Consectetuer Road', 2151, 3536993694, N'Brennan', N'Pope', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (214, N'29060745', N'tristique.senectus.et@protonmail.edu', N'Ap #386-5087 Sit Rd.', 1579, 3533230853, N'Cheyenne', N'Manning', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (215, N'38039809', N'at.libero.morbi@yahoo.com', N'P.O. Box 728, 2973 Tristique Rd.', 2138, 3516965130, N'Hu', N'Fitzpatrick', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (216, N'43909449', N'id.sapien@icloud.org', N'Ap #289-6730 Eget Ave', 2818, 3519214607, N'Ina', N'Perry', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (217, N'30450407', N'risus.nunc@yahoo.edu', N'Ap #569-2728 Mollis St.', 699, 3522503263, N'Gannon', N'Wiggins', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (218, N'41277732', N'sed.sem@outlook.org', N'Ap #178-7699 Proin Rd.', 1160, 3530239661, N'Ahmed', N'Castaneda', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (219, N'30691617', N'nullam.vitae@protonmail.net', N'Ap #445-9492 Aenean St.', 1722, 3517985457, N'Hamish', N'Murphy', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (220, N'43178120', N'libero.et.tristique@yahoo.edu', N'Ap #843-6829 Sem. Rd.', 1674, 3516766695, N'Galena', N'Lindsay', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (221, N'24404623', N'erat@yahoo.org', N'976-5816 Velit Av.', 2390, 3533131542, N'Kalia', N'Santiago', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (222, N'30620967', N'diam.nunc@yahoo.couk', N'P.O. Box 350, 7103 Varius Road', 2407, 3526607693, N'Ryder', N'Rivera', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (223, N'41010689', N'dolor.egestas@outlook.edu', N'7600 Hendrerit Rd.', 804, 3519474591, N'Leo', N'Frazier', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (224, N'31389497', N'natoque.penatibus@outlook.net', N'Ap #113-5340 Ipsum Rd.', 2137, 3528675768, N'David', N'Delaney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (225, N'34018362', N'scelerisque.neque@outlook.ca', N'1327 Arcu St.', 3753, 3518890292, N'Russell', N'Stewart', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (226, N'37400932', N'ipsum.suspendisse@google.couk', N'9209 Proin Rd.', 752, 3532763981, N'Ray', N'Faulkner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (227, N'35600788', N'justo.eu.arcu@hotmail.org', N'794-7351 Odio. Rd.', 1053, 3527389659, N'Bruce', N'Justice', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (228, N'30170400', N'nec.urna@hotmail.org', N'693-9703 Arcu. Avenue', 3950, 3534162617, N'Selma', N'Livingston', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (229, N'25707278', N'fermentum.arcu@outlook.ca', N'Ap #950-1516 Class Street', 223, 3519847074, N'Patrick', N'Sanchez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (230, N'30198827', N'sagittis.placerat@hotmail.edu', N'137-8361 Per St.', 3773, 3530996244, N'Drake', N'Mcgee', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (231, N'33257224', N'purus.duis.elementum@hotmail.com', N'Ap #390-2316 Eros Av.', 189, 3526616090, N'Xantha', N'Battle', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (232, N'35708563', N'odio.a.purus@hotmail.net', N'945-9759 Dolor, Street', 230, 3517225657, N'Haley', N'Rogers', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (233, N'31370447', N'elit.erat@aol.edu', N'Ap #703-8573 Ornare Street', 471, 3525556823, N'Patience', N'Ray', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (234, N'28342812', N'non.hendrerit@yahoo.edu', N'P.O. Box 482, 9009 Donec Ave', 3371, 3517515143, N'Rudyard', N'Knight', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (235, N'38842113', N'nisl.maecenas@hotmail.net', N'183-7835 Mauris, Street', 750, 3518082261, N'Luke', N'Haley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (236, N'23355826', N'eu.eros.nam@outlook.ca', N'7628 Sed Rd.', 2402, 3530552505, N'Serena', N'Prince', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (237, N'38009274', N'scelerisque.scelerisque@aol.ca', N'P.O. Box 113, 4983 Vivamus Avenue', 3127, 3523358261, N'Oren', N'Rowe', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (238, N'25732737', N'adipiscing@outlook.couk', N'Ap #986-9597 Dui. St.', 2763, 3532092833, N'Jana', N'Mcneil', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (239, N'25993150', N'dictum.placerat@google.com', N'P.O. Box 403, 7578 Dictum Rd.', 430, 3519903647, N'Lesley', N'English', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (240, N'43966153', N'a.nunc.in@protonmail.org', N'Ap #152-208 Nisi. Av.', 2836, 3534298870, N'Coby', N'Mcknight', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (241, N'32636993', N'integer.tincidunt@aol.edu', N'175-5052 Consectetuer, Road', 442, 3515432576, N'Helen', N'Todd', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (242, N'41330360', N'consequat.purus@aol.org', N'110-8146 Bibendum Avenue', 2078, 3528466012, N'Judith', N'Horne', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (243, N'31476793', N'congue.in@hotmail.ca', N'Ap #361-6322 Dictum Avenue', 584, 3518135429, N'Laurel', N'Decker', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (244, N'28613369', N'mi.felis@outlook.net', N'656-5137 Mollis St.', 2311, 3528655198, N'Indigo', N'Floyd', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (245, N'26464225', N'iaculis@outlook.edu', N'936-6995 Mus. Ave', 2972, 3536144086, N'Ethan', N'Perez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (246, N'40791590', N'aliquam.adipiscing.lobortis@yahoo.net', N'8408 Molestie Street', 935, 3527346823, N'Omar', N'Skinner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (247, N'40319696', N'imperdiet.nec@icloud.com', N'Ap #891-1584 Augue Ave', 1702, 3527080451, N'Castor', N'Crosby', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (248, N'25720163', N'mollis.nec@aol.edu', N'Ap #840-4520 Quisque Avenue', 390, 3538702421, N'Ryder', N'Cummings', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (249, N'44702190', N'ut.nec.urna@google.net', N'Ap #907-2111 Nulla Av.', 1366, 3515289731, N'Rhiannon', N'Williams', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (250, N'26486932', N'neque.venenatis@outlook.couk', N'P.O. Box 967, 6348 Augue Av.', 2351, 3532875420, N'Yoshi', N'Morgan', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (251, N'41822167', N'lobortis.quis@aol.edu', N'P.O. Box 831, 2900 Et, Rd.', 1802, 3528378284, N'Chancellor', N'Wheeler', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (252, N'38801536', N'amet.metus@hotmail.net', N'6274 Tellus Road', 879, 3535910925, N'Tanisha', N'Delacruz', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (253, N'25863626', N'posuere@protonmail.couk', N'3143 Ullamcorper. St.', 1874, 3527838255, N'Louis', N'Watkins', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (254, N'26537048', N'lobortis.ultrices@protonmail.net', N'P.O. Box 404, 3312 Facilisis Street', 2897, 3528092595, N'Darryl', N'Rodriquez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (255, N'37531984', N'inceptos.hymenaeos.mauris@yahoo.edu', N'Ap #237-3102 Nulla St.', 1565, 3537607788, N'Gail', N'Strong', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (256, N'25473361', N'turpis@aol.edu', N'P.O. Box 410, 2926 Quam. Rd.', 2008, 3522329923, N'Oprah', N'Newman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (257, N'33349773', N'posuere.cubilia@google.net', N'Ap #938-6163 Tempor St.', 1839, 3519946942, N'Carolyn', N'Lara', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (258, N'40375862', N'enim.gravida@yahoo.com', N'687-8951 Dolor. St.', 2127, 3532221346, N'Kirby', N'Hines', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (259, N'23889507', N'velit.pellentesque@google.edu', N'P.O. Box 244, 1702 Vivamus Rd.', 2772, 3527126239, N'Cheryl', N'Gaines', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (260, N'42610635', N'ipsum.dolor@icloud.org', N'898-4435 Tristique Avenue', 2002, 3521969734, N'Carissa', N'Brady', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (261, N'24167589', N'in.aliquet@outlook.couk', N'951-6222 Ac Rd.', 183, 3524510777, N'Bethany', N'Francis', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (262, N'24375138', N'enim.commodo.hendrerit@aol.edu', N'5336 Velit. Avenue', 421, 3532037909, N'Graham', N'Chapman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (263, N'34342188', N'arcu@aol.org', N'708-7406 Augue, Street', 2605, 3539829169, N'Jolene', N'Clay', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (264, N'30621821', N'neque.in@yahoo.com', N'Ap #601-8022 Non, Avenue', 3736, 3538599419, N'Tyrone', N'Barnett', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (265, N'41200108', N'et.rutrum.eu@protonmail.org', N'426-2263 Vitae, Street', 2416, 3530910219, N'Mohammad', N'Wade', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (266, N'28813405', N'montes.nascetur.ridiculus@outlook.edu', N'Ap #714-582 Enim Ave', 2505, 3526000411, N'Savannah', N'Schmidt', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (267, N'37464057', N'lorem.ipsum@protonmail.couk', N'Ap #142-3557 Nunc Avenue', 902, 3520996449, N'Signe', N'Shaw', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (268, N'25506536', N'nec.leo@aol.net', N'9697 Mauris Ave', 376, 3519069075, N'Michael', N'Church', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (269, N'37859778', N'aliquam.nisl@aol.org', N'P.O. Box 403, 592 Sociis Street', 709, 3517739127, N'MacKensie', N'Shields', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (270, N'26978155', N'vestibulum@outlook.net', N'418-6459 Justo Av.', 825, 3516898000, N'Melodie', N'Morrison', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (271, N'29469825', N'quis.lectus.nullam@aol.org', N'1298 Aliquet. Road', 588, 3523865831, N'Alec', N'Dennis', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (272, N'36644272', N'gravida.non@aol.couk', N'247-4041 Ante Avenue', 366, 3529238083, N'Meredith', N'Patton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (273, N'41524392', N'placerat@icloud.couk', N'P.O. Box 606, 5691 Eget, St.', 2070, 3531756099, N'Aladdin', N'Lester', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (274, N'29829242', N'sagittis.semper.nam@protonmail.edu', N'P.O. Box 138, 7785 Libero Road', 476, 3520609564, N'Julie', N'Owen', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (275, N'29233418', N'elit.pede@yahoo.org', N'199-9251 Dis St.', 641, 3523483532, N'Aspen', N'Tanner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (276, N'24974253', N'magna@protonmail.couk', N'P.O. Box 349, 1849 Cursus. Av.', 613, 3535735683, N'Calista', N'Pope', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (277, N'30471180', N'sit@aol.ca', N'Ap #828-7318 Felis. Av.', 1982, 3537568877, N'Zachary', N'Castro', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (278, N'42196856', N'sed@icloud.com', N'Ap #278-3110 Volutpat Avenue', 3580, 3537161557, N'Kameko', N'Cunningham', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (279, N'43958957', N'ornare@yahoo.edu', N'Ap #192-5001 Pharetra Street', 995, 3530599758, N'Justin', N'Huber', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (280, N'40893380', N'aliquet.magna@icloud.ca', N'2190 Et Ave', 3491, 3534821356, N'Garrett', N'Albert', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (281, N'39605064', N'sed.diam@yahoo.ca', N'2626 Erat. Avenue', 1004, 3532748413, N'Cody', N'Patrick', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (282, N'29583180', N'ut@yahoo.couk', N'P.O. Box 395, 9016 Suspendisse Rd.', 1286, 3529133460, N'Vaughan', N'Klein', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (283, N'31566784', N'id.enim@yahoo.couk', N'218-8773 Sem Road', 1083, 3522080791, N'Kylynn', N'Blackburn', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (284, N'29666658', N'suspendisse.sagittis.nullam@icloud.com', N'P.O. Box 894, 3004 Et Road', 1879, 3535994379, N'Kylynn', N'Kelley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (285, N'38899733', N'et.lacinia@google.com', N'P.O. Box 689, 6099 Purus Rd.', 1250, 3515404009, N'Castor', N'Lopez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (286, N'26717753', N'ante@aol.edu', N'P.O. Box 214, 9589 Pellentesque, Av.', 187, 3524446538, N'Raymond', N'Warren', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (287, N'29203947', N'donec.at@aol.org', N'689-8795 Dui Avenue', 427, 3538227705, N'Marvin', N'Dotson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (288, N'32897847', N'cursus.non@hotmail.com', N'Ap #152-2633 Et, Rd.', 1849, 3534801386, N'Brenna', N'Everett', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (289, N'43835297', N'pede@google.ca', N'284-9895 Fusce Avenue', 3258, 3520883834, N'Denton', N'Owens', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (290, N'35381125', N'donec.feugiat.metus@google.com', N'Ap #940-7850 Quis, Road', 2548, 3529226146, N'Armando', N'Spears', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (291, N'29646486', N'vitae.velit.egestas@icloud.com', N'3322 Tempus Rd.', 2675, 3533424914, N'Adrienne', N'Bullock', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (292, N'32224532', N'sed.orci@icloud.ca', N'Ap #749-2097 Metus Rd.', 3072, 3516932727, N'Kareem', N'Spears', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (293, N'24500580', N'nec.eleifend.non@aol.couk', N'275-9620 Vulputate Ave', 3596, 3523770041, N'Arden', N'Ford', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (294, N'30973989', N'ultrices@google.edu', N'Ap #879-373 Neque. Road', 1833, 3515431449, N'Brock', N'Herman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (295, N'39724350', N'nascetur@icloud.edu', N'4727 Nulla Avenue', 1685, 3523214795, N'Margaret', N'Frederick', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (296, N'32520354', N'hendrerit.neque@outlook.net', N'768-7995 Consequat Ave', 735, 3524132537, N'Harriet', N'Burton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (297, N'30998747', N'et@yahoo.ca', N'3427 Dolor Rd.', 2034, 3522337130, N'Ahmed', N'Patel', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (298, N'29203326', N'eu@aol.edu', N'Ap #754-1976 Dignissim Av.', 2725, 3517833462, N'Quintessa', N'Ellis', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (299, N'24168663', N'arcu.sed@hotmail.edu', N'116-2646 Nullam Rd.', 934, 3520378671, N'Ezekiel', N'Franco', 1)
GO
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (300, N'41077849', N'ante.dictum@outlook.net', N'Ap #197-9641 Non Street', 3168, 3535841648, N'Hyatt', N'Dean', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (301, N'42537225', N'turpis.non@google.couk', N'133-3209 Vitae St.', 2653, 3524482104, N'Jessica', N'Cote', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (302, N'23873539', N'cras.interdum.nunc@icloud.ca', N'P.O. Box 137, 4121 Enim St.', 3222, 3523023710, N'Paula', N'Tanner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (303, N'30578222', N'laoreet.lectus@outlook.edu', N'592-523 Sed, Street', 2612, 3515421274, N'Xanthus', N'Mendez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (304, N'37815472', N'quam@yahoo.couk', N'691-1332 Blandit Ave', 2208, 3534338666, N'Finn', N'Bush', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (305, N'44442586', N'aliquam@aol.org', N'4955 Urna Ave', 1882, 3534615376, N'Christen', N'Meyers', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (306, N'44091746', N'dui.nec@aol.com', N'466-5717 Et, Road', 247, 3519873612, N'David', N'Evans', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (307, N'28065361', N'lorem@aol.edu', N'973-4201 Massa. Rd.', 872, 3525148723, N'Pandora', N'Eaton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (308, N'23049023', N'curabitur@google.edu', N'Ap #464-8069 Imperdiet Rd.', 1700, 3515878520, N'Candace', N'Gallagher', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (309, N'37928136', N'a@aol.org', N'380-7249 Auctor, Road', 2755, 3529579744, N'Lani', N'Compton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (310, N'36261838', N'vitae.diam@aol.net', N'Ap #525-5599 Imperdiet St.', 3104, 3535863590, N'Omar', N'Francis', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (311, N'41974007', N'ornare@outlook.net', N'P.O. Box 939, 7363 Natoque St.', 1867, 3522968130, N'Yolanda', N'Lopez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (312, N'33927368', N'per.conubia.nostra@aol.net', N'9281 Sociis St.', 3051, 3520811952, N'Hayes', N'Mccoy', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (313, N'36239078', N'blandit.at@yahoo.com', N'Ap #269-5301 Vivamus Rd.', 1416, 3516313292, N'Raja', N'Matthews', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (314, N'29922225', N'blandit.at.nisi@google.net', N'475-6388 Class St.', 1986, 3519200896, N'Regan', N'Barlow', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (315, N'34217691', N'aliquet.vel@google.edu', N'Ap #409-8816 Enim St.', 3308, 3533989564, N'Kiayada', N'Simpson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (316, N'38076421', N'aliquet.proin@google.com', N'Ap #103-3171 Aenean Av.', 1588, 3533210301, N'Hilary', N'Ortiz', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (317, N'35097944', N'cras.pellentesque@google.org', N'Ap #903-2801 Pellentesque Av.', 2593, 3517054164, N'Brenden', N'Stuart', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (318, N'39531908', N'venenatis.a@google.couk', N'479-4408 Nunc Av.', 120, 3525256751, N'Hilda', N'Hutchinson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (319, N'24139022', N'ante.nunc@hotmail.ca', N'Ap #402-3532 Sollicitudin Rd.', 412, 3535569150, N'Jermaine', N'Macdonald', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (320, N'42974398', N'sodales.at@aol.org', N'Ap #673-4700 Ornare, Ave', 2613, 3534887600, N'Vernon', N'Mcneil', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (321, N'35065312', N'eget.laoreet.posuere@protonmail.com', N'645-7237 Sapien. Avenue', 581, 3517721526, N'Jena', N'Fowler', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (322, N'29107288', N'urna.ut@hotmail.ca', N'Ap #167-4425 Ultricies Ave', 163, 3518726218, N'Dale', N'Shepard', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (323, N'39479031', N'nunc.lectus@aol.net', N'489 Nunc Street', 1519, 3524857423, N'Cailin', N'Poole', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (324, N'25783955', N'donec@aol.couk', N'894-8149 Amet Ave', 1658, 3515072122, N'Deborah', N'Wood', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (325, N'32311966', N'mi@outlook.com', N'942-188 Non, Rd.', 1004, 3519139738, N'Donovan', N'Rivas', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (326, N'40129480', N'quis.turpis@outlook.ca', N'1756 Iaculis Avenue', 1391, 3529850708, N'Asher', N'Craft', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (327, N'41266025', N'feugiat.nec@yahoo.com', N'614-3956 Non, Ave', 2441, 3534437677, N'Jasper', N'Hurst', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (328, N'30620197', N'erat.semper.rutrum@hotmail.com', N'6567 Ornare St.', 3411, 3533430418, N'Tobias', N'Flowers', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (329, N'32867507', N'mauris.sapien.cursus@outlook.ca', N'Ap #753-4567 Aliquet Avenue', 1570, 3534944506, N'Dieter', N'Vincent', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (330, N'39774124', N'enim.gravida.sit@outlook.ca', N'Ap #130-8602 Tellus, Rd.', 160, 3519020175, N'Paloma', N'Bradshaw', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (331, N'25949436', N'integer.eu.lacus@icloud.org', N'Ap #631-8447 Aliquet Av.', 2845, 3523945467, N'Cole', N'Waller', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (332, N'29826759', N'semper.tellus@google.couk', N'690-1351 Eget Rd.', 2752, 3533901124, N'Colby', N'Lindsay', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (333, N'36193488', N'mauris.eu.turpis@yahoo.couk', N'P.O. Box 715, 2984 Neque Av.', 2406, 3539737226, N'Erica', N'Freeman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (334, N'33320363', N'facilisis.facilisis@google.net', N'5518 Integer Street', 114, 3527733539, N'Ryder', N'Nichols', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (335, N'44099564', N'ad.litora.torquent@outlook.net', N'P.O. Box 603, 6958 Fusce Ave', 3167, 3537937019, N'Ali', N'Vaughan', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (336, N'37111228', N'donec.luctus.aliquet@yahoo.org', N'871-4574 In, Ave', 2255, 3515820363, N'Hayes', N'Pruitt', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (337, N'35077678', N'ultricies@yahoo.net', N'1642 Tincidunt Road', 1781, 3523366947, N'Thane', N'Randall', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (338, N'29161265', N'dolor.elit.pellentesque@google.com', N'Ap #609-5989 Aliquet Road', 3441, 3530796799, N'Darrel', N'Cameron', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (339, N'34403632', N'nascetur.ridiculus@hotmail.org', N'353-7000 Molestie Rd.', 1127, 3521048754, N'Rose', N'Branch', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (340, N'41578004', N'dictum.sapien.aenean@yahoo.edu', N'792-8472 Vitae St.', 624, 3537938069, N'Elmo', N'Reyes', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (341, N'43463138', N'nunc.mauris.sapien@aol.com', N'105-4913 Elit St.', 1853, 3517465285, N'Robin', N'Levine', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (342, N'37650859', N'erat.eget.ipsum@outlook.edu', N'P.O. Box 111, 6684 Dis Street', 1443, 3520684297, N'Leah', N'Spears', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (343, N'28695628', N'sociis.natoque.penatibus@google.edu', N'Ap #290-6865 Mattis St.', 3011, 3529237804, N'Lee', N'Reed', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (344, N'44476077', N'accumsan.interdum@outlook.com', N'Ap #556-5282 Sed St.', 1138, 3520454256, N'Rae', N'Garner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (345, N'26178550', N'non.ante.bibendum@aol.edu', N'Ap #154-1150 In Street', 3035, 3525897542, N'Quentin', N'Wilson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (346, N'42277184', N'molestie@icloud.org', N'Ap #291-5847 Interdum Ave', 2269, 3521613395, N'Thomas', N'Sparks', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (347, N'39039385', N'vel.sapien@google.edu', N'P.O. Box 765, 595 Mi. Rd.', 543, 3532835307, N'Basil', N'Sherman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (348, N'26280418', N'nec.ante.maecenas@hotmail.org', N'9406 Elementum Rd.', 605, 3516309040, N'Zeph', N'Preston', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (349, N'44004152', N'a.nunc@yahoo.ca', N'348-7416 At, Avenue', 1868, 3528150203, N'Stephen', N'Kelley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (350, N'28216008', N'et.malesuada.fames@google.edu', N'P.O. Box 788, 8277 Tempus, Street', 147, 3516311547, N'Cora', N'Robertson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (351, N'43635994', N'ut@yahoo.ca', N'307-2476 Urna Avenue', 2276, 3539431179, N'Cameron', N'Cabrera', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (352, N'25058630', N'lectus@protonmail.com', N'8553 Id, St.', 678, 3521082258, N'Paul', N'Kane', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (353, N'33045948', N'facilisis.vitae.orci@protonmail.couk', N'P.O. Box 126, 8483 Sodales St.', 1008, 3535405860, N'Daquan', N'Valentine', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (354, N'23347574', N'pede@yahoo.couk', N'822-2886 Vitae, Rd.', 3499, 3529359626, N'Gary', N'Garrett', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (355, N'35689321', N'nulla.dignissim.maecenas@outlook.org', N'P.O. Box 737, 1200 Nec, Av.', 1343, 3515050017, N'Adrian', N'Flowers', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (356, N'34551111', N'in@hotmail.com', N'Ap #883-4954 Ante. Ave', 1170, 3538461288, N'Hilary', N'Berg', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (357, N'38062459', N'sed.id@hotmail.com', N'Ap #997-2624 Sed Rd.', 1537, 3525273506, N'Doris', N'Guzman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (358, N'27785938', N'adipiscing.lacus@outlook.couk', N'6789 Blandit Av.', 1449, 3534739203, N'Calvin', N'Burt', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (359, N'40099465', N'eu@protonmail.ca', N'Ap #568-205 A Rd.', 351, 3523229564, N'Julie', N'Turner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (360, N'42910974', N'non.luctus.sit@outlook.com', N'P.O. Box 770, 7006 Quis Ave', 2641, 3537599013, N'Wynter', N'Prince', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (361, N'24611214', N'vel.nisl.quisque@aol.edu', N'Ap #598-3513 Ut Street', 2160, 3531431058, N'Tanya', N'Phelps', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (362, N'35751377', N'integer.sem@yahoo.edu', N'989-7324 Praesent Road', 3811, 3522661379, N'Stuart', N'Huff', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (363, N'29256404', N'enim.nunc@aol.ca', N'Ap #577-5148 Aenean Road', 1013, 3521505039, N'Ariel', N'Cote', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (364, N'34058749', N'dictum.mi.ac@google.org', N'210-3328 A, Avenue', 3065, 3516703680, N'Chanda', N'Dominguez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (365, N'43969508', N'orci.ut@hotmail.com', N'841-7579 Arcu Rd.', 3177, 3517324704, N'Quinn', N'Riggs', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (366, N'39437620', N'donec.sollicitudin@hotmail.net', N'1911 Scelerisque Street', 494, 3534802425, N'Caldwell', N'Stafford', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (367, N'44814834', N'donec@icloud.edu', N'Ap #628-8679 Sed St.', 2996, 3528750305, N'Blythe', N'Peters', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (368, N'43351803', N'et.malesuada@icloud.ca', N'Ap #366-2942 Proin St.', 3015, 3533143578, N'Dana', N'Jackson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (369, N'30885501', N'vel.faucibus@hotmail.ca', N'Ap #832-1291 Rutrum Road', 2183, 3535259121, N'Hop', N'Kinney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (370, N'31401018', N'orci.sem@yahoo.org', N'Ap #804-2996 Luctus Road', 1445, 3522785140, N'Bruno', N'Castro', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (371, N'23047805', N'viverra.maecenas@hotmail.org', N'Ap #792-4994 Ut Ave', 3938, 3528653988, N'Mari', N'Paul', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (372, N'38223476', N'dolor.sit@outlook.net', N'Ap #142-5832 Purus Road', 368, 3526889215, N'Louis', N'Kinney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (373, N'23018818', N'in.at@icloud.couk', N'Ap #368-364 Nec Av.', 3736, 3527546406, N'Philip', N'Walls', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (374, N'28968227', N'tellus.justo.sit@protonmail.ca', N'486-1764 Mattis Road', 2916, 3529238355, N'Cora', N'Callahan', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (375, N'42907130', N'parturient.montes.nascetur@hotmail.edu', N'963-2123 Ridiculus Road', 3888, 3523003230, N'James', N'Hill', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (376, N'33896079', N'quis.tristique.ac@yahoo.couk', N'664-6715 Massa St.', 120, 3524848124, N'Logan', N'Pierce', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (377, N'32095473', N'at@outlook.ca', N'Ap #914-2903 Mi Road', 134, 3529023887, N'Ayanna', N'Grant', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (378, N'29948598', N'sed.eget@google.net', N'711-6984 Scelerisque Avenue', 1698, 3530117995, N'Skyler', N'Pennington', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (379, N'25324359', N'mauris@google.couk', N'4729 Facilisis St.', 3213, 3529055521, N'Vladimir', N'Buckley', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (380, N'23687517', N'nunc.est.mollis@protonmail.couk', N'196-2161 Vivamus Rd.', 1712, 3521130967, N'Stacy', N'Little', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (381, N'31090522', N'mi.lorem@aol.couk', N'P.O. Box 592, 2767 Aliquam St.', 1440, 3515093043, N'Paul', N'Kirkland', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (382, N'33594763', N'nonummy.fusce@hotmail.couk', N'3581 Vulputate Av.', 1833, 3530235667, N'Damon', N'Castro', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (383, N'29969531', N'eu@hotmail.com', N'P.O. Box 198, 3589 Sem, Ave', 3373, 3529073401, N'Grace', N'Mckinney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (384, N'29364998', N'tellus.lorem@google.net', N'458-9260 Pede. Street', 3543, 3531730007, N'Althea', N'Sweeney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (385, N'35097283', N'dolor.donec@outlook.com', N'353-1041 Gravida. Avenue', 1188, 3519203858, N'Alec', N'Jennings', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (386, N'32041374', N'fringilla@outlook.org', N'P.O. Box 178, 3425 Fermentum St.', 3459, 3539567401, N'Ulric', N'Merrill', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (387, N'43979521', N'lacinia.vitae@google.couk', N'P.O. Box 838, 4898 Ipsum. Avenue', 2958, 3518453977, N'Mona', N'Wright', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (388, N'42639408', N'dignissim.tempor.arcu@hotmail.com', N'P.O. Box 360, 8266 Eleifend, Ave', 541, 3518533378, N'Victor', N'Madden', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (389, N'43915345', N'porttitor.interdum@icloud.org', N'Ap #549-5353 Est, Road', 2248, 3528930704, N'Hayes', N'Ramsey', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (390, N'24680117', N'pellentesque.eget.dictum@aol.net', N'179-4112 Neque. St.', 976, 3537144739, N'Emerson', N'Gallegos', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (391, N'35256947', N'nec@outlook.edu', N'5271 Quam Av.', 2902, 3519310262, N'Bethany', N'Head', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (392, N'42522411', N'risus@google.couk', N'9500 Vitae, Avenue', 3375, 3531787262, N'Malcolm', N'Brennan', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (393, N'33765398', N'quisque.purus.sapien@google.net', N'182-4561 Accumsan St.', 2574, 3528812492, N'Cassandra', N'Terrell', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (394, N'26662480', N'cras@aol.org', N'757-7235 Convallis Road', 1790, 3530196728, N'Orson', N'Walsh', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (395, N'36212829', N'pede@outlook.couk', N'Ap #326-8555 Fusce Ave', 1018, 3528159117, N'Charlotte', N'Walton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (396, N'40407852', N'cum.sociis.natoque@outlook.net', N'Ap #354-7916 Urna. Street', 812, 3518742918, N'Boris', N'Owen', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (397, N'42127705', N'dolor.nulla.semper@protonmail.edu', N'P.O. Box 558, 8884 Phasellus Street', 3023, 3527782841, N'Maggy', N'Conway', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (398, N'37461685', N'proin.dolor@hotmail.com', N'Ap #596-1779 Cras St.', 769, 3530611946, N'Carlos', N'Avery', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (399, N'26161425', N'praesent.interdum.ligula@aol.com', N'Ap #164-1898 Porta St.', 3338, 3516837283, N'Ryder', N'Terrell', 1)
GO
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (400, N'29286143', N'lorem.semper@yahoo.edu', N'Ap #194-6391 Facilisis St.', 2945, 3522381855, N'Malcolm', N'Kaufman', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (401, N'40539921', N'nunc.ullamcorper@aol.net', N'595-1063 Lacinia Rd.', 1934, 3516028588, N'Oleg', N'Conner', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (402, N'30917255', N'magna.et@aol.org', N'P.O. Box 639, 6189 Proin St.', 1014, 3528018777, N'Xanthus', N'Carpenter', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (403, N'37296596', N'morbi.metus@protonmail.com', N'279-7700 Ac Ave', 3030, 3528208800, N'Faith', N'Bush', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (404, N'37586973', N'ornare.lectus@icloud.edu', N'241-3883 Pretium Rd.', 1214, 3537432481, N'Oprah', N'Hatfield', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (405, N'34562809', N'leo.cras@hotmail.org', N'4498 Turpis St.', 3051, 3527597303, N'Denton', N'Porter', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (406, N'28457030', N'proin.nisl@icloud.ca', N'919-2142 Natoque St.', 3483, 3536209539, N'Rina', N'Camacho', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (407, N'25429188', N'sollicitudin.orci.sem@google.edu', N'8101 Justo. Rd.', 2276, 3538860228, N'Maya', N'Shepard', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (408, N'39291967', N'nisi.nibh.lacinia@outlook.org', N'P.O. Box 237, 1069 Sit Street', 1511, 3534427558, N'Ivor', N'Blake', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (409, N'30237102', N'dui@hotmail.com', N'286-8159 Eget, St.', 577, 3524008118, N'Gil', N'Roach', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (410, N'38810546', N'ornare.facilisis.eget@aol.net', N'714-1963 Ut, Av.', 275, 3530948161, N'Susan', N'Boyd', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (411, N'31999506', N'sem@aol.com', N'623-6194 Sit Ave', 1472, 3539061383, N'Ronan', N'Stark', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (412, N'42077599', N'ante.dictum@hotmail.com', N'929-8508 Nam St.', 3758, 3538157297, N'David', N'Stephens', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (413, N'39073419', N'adipiscing.enim@yahoo.ca', N'Ap #698-9984 Nunc Road', 3008, 3539668514, N'Jordan', N'Russell', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (414, N'30837821', N'pede.ultrices@yahoo.org', N'3368 Dui. Road', 1419, 3527614704, N'Elton', N'Koch', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (415, N'38135360', N'erat@outlook.edu', N'8279 Dolor Avenue', 3076, 3525907349, N'Moses', N'Rodgers', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (416, N'30855849', N'aenean.sed@outlook.com', N'209-2596 Magna. Rd.', 2655, 3538647874, N'Emmanuel', N'Case', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (417, N'38351986', N'et.lacinia@google.ca', N'699-7818 Nonummy St.', 2959, 3535840027, N'Lee', N'Lee', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (418, N'43180727', N'dolor@aol.org', N'Ap #997-1311 Luctus St.', 2865, 3522750639, N'Josephine', N'Erickson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (419, N'39754110', N'tristique@google.edu', N'Ap #861-7823 Est, Ave', 473, 3535115786, N'Jaime', N'Castillo', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (420, N'30165581', N'etiam.vestibulum.massa@icloud.org', N'Ap #121-6462 Vitae St.', 866, 3526163744, N'Amal', N'Hood', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (421, N'24615601', N'aenean.gravida@icloud.edu', N'495-6889 Sem, St.', 506, 3532210411, N'Kermit', N'Estrada', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (422, N'42199899', N'eu.enim.etiam@google.org', N'Ap #701-8788 Risus. Rd.', 360, 3539143758, N'Leigh', N'Macias', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (423, N'28224692', N'cursus.a@yahoo.edu', N'P.O. Box 194, 1197 Cursus, Road', 1805, 3532793011, N'Deborah', N'Dickson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (424, N'23482344', N'lorem.auctor.quis@icloud.com', N'7232 Ligula. Av.', 3946, 3537701361, N'Aurelia', N'Henson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (425, N'44477590', N'non.arcu.vivamus@google.net', N'7386 Sem Rd.', 1246, 3517117201, N'Maya', N'Mcclure', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (426, N'39348707', N'tellus.eu.augue@aol.org', N'3922 Tincidunt Rd.', 3033, 3517719523, N'Shad', N'Baird', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (427, N'24586174', N'mauris.integer@hotmail.edu', N'8758 Aliquam, St.', 3507, 3539881035, N'Cara', N'Leon', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (428, N'26485344', N'egestas.lacinia.sed@protonmail.net', N'513 Sed Road', 2324, 3521218411, N'Ginger', N'Salas', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (429, N'38633623', N'aliquet.nec@protonmail.edu', N'Ap #147-3833 Sit Road', 2188, 3518331498, N'Gillian', N'Cardenas', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (430, N'33053738', N'nec.metus@protonmail.ca', N'210-2992 Pharetra. Av.', 1358, 3522176153, N'Kieran', N'Robbins', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (431, N'26032266', N'a.odio@yahoo.edu', N'436-2201 Ultrices. St.', 1867, 3516002474, N'Reece', N'Holloway', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (432, N'27690558', N'cum@google.edu', N'P.O. Box 977, 2465 Rutrum Avenue', 2033, 3527464199, N'Quintessa', N'English', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (433, N'41676465', N'ac.eleifend@protonmail.net', N'9744 Ornare, Street', 3086, 3523424062, N'Wing', N'Hines', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (434, N'23472041', N'consectetuer@google.org', N'888-7306 Odio. Ave', 2433, 3534698933, N'Gemma', N'Chaney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (435, N'31996648', N'libero.donec.consectetuer@google.org', N'436-6594 Sed Ave', 1947, 3532184620, N'Baker', N'Morse', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (436, N'34074556', N'donec.egestas@icloud.org', N'527-9493 Ac Road', 1200, 3515240942, N'Jacqueline', N'Alston', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (437, N'27945402', N'in@outlook.ca', N'Ap #633-2451 Eros St.', 3226, 3522076602, N'Kiona', N'Kerr', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (438, N'34770385', N'phasellus@aol.org', N'948-7626 Dolor Rd.', 3248, 3527232822, N'Odessa', N'Baird', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (439, N'40820761', N'molestie.orci@aol.org', N'P.O. Box 768, 510 Nunc Street', 3588, 3526132813, N'Miranda', N'Case', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (440, N'42674383', N'amet.metus@aol.net', N'330-6020 Vitae, Rd.', 2840, 3515716967, N'Alea', N'Morales', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (441, N'23979644', N'cum@aol.couk', N'Ap #352-6834 Luctus St.', 687, 3533183983, N'Kennedy', N'Mueller', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (442, N'37841725', N'pede.nec.ante@aol.org', N'3411 Consequat Road', 989, 3515603970, N'Autumn', N'Hooper', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (443, N'28290942', N'in.hendrerit.consectetuer@google.couk', N'4736 Pellentesque Rd.', 1345, 3539136651, N'Gannon', N'Kim', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (444, N'40157184', N'metus.vivamus@icloud.com', N'Ap #438-8087 Nisi Rd.', 1095, 3533143594, N'Hall', N'Barrera', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (445, N'33972564', N'consectetuer.adipiscing.elit@google.com', N'Ap #445-5397 Cum Road', 1607, 3528935603, N'Shaeleigh', N'Moran', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (446, N'34526990', N'justo@google.org', N'P.O. Box 201, 4041 Scelerisque Rd.', 2616, 3526682231, N'Alma', N'Rios', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (447, N'33730936', N'nunc.quis@google.net', N'248-141 Integer St.', 2309, 3539553078, N'Emi', N'Chavez', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (448, N'34845210', N'odio@google.com', N'2594 In Rd.', 3459, 3534319231, N'Ann', N'Smith', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (449, N'44017286', N'sed.id@aol.org', N'Ap #827-7600 Id Street', 3983, 3531285057, N'Judith', N'Dale', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (450, N'31079945', N'mollis.lectus@google.org', N'P.O. Box 167, 4545 Vulputate St.', 2276, 3519141894, N'Zelenia', N'Carson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (451, N'31360873', N'luctus@icloud.org', N'Ap #989-7666 Est Rd.', 3518, 3524209006, N'Zenia', N'Hampton', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (452, N'30742890', N'a.feugiat@protonmail.com', N'Ap #490-8555 Sit Street', 1415, 3527047509, N'Jayme', N'Mason', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (453, N'25173526', N'nec.quam@yahoo.com', N'9335 Aliquam Avenue', 2272, 3522342994, N'Acton', N'Kemp', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (454, N'38409874', N'sed@yahoo.com', N'Ap #988-3424 Fusce Rd.', 1428, 3523225332, N'Norman', N'Wood', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (455, N'32616787', N'aliquet.vel@outlook.org', N'5294 Aliquam Rd.', 3396, 3527544438, N'Halee', N'Barr', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (456, N'34608305', N'felis.purus@protonmail.couk', N'P.O. Box 266, 6919 Orci Rd.', 623, 3520760934, N'Barclay', N'Donaldson', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (457, N'44254097', N'lacus.pede@hotmail.com', N'308-2760 Adipiscing Av.', 2273, 3519332329, N'Dante', N'Hubbard', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (458, N'44942152', N'non.egestas@yahoo.net', N'Ap #562-6318 Sit Rd.', 2547, 3527041014, N'Kuame', N'Carney', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (459, N'40480049', N'nullam.enim@outlook.net', N'Ap #969-811 Sem, St.', 2245, 3532485764, N'Reuben', N'Mcintyre', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (460, N'34368598', N'varius.et@yahoo.org', N'228-6163 Et, Street', 3253, 3531008638, N'Shad', N'Aguilar', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (461, N'31015694', N'accumsan.convallis@google.com', N'Ap #201-5260 Scelerisque Avenue', 2464, 3523969469, N'Odysseus', N'Gay', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (462, N'35504935', N'consequat@icloud.com', N'704-3362 Fusce Ave', 1351, 3534332578, N'Ronan', N'Pratt', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (463, N'42122424', N'vulputate.risus@google.net', N'P.O. Box 618, 2059 Ut, St.', 2366, 3538793737, N'Paloma', N'Payne', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (464, N'36651335', N'egestas.a@protonmail.com', N'Ap #368-1486 Dolor St.', 3338, 3527822961, N'Omar', N'Kim', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (465, N'33869313', N'egestas.aliquam@protonmail.edu', N'600 Sem Road', 1493, 3520762148, N'Kyle', N'Davis', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (466, N'44474655', N'tristique.pellentesque@yahoo.ca', N'Ap #271-2397 Leo, Ave', 3008, 3518820480, N'Denton', N'Lucas', 1)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (467, N'27067126', N'ante@yahoo.com', N'517-9311 Diam. Rd.', 3026, 3525432239, N'Dorian', N'Davis', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (468, N'33246119', N'eleifend.cras.sed@aol.edu', N'602-2928 Natoque Ave', 164, 3536671392, N'Audra', N'Byrd', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (469, N'30346593', N'ut.pharetra.sed@hotmail.ca', N'P.O. Box 734, 9389 Eleifend, Rd.', 2010, 3522679436, N'Nyssa', N'Moran', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (470, N'41767385', N'eget.massa.suspendisse@icloud.net', N'141-7070 Pharetra. Av.', 2554, 3529375875, N'Odessa', N'Faulkner', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (471, N'34795055', N'non.enim@google.edu', N'727-2990 Orci Rd.', 3466, 3539083407, N'Gary', N'Briggs', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (472, N'43882377', N'nunc.ac@protonmail.org', N'844-4128 Adipiscing St.', 2349, 3529060580, N'Norman', N'Maxwell', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (473, N'30963793', N'eu.tempor@hotmail.com', N'Ap #271-4334 Ornare, Street', 3015, 3518081459, N'Cora', N'Harris', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (474, N'37344198', N'augue.sed@protonmail.org', N'Ap #996-8241 A Ave', 1257, 3537212707, N'Griffin', N'Chaney', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (475, N'38233757', N'ultrices.duis@icloud.com', N'Ap #362-7942 Et, St.', 494, 3525266783, N'Oscar', N'Walters', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (476, N'25519970', N'semper@google.couk', N'241-1352 Lorem Rd.', 1396, 3517952779, N'Janna', N'Atkinson', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (477, N'26265909', N'sagittis.placerat@google.ca', N'P.O. Box 741, 9726 Massa. Rd.', 1915, 3535139260, N'Brett', N'Benjamin', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (478, N'37862079', N'cursus.luctus@icloud.ca', N'5402 Sed Rd.', 3592, 3539276618, N'Lars', N'Christian', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (479, N'38711749', N'et@google.couk', N'612-2049 Ullamcorper Avenue', 3891, 3524354815, N'Otto', N'Wright', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (480, N'32537706', N'erat@aol.ca', N'Ap #442-5061 Nulla Rd.', 2841, 3521438859, N'Josephine', N'Craig', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (481, N'33811056', N'et.arcu.imperdiet@google.net', N'1210 Sociis St.', 3111, 3535157514, N'Clinton', N'Klein', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (482, N'23576331', N'commodo.tincidunt.nibh@hotmail.couk', N'P.O. Box 827, 8413 Egestas Road', 2855, 3520244990, N'Barbara', N'Villarreal', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (483, N'26544048', N'consectetuer.adipiscing@outlook.edu', N'P.O. Box 891, 5073 Taciti Avenue', 581, 3518662956, N'Duncan', N'Rodriquez', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (484, N'36478402', N'dapibus.rutrum@google.edu', N'Ap #491-5889 Vitae, Road', 1262, 3532831383, N'Jacqueline', N'Price', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (485, N'30885848', N'felis.orci@outlook.com', N'8050 Aliquet St.', 975, 3538214171, N'Chastity', N'Hull', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (486, N'37221860', N'ac.feugiat.non@aol.couk', N'Ap #814-3769 Nulla Av.', 3969, 3523106631, N'Devin', N'Stephens', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (487, N'31283283', N'faucibus.id@icloud.org', N'Ap #892-6821 Amet, Ave', 241, 3527076169, N'Camille', N'Donovan', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (488, N'31332468', N'aliquam.iaculis.lacus@icloud.net', N'527-7254 Eros. Rd.', 2870, 3518063690, N'Jacob', N'Hamilton', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (489, N'43441382', N'phasellus.ornare@yahoo.ca', N'Ap #523-4949 Suspendisse St.', 706, 3516706579, N'Elliott', N'Ellison', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (490, N'39657435', N'non.lobortis.quis@icloud.net', N'8676 Felis Road', 838, 3516465681, N'Colton', N'Shaffer', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (491, N'32064532', N'facilisis.eget.ipsum@aol.edu', N'324-250 Quisque Rd.', 139, 3517723795, N'Desiree', N'Shelton', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (492, N'29524137', N'in.consectetuer@protonmail.couk', N'Ap #765-8827 Vulputate, St.', 2592, 3531087893, N'Alea', N'Leon', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (493, N'31942411', N'lobortis.quam.a@icloud.net', N'Ap #835-905 Auctor. Ave', 149, 3536574051, N'Callum', N'Alvarado', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (494, N'25055660', N'parturient.montes@google.org', N'Ap #327-2772 Odio. Road', 1110, 3536588651, N'Louis', N'Lynch', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (495, N'39360769', N'nunc.ac@yahoo.edu', N'144-6508 Egestas Rd.', 918, 3536673644, N'Wing', N'Holmes', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (496, N'33313713', N'neque.sed.dictum@outlook.org', N'Ap #676-9980 Eget, Rd.', 3704, 3525781118, N'Olivia', N'Brown', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (497, N'43589643', N'sapien.cras@yahoo.ca', N'8058 Curabitur Rd.', 1470, 3518708302, N'Roanna', N'Willis', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (498, N'41302287', N'facilisis.non.bibendum@protonmail.couk', N'545-8459 Feugiat St.', 881, 3516859358, N'Remedios', N'Norman', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (499, N'25664173', N'dignissim.lacus@protonmail.org', N'203-4974 Nullam St.', 1295, 3535122097, N'Kuame', N'Haney', 0)
GO
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (500, N'30658020', N'phasellus.libero.mauris@google.couk', N'165-6216 Nulla Road', 1534, 3516782280, N'Beck', N'Bender', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (501, N'15468789', N'pancho@gmail.com', N'Hola', 123, 3516548975, N'Pancho', N'Villa', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (506, N'45244598', N'quilpa@gmail.com', N'De Los Genoveses', 5240, 3513587352, N'Nahuel', N'Quilpatay', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (507, N'45266889', N'nacho@gmail.com', N'Genova', 5000, 351654897, N'Nahuel', N'Kilipatao', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (508, N'45244568', N'nacho@gmail.com', N'222', 5200, 24420558, N'222', N'222', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (509, N'333', N'333@gmail.com', N'333', 333, 333, N'333', N'333', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (510, N'4678912', N'hola@gmail.com', N'hola', 456, 456789, N'hola', N'hola', 0)
INSERT [dbo].[Clientes] ([id_cliente], [dni_cliente], [email], [calle], [altura], [telefono], [nom_cliente], [ape_cliente], [activo]) VALUES (511, N'4678912', N'aa@gmail.com', N'saddsa', 4554, 45564, N'dsd', N'asdsad', 0)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Tickets] ON 

INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (1, CAST(0 AS Decimal(18, 0)), 13, 100.0000, 1, 1)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (2, CAST(5 AS Decimal(18, 0)), 14, 435.0000, 10, 580)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (3, CAST(5 AS Decimal(18, 0)), 15, 61.7500, 1, 600)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (4, CAST(30 AS Decimal(18, 0)), 16, 140.0000, 1, 541)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (5, CAST(30 AS Decimal(18, 0)), 16, 140.0000, 2, 541)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (6, CAST(10 AS Decimal(18, 0)), 17, 450.0000, 10, 587)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (7, CAST(10 AS Decimal(18, 0)), 17, 450.0000, 11, 587)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (8, CAST(0 AS Decimal(18, 0)), 18, 350.0000, 20, 559)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (9, CAST(0 AS Decimal(18, 0)), 18, 350.0000, 19, 559)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (10, CAST(20 AS Decimal(18, 0)), 19, 80.0000, 9, 556)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (11, CAST(20 AS Decimal(18, 0)), 19, 80.0000, 10, 556)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (12, CAST(0 AS Decimal(18, 0)), 21, 100.0000, 5, 605)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (13, CAST(15 AS Decimal(18, 0)), 22, 425.0000, 7, 551)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (14, CAST(15 AS Decimal(18, 0)), 22, 425.0000, 8, 551)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (15, CAST(5 AS Decimal(18, 0)), 23, 95.0000, 13, 605)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (16, CAST(5 AS Decimal(18, 0)), 23, 95.0000, 12, 605)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (17, CAST(10 AS Decimal(18, 0)), 24, 450.0000, 10, 541)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (18, CAST(10 AS Decimal(18, 0)), 24, 450.0000, 9, 541)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (19, CAST(2 AS Decimal(18, 0)), 25, 98.0000, 1, 650)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (20, CAST(2 AS Decimal(18, 0)), 25, 98.0000, 2, 650)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (21, CAST(2 AS Decimal(18, 0)), 26, 98.0000, 1, 650)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (22, CAST(2 AS Decimal(18, 0)), 26, 98.0000, 2, 650)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (23, CAST(2 AS Decimal(18, 0)), 26, 490.0000, 17, 649)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (24, CAST(2 AS Decimal(18, 0)), 26, 490.0000, 10, 649)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (25, CAST(2 AS Decimal(18, 0)), 26, 490.0000, 7, 578)
INSERT [dbo].[Detalle_Tickets] ([id_detalle_ticket], [descuento], [id_ticket], [costo], [id_butaca], [id_funcion]) VALUES (26, CAST(2 AS Decimal(18, 0)), 26, 490.0000, 8, 578)
SET IDENTITY_INSERT [dbo].[Detalle_Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Funciones] ON 

INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (1, 5, CAST(N'2016-08-18T00:00:00.000' AS DateTime), 1263.4000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (2, 10, CAST(N'2019-02-24T00:00:00.000' AS DateTime), 495.0800, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (3, 2, CAST(N'2013-10-24T00:00:00.000' AS DateTime), 690.2900, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (4, 10, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 1639.1800, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (5, 3, CAST(N'2012-06-16T00:00:00.000' AS DateTime), 1175.0900, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (6, 12, CAST(N'2014-07-15T00:00:00.000' AS DateTime), 1746.1200, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (7, 9, CAST(N'2020-08-13T00:00:00.000' AS DateTime), 1293.2600, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (8, 17, CAST(N'2015-09-15T00:00:00.000' AS DateTime), 1823.7600, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (9, 13, CAST(N'2017-12-01T00:00:00.000' AS DateTime), 2341.8900, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (10, 18, CAST(N'2018-03-04T00:00:00.000' AS DateTime), 394.6700, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (11, 3, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 1943.2500, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (12, 7, CAST(N'2020-06-18T00:00:00.000' AS DateTime), 1206.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (13, 9, CAST(N'2012-04-16T00:00:00.000' AS DateTime), 1700.9900, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (14, 12, CAST(N'2010-05-20T00:00:00.000' AS DateTime), 510.5100, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (15, 18, CAST(N'2022-08-27T00:00:00.000' AS DateTime), 1163.2600, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (16, 14, CAST(N'2021-07-01T00:00:00.000' AS DateTime), 748.4300, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (17, 4, CAST(N'2013-07-26T00:00:00.000' AS DateTime), 2317.0500, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (18, 10, CAST(N'2013-12-09T00:00:00.000' AS DateTime), 1193.1800, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (19, 13, CAST(N'2012-12-27T00:00:00.000' AS DateTime), 1843.6700, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (20, 6, CAST(N'2011-05-06T00:00:00.000' AS DateTime), 1976.6700, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (21, 4, CAST(N'2010-04-12T00:00:00.000' AS DateTime), 1745.0500, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (22, 12, CAST(N'2018-10-08T00:00:00.000' AS DateTime), 2256.9800, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (23, 3, CAST(N'2016-07-07T00:00:00.000' AS DateTime), 729.2300, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (24, 12, CAST(N'2018-08-19T00:00:00.000' AS DateTime), 1794.8100, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (25, 6, CAST(N'2020-12-17T00:00:00.000' AS DateTime), 1759.6200, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (26, 9, CAST(N'2022-04-17T00:00:00.000' AS DateTime), 1770.9100, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (27, 11, CAST(N'2010-05-21T00:00:00.000' AS DateTime), 686.6800, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (28, 8, CAST(N'2018-06-01T00:00:00.000' AS DateTime), 487.8900, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (29, 13, CAST(N'2017-02-11T00:00:00.000' AS DateTime), 1446.0400, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (30, 14, CAST(N'2013-04-02T00:00:00.000' AS DateTime), 2430.7600, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (31, 3, CAST(N'2010-06-10T00:00:00.000' AS DateTime), 1599.4500, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (32, 13, CAST(N'2014-08-07T00:00:00.000' AS DateTime), 1948.5400, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (33, 12, CAST(N'2018-04-02T00:00:00.000' AS DateTime), 1149.3600, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (34, 8, CAST(N'2012-08-29T00:00:00.000' AS DateTime), 1137.8500, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (35, 18, CAST(N'2022-08-08T00:00:00.000' AS DateTime), 1339.3800, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (36, 2, CAST(N'2013-11-02T00:00:00.000' AS DateTime), 2390.0600, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (37, 15, CAST(N'2010-01-10T00:00:00.000' AS DateTime), 1105.2700, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (38, 17, CAST(N'2016-03-20T00:00:00.000' AS DateTime), 2355.3300, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (39, 3, CAST(N'2012-06-25T00:00:00.000' AS DateTime), 2355.2400, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (40, 2, CAST(N'2014-10-11T00:00:00.000' AS DateTime), 1829.7200, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (41, 18, CAST(N'2016-09-19T00:00:00.000' AS DateTime), 1790.0400, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (42, 2, CAST(N'2012-05-05T00:00:00.000' AS DateTime), 744.4700, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (43, 2, CAST(N'2020-03-05T00:00:00.000' AS DateTime), 453.1100, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (44, 19, CAST(N'2012-10-10T00:00:00.000' AS DateTime), 1272.9400, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (45, 18, CAST(N'2011-06-05T00:00:00.000' AS DateTime), 2375.6400, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (46, 14, CAST(N'2016-12-23T00:00:00.000' AS DateTime), 516.6500, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (47, 11, CAST(N'2017-11-05T00:00:00.000' AS DateTime), 2313.5300, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (48, 19, CAST(N'2014-12-17T00:00:00.000' AS DateTime), 2124.4200, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (49, 11, CAST(N'2017-06-07T00:00:00.000' AS DateTime), 1937.1100, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (50, 11, CAST(N'2010-11-08T00:00:00.000' AS DateTime), 1329.0600, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (51, 19, CAST(N'2018-12-16T00:00:00.000' AS DateTime), 880.3500, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (52, 11, CAST(N'2021-12-30T00:00:00.000' AS DateTime), 1925.5600, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (53, 20, CAST(N'2011-07-26T00:00:00.000' AS DateTime), 1587.6700, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (54, 12, CAST(N'2013-02-09T00:00:00.000' AS DateTime), 1977.5800, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (55, 15, CAST(N'2014-04-18T00:00:00.000' AS DateTime), 382.6900, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (56, 18, CAST(N'2013-03-30T00:00:00.000' AS DateTime), 500.8300, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (57, 3, CAST(N'2018-04-28T00:00:00.000' AS DateTime), 444.9900, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (58, 3, CAST(N'2019-11-19T00:00:00.000' AS DateTime), 575.7000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (59, 11, CAST(N'2011-06-30T00:00:00.000' AS DateTime), 2327.2000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (60, 16, CAST(N'2019-06-17T00:00:00.000' AS DateTime), 752.2400, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (61, 18, CAST(N'2011-09-11T00:00:00.000' AS DateTime), 1164.4600, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (62, 7, CAST(N'2019-06-18T00:00:00.000' AS DateTime), 1734.7600, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (63, 7, CAST(N'2013-06-07T00:00:00.000' AS DateTime), 2438.7400, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (64, 8, CAST(N'2016-12-20T00:00:00.000' AS DateTime), 2007.9300, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (65, 4, CAST(N'2017-11-18T00:00:00.000' AS DateTime), 1612.1700, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (66, 18, CAST(N'2021-10-02T00:00:00.000' AS DateTime), 1650.5100, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (67, 2, CAST(N'2013-04-25T00:00:00.000' AS DateTime), 940.3400, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (68, 18, CAST(N'2014-09-15T00:00:00.000' AS DateTime), 1685.1600, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (69, 14, CAST(N'2018-05-27T00:00:00.000' AS DateTime), 1620.9700, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (70, 7, CAST(N'2019-05-07T00:00:00.000' AS DateTime), 735.8700, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (71, 15, CAST(N'2017-08-14T00:00:00.000' AS DateTime), 1270.8100, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (72, 9, CAST(N'2016-07-05T00:00:00.000' AS DateTime), 1238.8100, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (73, 6, CAST(N'2013-09-16T00:00:00.000' AS DateTime), 1922.0600, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (74, 15, CAST(N'2016-04-22T00:00:00.000' AS DateTime), 2212.4700, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (75, 4, CAST(N'2011-11-18T00:00:00.000' AS DateTime), 1262.3800, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (76, 2, CAST(N'2013-12-28T00:00:00.000' AS DateTime), 1689.5300, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (77, 1, CAST(N'2022-02-13T00:00:00.000' AS DateTime), 1946.2700, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (78, 5, CAST(N'2013-05-18T00:00:00.000' AS DateTime), 2415.0100, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (79, 8, CAST(N'2014-04-28T00:00:00.000' AS DateTime), 412.9500, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (80, 7, CAST(N'2021-06-23T00:00:00.000' AS DateTime), 2077.9900, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (81, 3, CAST(N'2013-12-24T00:00:00.000' AS DateTime), 1764.0800, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (82, 6, CAST(N'2014-03-18T00:00:00.000' AS DateTime), 1895.0900, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (83, 14, CAST(N'2021-07-13T00:00:00.000' AS DateTime), 2251.5400, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (84, 10, CAST(N'2012-11-06T00:00:00.000' AS DateTime), 1941.2800, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (85, 9, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 2472.8400, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (86, 11, CAST(N'2015-09-05T00:00:00.000' AS DateTime), 457.0400, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (87, 4, CAST(N'2016-05-27T00:00:00.000' AS DateTime), 402.1000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (88, 17, CAST(N'2020-04-11T00:00:00.000' AS DateTime), 2425.4900, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (89, 9, CAST(N'2014-07-30T00:00:00.000' AS DateTime), 1872.1900, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (90, 10, CAST(N'2016-02-13T00:00:00.000' AS DateTime), 1167.8400, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (91, 15, CAST(N'2015-10-10T00:00:00.000' AS DateTime), 448.8200, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (92, 5, CAST(N'2018-09-20T00:00:00.000' AS DateTime), 2473.4500, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (93, 9, CAST(N'2012-12-22T00:00:00.000' AS DateTime), 1743.9900, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (94, 18, CAST(N'2012-10-15T00:00:00.000' AS DateTime), 1410.4200, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (95, 11, CAST(N'2022-04-11T00:00:00.000' AS DateTime), 1541.4800, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (96, 15, CAST(N'2011-04-09T00:00:00.000' AS DateTime), 2410.6800, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (97, 17, CAST(N'2011-05-10T00:00:00.000' AS DateTime), 364.9300, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (98, 16, CAST(N'2017-08-12T00:00:00.000' AS DateTime), 1674.6000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (99, 17, CAST(N'2012-08-14T00:00:00.000' AS DateTime), 1539.9200, 7, 1)
GO
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (100, 4, CAST(N'2017-12-05T00:00:00.000' AS DateTime), 937.9800, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (105, 1, CAST(N'2022-12-12T00:00:00.000' AS DateTime), 1263.4000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (106, 2, CAST(N'2022-12-12T00:00:00.000' AS DateTime), 1263.4000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (107, 5, CAST(N'2023-07-24T00:00:00.000' AS DateTime), 2131.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (108, 4, CAST(N'2022-07-16T00:00:00.000' AS DateTime), 1656.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (109, 1, CAST(N'2023-03-17T00:00:00.000' AS DateTime), 1403.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (110, 7, CAST(N'2022-09-11T00:00:00.000' AS DateTime), 1462.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (111, 7, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 2728.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (112, 9, CAST(N'2023-03-02T00:00:00.000' AS DateTime), 1283.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (113, 10, CAST(N'2021-12-11T00:00:00.000' AS DateTime), 1728.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (114, 8, CAST(N'2022-05-23T00:00:00.000' AS DateTime), 2055.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (115, 2, CAST(N'2022-03-07T00:00:00.000' AS DateTime), 1718.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (116, 5, CAST(N'2022-03-18T00:00:00.000' AS DateTime), 1270.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (117, 18, CAST(N'2022-11-09T00:00:00.000' AS DateTime), 1606.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (118, 8, CAST(N'2023-06-27T00:00:00.000' AS DateTime), 1353.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (119, 18, CAST(N'2022-10-13T00:00:00.000' AS DateTime), 2550.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (120, 11, CAST(N'2022-10-22T00:00:00.000' AS DateTime), 2487.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (121, 16, CAST(N'2022-08-15T00:00:00.000' AS DateTime), 2284.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (122, 7, CAST(N'2022-05-02T00:00:00.000' AS DateTime), 1848.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (123, 15, CAST(N'2023-09-03T00:00:00.000' AS DateTime), 2412.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (124, 14, CAST(N'2023-10-24T00:00:00.000' AS DateTime), 1232.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (125, 8, CAST(N'2022-05-29T00:00:00.000' AS DateTime), 1647.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (126, 10, CAST(N'2022-09-11T00:00:00.000' AS DateTime), 1825.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (127, 7, CAST(N'2022-01-23T00:00:00.000' AS DateTime), 2386.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (128, 9, CAST(N'2022-05-28T00:00:00.000' AS DateTime), 2222.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (129, 4, CAST(N'2022-12-28T00:00:00.000' AS DateTime), 2292.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (130, 18, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 1299.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (131, 19, CAST(N'2022-04-15T00:00:00.000' AS DateTime), 1764.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (132, 18, CAST(N'2022-05-09T00:00:00.000' AS DateTime), 1969.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (133, 12, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 1359.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (134, 8, CAST(N'2023-01-11T00:00:00.000' AS DateTime), 2059.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (135, 6, CAST(N'2023-07-22T00:00:00.000' AS DateTime), 2610.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (136, 8, CAST(N'2023-08-08T00:00:00.000' AS DateTime), 1627.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (137, 3, CAST(N'2022-10-17T00:00:00.000' AS DateTime), 2193.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (138, 17, CAST(N'2023-04-11T00:00:00.000' AS DateTime), 2790.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (139, 16, CAST(N'2022-04-07T00:00:00.000' AS DateTime), 1433.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (140, 10, CAST(N'2022-10-31T00:00:00.000' AS DateTime), 1665.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (141, 19, CAST(N'2022-07-09T00:00:00.000' AS DateTime), 2755.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (142, 1, CAST(N'2023-07-30T00:00:00.000' AS DateTime), 1982.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (143, 19, CAST(N'2021-11-25T00:00:00.000' AS DateTime), 1894.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (144, 5, CAST(N'2021-12-26T00:00:00.000' AS DateTime), 2638.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (145, 6, CAST(N'2022-01-22T00:00:00.000' AS DateTime), 2380.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (146, 19, CAST(N'2022-08-10T00:00:00.000' AS DateTime), 2138.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (147, 16, CAST(N'2023-01-10T00:00:00.000' AS DateTime), 1728.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (148, 3, CAST(N'2022-11-06T00:00:00.000' AS DateTime), 2030.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (149, 9, CAST(N'2023-08-09T00:00:00.000' AS DateTime), 2128.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (150, 16, CAST(N'2023-03-04T00:00:00.000' AS DateTime), 2361.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (151, 11, CAST(N'2023-07-31T00:00:00.000' AS DateTime), 1230.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (152, 10, CAST(N'2022-06-10T00:00:00.000' AS DateTime), 2301.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (153, 9, CAST(N'2023-07-05T00:00:00.000' AS DateTime), 2315.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (154, 14, CAST(N'2023-10-15T00:00:00.000' AS DateTime), 2181.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (155, 19, CAST(N'2023-01-08T00:00:00.000' AS DateTime), 1706.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (156, 11, CAST(N'2022-07-02T00:00:00.000' AS DateTime), 2598.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (157, 13, CAST(N'2022-05-13T00:00:00.000' AS DateTime), 2066.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (158, 7, CAST(N'2022-02-16T00:00:00.000' AS DateTime), 2021.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (159, 6, CAST(N'2022-09-07T00:00:00.000' AS DateTime), 1504.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (160, 17, CAST(N'2023-03-23T00:00:00.000' AS DateTime), 2023.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (161, 4, CAST(N'2023-03-23T00:00:00.000' AS DateTime), 1748.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (162, 17, CAST(N'2023-01-07T00:00:00.000' AS DateTime), 1219.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (163, 8, CAST(N'2022-06-26T00:00:00.000' AS DateTime), 1527.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (164, 7, CAST(N'2023-07-21T00:00:00.000' AS DateTime), 2043.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (165, 12, CAST(N'2021-12-03T00:00:00.000' AS DateTime), 2746.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (166, 16, CAST(N'2023-07-14T00:00:00.000' AS DateTime), 1533.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (167, 17, CAST(N'2023-08-25T00:00:00.000' AS DateTime), 1981.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (168, 8, CAST(N'2022-07-26T00:00:00.000' AS DateTime), 1522.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (169, 3, CAST(N'2022-11-25T00:00:00.000' AS DateTime), 2155.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (170, 14, CAST(N'2022-04-29T00:00:00.000' AS DateTime), 1718.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (171, 11, CAST(N'2023-11-04T00:00:00.000' AS DateTime), 2469.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (172, 6, CAST(N'2023-08-04T00:00:00.000' AS DateTime), 1913.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (173, 16, CAST(N'2022-06-29T00:00:00.000' AS DateTime), 2562.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (174, 5, CAST(N'2022-07-08T00:00:00.000' AS DateTime), 2045.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (175, 6, CAST(N'2022-10-23T00:00:00.000' AS DateTime), 1500.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (176, 4, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 2060.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (177, 10, CAST(N'2022-02-25T00:00:00.000' AS DateTime), 2617.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (178, 9, CAST(N'2022-04-28T00:00:00.000' AS DateTime), 2659.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (179, 7, CAST(N'2023-10-19T00:00:00.000' AS DateTime), 2587.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (180, 5, CAST(N'2023-02-08T00:00:00.000' AS DateTime), 1616.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (181, 2, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1305.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (182, 20, CAST(N'2023-03-08T00:00:00.000' AS DateTime), 2563.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (183, 9, CAST(N'2022-05-22T00:00:00.000' AS DateTime), 2171.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (184, 13, CAST(N'2022-02-18T00:00:00.000' AS DateTime), 2084.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (185, 12, CAST(N'2023-07-24T00:00:00.000' AS DateTime), 2256.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (186, 3, CAST(N'2022-05-04T00:00:00.000' AS DateTime), 2339.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (187, 7, CAST(N'2022-10-13T00:00:00.000' AS DateTime), 1776.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (188, 14, CAST(N'2022-03-05T00:00:00.000' AS DateTime), 1232.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (189, 3, CAST(N'2023-03-11T00:00:00.000' AS DateTime), 2530.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (190, 18, CAST(N'2022-12-04T00:00:00.000' AS DateTime), 1755.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (191, 4, CAST(N'2022-02-07T00:00:00.000' AS DateTime), 2499.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (192, 4, CAST(N'2021-11-21T00:00:00.000' AS DateTime), 2496.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (193, 19, CAST(N'2023-05-18T00:00:00.000' AS DateTime), 2398.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (194, 19, CAST(N'2022-07-22T00:00:00.000' AS DateTime), 1554.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (195, 5, CAST(N'2022-02-24T00:00:00.000' AS DateTime), 1961.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (196, 13, CAST(N'2021-11-12T00:00:00.000' AS DateTime), 2158.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (197, 16, CAST(N'2022-01-12T00:00:00.000' AS DateTime), 1721.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (198, 13, CAST(N'2022-10-14T00:00:00.000' AS DateTime), 2335.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (199, 20, CAST(N'2022-04-28T00:00:00.000' AS DateTime), 2727.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (200, 20, CAST(N'2023-08-26T00:00:00.000' AS DateTime), 1233.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (201, 16, CAST(N'2023-02-21T00:00:00.000' AS DateTime), 1855.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (202, 15, CAST(N'2023-07-05T00:00:00.000' AS DateTime), 1537.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (203, 8, CAST(N'2023-09-24T00:00:00.000' AS DateTime), 2166.0000, 5, 1)
GO
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (204, 4, CAST(N'2022-08-02T00:00:00.000' AS DateTime), 1917.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (205, 12, CAST(N'2022-12-25T00:00:00.000' AS DateTime), 2340.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (206, 2, CAST(N'2022-10-02T00:00:00.000' AS DateTime), 1448.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (207, 9, CAST(N'2023-05-15T00:00:00.000' AS DateTime), 1413.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (208, 11, CAST(N'2022-02-23T00:00:00.000' AS DateTime), 1328.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (209, 19, CAST(N'2023-05-13T00:00:00.000' AS DateTime), 1950.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (210, 8, CAST(N'2022-04-26T00:00:00.000' AS DateTime), 1347.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (211, 15, CAST(N'2021-11-11T00:00:00.000' AS DateTime), 2047.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (212, 6, CAST(N'2023-03-27T00:00:00.000' AS DateTime), 1910.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (213, 2, CAST(N'2022-10-09T00:00:00.000' AS DateTime), 1810.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (214, 15, CAST(N'2022-03-31T00:00:00.000' AS DateTime), 1589.0000, 7, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (215, 18, CAST(N'2023-05-18T00:00:00.000' AS DateTime), 2584.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (216, 20, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 2760.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (217, 3, CAST(N'2021-12-03T00:00:00.000' AS DateTime), 2626.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (218, 2, CAST(N'2022-09-04T00:00:00.000' AS DateTime), 1541.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (219, 5, CAST(N'2021-11-21T00:00:00.000' AS DateTime), 1831.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (220, 10, CAST(N'2021-12-13T00:00:00.000' AS DateTime), 1362.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (221, 15, CAST(N'2023-06-28T00:00:00.000' AS DateTime), 2119.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (222, 10, CAST(N'2022-04-15T00:00:00.000' AS DateTime), 1458.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (223, 2, CAST(N'2021-11-12T00:00:00.000' AS DateTime), 1918.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (224, 11, CAST(N'2022-10-25T00:00:00.000' AS DateTime), 2666.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (225, 8, CAST(N'2022-01-15T00:00:00.000' AS DateTime), 2130.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (226, 2, CAST(N'2022-10-29T00:00:00.000' AS DateTime), 2439.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (227, 20, CAST(N'2022-04-23T00:00:00.000' AS DateTime), 1383.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (228, 11, CAST(N'2023-04-30T00:00:00.000' AS DateTime), 1609.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (229, 11, CAST(N'2022-05-21T00:00:00.000' AS DateTime), 2041.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (230, 11, CAST(N'2023-05-05T00:00:00.000' AS DateTime), 2544.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (231, 6, CAST(N'2023-07-03T00:00:00.000' AS DateTime), 1632.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (232, 4, CAST(N'2022-10-30T00:00:00.000' AS DateTime), 2541.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (233, 13, CAST(N'2022-04-24T00:00:00.000' AS DateTime), 1975.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (234, 20, CAST(N'2022-01-27T00:00:00.000' AS DateTime), 1814.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (235, 5, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 2497.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (236, 17, CAST(N'2023-06-18T00:00:00.000' AS DateTime), 1872.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (237, 7, CAST(N'2023-05-20T00:00:00.000' AS DateTime), 1679.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (238, 10, CAST(N'2021-12-07T00:00:00.000' AS DateTime), 1682.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (239, 13, CAST(N'2023-01-25T00:00:00.000' AS DateTime), 2221.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (240, 10, CAST(N'2022-08-09T00:00:00.000' AS DateTime), 1782.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (241, 17, CAST(N'2023-05-18T00:00:00.000' AS DateTime), 2734.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (242, 1, CAST(N'2021-11-17T00:00:00.000' AS DateTime), 2342.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (243, 20, CAST(N'2023-10-31T00:00:00.000' AS DateTime), 1511.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (244, 7, CAST(N'2022-09-08T00:00:00.000' AS DateTime), 2555.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (245, 6, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 1865.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (246, 6, CAST(N'2021-12-02T00:00:00.000' AS DateTime), 2475.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (247, 4, CAST(N'2023-04-22T00:00:00.000' AS DateTime), 1279.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (248, 7, CAST(N'2021-12-07T00:00:00.000' AS DateTime), 2664.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (249, 20, CAST(N'2023-01-14T00:00:00.000' AS DateTime), 1458.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (250, 18, CAST(N'2023-09-10T00:00:00.000' AS DateTime), 2730.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (251, 2, CAST(N'2023-07-01T00:00:00.000' AS DateTime), 1806.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (252, 6, CAST(N'2023-02-15T00:00:00.000' AS DateTime), 2402.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (253, 14, CAST(N'2022-01-03T00:00:00.000' AS DateTime), 1942.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (254, 17, CAST(N'2023-08-09T00:00:00.000' AS DateTime), 2042.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (255, 14, CAST(N'2022-11-17T00:00:00.000' AS DateTime), 1257.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (256, 11, CAST(N'2022-08-05T00:00:00.000' AS DateTime), 2738.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (257, 12, CAST(N'2022-12-01T00:00:00.000' AS DateTime), 2161.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (258, 16, CAST(N'2023-04-12T00:00:00.000' AS DateTime), 1702.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (259, 6, CAST(N'2023-10-30T00:00:00.000' AS DateTime), 1891.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (260, 13, CAST(N'2021-11-09T00:00:00.000' AS DateTime), 1332.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (261, 16, CAST(N'2023-07-23T00:00:00.000' AS DateTime), 1897.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (262, 10, CAST(N'2022-05-08T00:00:00.000' AS DateTime), 2086.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (263, 5, CAST(N'2023-06-11T00:00:00.000' AS DateTime), 2365.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (264, 15, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1803.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (265, 19, CAST(N'2023-02-22T00:00:00.000' AS DateTime), 2656.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (266, 4, CAST(N'2022-10-04T00:00:00.000' AS DateTime), 1844.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (267, 1, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 2311.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (268, 4, CAST(N'2021-12-26T00:00:00.000' AS DateTime), 2489.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (269, 2, CAST(N'2023-03-11T00:00:00.000' AS DateTime), 1220.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (270, 18, CAST(N'2023-07-04T00:00:00.000' AS DateTime), 2115.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (271, 12, CAST(N'2022-12-28T00:00:00.000' AS DateTime), 2677.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (272, 4, CAST(N'2022-04-05T00:00:00.000' AS DateTime), 2091.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (273, 16, CAST(N'2023-09-11T00:00:00.000' AS DateTime), 1700.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (274, 19, CAST(N'2023-08-16T00:00:00.000' AS DateTime), 2501.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (275, 2, CAST(N'2022-02-09T00:00:00.000' AS DateTime), 1756.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (276, 9, CAST(N'2023-06-22T00:00:00.000' AS DateTime), 2102.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (277, 15, CAST(N'2022-10-29T00:00:00.000' AS DateTime), 1909.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (278, 17, CAST(N'2023-07-27T00:00:00.000' AS DateTime), 2621.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (279, 16, CAST(N'2023-02-14T00:00:00.000' AS DateTime), 2480.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (280, 7, CAST(N'2022-10-05T00:00:00.000' AS DateTime), 2646.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (281, 6, CAST(N'2023-03-30T00:00:00.000' AS DateTime), 1786.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (282, 20, CAST(N'2023-06-06T00:00:00.000' AS DateTime), 1300.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (283, 9, CAST(N'2023-10-06T00:00:00.000' AS DateTime), 1826.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (284, 6, CAST(N'2022-08-14T00:00:00.000' AS DateTime), 2644.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (285, 6, CAST(N'2023-04-05T00:00:00.000' AS DateTime), 1633.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (286, 12, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 2035.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (287, 3, CAST(N'2023-07-27T00:00:00.000' AS DateTime), 2696.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (288, 11, CAST(N'2022-03-04T00:00:00.000' AS DateTime), 2653.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (289, 2, CAST(N'2022-11-24T00:00:00.000' AS DateTime), 1785.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (290, 2, CAST(N'2023-11-03T00:00:00.000' AS DateTime), 2654.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (291, 6, CAST(N'2022-05-03T00:00:00.000' AS DateTime), 2357.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (292, 7, CAST(N'2022-07-15T00:00:00.000' AS DateTime), 2522.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (293, 4, CAST(N'2022-08-08T00:00:00.000' AS DateTime), 2216.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (294, 18, CAST(N'2023-10-22T00:00:00.000' AS DateTime), 1484.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (295, 6, CAST(N'2022-02-04T00:00:00.000' AS DateTime), 1921.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (296, 10, CAST(N'2022-06-23T00:00:00.000' AS DateTime), 2481.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (297, 6, CAST(N'2022-12-08T00:00:00.000' AS DateTime), 2029.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (298, 19, CAST(N'2022-10-19T00:00:00.000' AS DateTime), 1404.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (299, 14, CAST(N'2023-08-24T00:00:00.000' AS DateTime), 1669.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (300, 1, CAST(N'2023-04-14T00:00:00.000' AS DateTime), 1763.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (301, 18, CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1913.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (302, 1, CAST(N'2023-01-08T00:00:00.000' AS DateTime), 2732.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (303, 13, CAST(N'2022-10-09T00:00:00.000' AS DateTime), 1377.0000, 8, 1)
GO
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (304, 8, CAST(N'2021-11-22T00:00:00.000' AS DateTime), 2162.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (305, 18, CAST(N'2022-04-16T00:00:00.000' AS DateTime), 1339.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (306, 9, CAST(N'2023-06-24T00:00:00.000' AS DateTime), 2156.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (307, 15, CAST(N'2023-09-03T00:00:00.000' AS DateTime), 1485.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (308, 8, CAST(N'2023-09-26T00:00:00.000' AS DateTime), 1592.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (309, 15, CAST(N'2023-01-28T00:00:00.000' AS DateTime), 1466.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (310, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1469.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (311, 9, CAST(N'2022-07-30T00:00:00.000' AS DateTime), 2042.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (312, 1, CAST(N'2022-01-10T00:00:00.000' AS DateTime), 1462.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (313, 13, CAST(N'2022-05-06T00:00:00.000' AS DateTime), 1630.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (314, 17, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1628.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (315, 13, CAST(N'2022-01-27T00:00:00.000' AS DateTime), 1361.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (316, 9, CAST(N'2021-11-26T00:00:00.000' AS DateTime), 2182.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (317, 6, CAST(N'2022-07-02T00:00:00.000' AS DateTime), 1466.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (318, 19, CAST(N'2023-06-11T00:00:00.000' AS DateTime), 2406.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (319, 15, CAST(N'2023-06-22T00:00:00.000' AS DateTime), 2062.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (320, 14, CAST(N'2022-04-03T00:00:00.000' AS DateTime), 2215.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (321, 20, CAST(N'2023-01-22T00:00:00.000' AS DateTime), 2417.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (322, 13, CAST(N'2021-12-04T00:00:00.000' AS DateTime), 2493.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (323, 2, CAST(N'2023-05-15T00:00:00.000' AS DateTime), 1241.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (324, 14, CAST(N'2023-04-05T00:00:00.000' AS DateTime), 1541.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (325, 5, CAST(N'2023-05-19T00:00:00.000' AS DateTime), 1263.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (326, 14, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 2373.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (327, 16, CAST(N'2023-06-03T00:00:00.000' AS DateTime), 2118.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (328, 14, CAST(N'2022-03-23T00:00:00.000' AS DateTime), 2597.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (329, 18, CAST(N'2022-12-10T00:00:00.000' AS DateTime), 1232.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (330, 8, CAST(N'2022-10-14T00:00:00.000' AS DateTime), 2377.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (331, 12, CAST(N'2022-01-13T00:00:00.000' AS DateTime), 2294.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (332, 14, CAST(N'2022-06-24T00:00:00.000' AS DateTime), 1396.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (333, 3, CAST(N'2023-08-01T00:00:00.000' AS DateTime), 1838.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (334, 20, CAST(N'2023-09-02T00:00:00.000' AS DateTime), 1768.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (335, 2, CAST(N'2023-01-26T00:00:00.000' AS DateTime), 1280.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (336, 14, CAST(N'2022-12-18T00:00:00.000' AS DateTime), 1979.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (337, 13, CAST(N'2022-03-19T00:00:00.000' AS DateTime), 2573.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (338, 1, CAST(N'2023-08-07T00:00:00.000' AS DateTime), 2722.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (339, 6, CAST(N'2023-04-26T00:00:00.000' AS DateTime), 1773.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (340, 7, CAST(N'2022-02-28T00:00:00.000' AS DateTime), 1977.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (341, 4, CAST(N'2022-02-10T00:00:00.000' AS DateTime), 2162.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (342, 17, CAST(N'2023-10-09T00:00:00.000' AS DateTime), 1952.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (343, 16, CAST(N'2022-01-19T00:00:00.000' AS DateTime), 2566.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (344, 4, CAST(N'2023-01-20T00:00:00.000' AS DateTime), 1819.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (345, 2, CAST(N'2023-01-22T00:00:00.000' AS DateTime), 1225.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (346, 16, CAST(N'2023-08-17T00:00:00.000' AS DateTime), 1546.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (347, 4, CAST(N'2022-08-05T00:00:00.000' AS DateTime), 2087.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (348, 7, CAST(N'2022-06-08T00:00:00.000' AS DateTime), 2388.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (349, 14, CAST(N'2021-12-23T00:00:00.000' AS DateTime), 2586.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (350, 6, CAST(N'2022-07-15T00:00:00.000' AS DateTime), 1627.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (351, 6, CAST(N'2022-04-08T00:00:00.000' AS DateTime), 2756.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (352, 7, CAST(N'2022-08-08T00:00:00.000' AS DateTime), 1211.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (353, 17, CAST(N'2022-06-29T00:00:00.000' AS DateTime), 1978.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (354, 18, CAST(N'2022-08-01T00:00:00.000' AS DateTime), 2374.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (355, 8, CAST(N'2022-11-04T00:00:00.000' AS DateTime), 1511.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (356, 20, CAST(N'2022-06-27T00:00:00.000' AS DateTime), 2129.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (357, 11, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 1231.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (358, 3, CAST(N'2022-10-01T00:00:00.000' AS DateTime), 1216.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (359, 15, CAST(N'2022-03-13T00:00:00.000' AS DateTime), 1223.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (360, 7, CAST(N'2023-07-18T00:00:00.000' AS DateTime), 1374.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (361, 2, CAST(N'2023-09-14T00:00:00.000' AS DateTime), 1599.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (362, 3, CAST(N'2022-08-12T00:00:00.000' AS DateTime), 2750.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (363, 2, CAST(N'2023-10-05T00:00:00.000' AS DateTime), 2359.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (364, 11, CAST(N'2022-06-07T00:00:00.000' AS DateTime), 1323.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (365, 2, CAST(N'2022-08-15T00:00:00.000' AS DateTime), 1950.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (366, 13, CAST(N'2023-04-02T00:00:00.000' AS DateTime), 2264.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (367, 6, CAST(N'2022-04-24T00:00:00.000' AS DateTime), 2149.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (368, 12, CAST(N'2023-07-27T00:00:00.000' AS DateTime), 2141.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (369, 13, CAST(N'2022-06-13T00:00:00.000' AS DateTime), 2246.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (370, 16, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 2730.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (371, 10, CAST(N'2022-09-14T00:00:00.000' AS DateTime), 1792.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (372, 17, CAST(N'2023-01-16T00:00:00.000' AS DateTime), 1521.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (373, 13, CAST(N'2023-03-07T00:00:00.000' AS DateTime), 2045.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (374, 12, CAST(N'2022-03-29T00:00:00.000' AS DateTime), 1352.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (375, 3, CAST(N'2023-04-13T00:00:00.000' AS DateTime), 2013.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (376, 7, CAST(N'2023-08-19T00:00:00.000' AS DateTime), 1379.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (377, 8, CAST(N'2022-06-03T00:00:00.000' AS DateTime), 2780.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (378, 4, CAST(N'2023-10-20T00:00:00.000' AS DateTime), 2352.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (379, 1, CAST(N'2023-07-24T00:00:00.000' AS DateTime), 1492.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (380, 13, CAST(N'2023-09-07T00:00:00.000' AS DateTime), 2222.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (381, 18, CAST(N'2022-12-06T00:00:00.000' AS DateTime), 2298.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (382, 4, CAST(N'2022-08-10T00:00:00.000' AS DateTime), 1383.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (383, 6, CAST(N'2021-12-13T00:00:00.000' AS DateTime), 1630.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (384, 18, CAST(N'2023-09-08T00:00:00.000' AS DateTime), 1447.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (385, 15, CAST(N'2022-03-24T00:00:00.000' AS DateTime), 1274.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (386, 16, CAST(N'2022-01-20T00:00:00.000' AS DateTime), 1540.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (387, 9, CAST(N'2023-02-08T00:00:00.000' AS DateTime), 1201.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (388, 11, CAST(N'2022-01-11T00:00:00.000' AS DateTime), 2237.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (389, 7, CAST(N'2023-03-23T00:00:00.000' AS DateTime), 2163.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (390, 6, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 2173.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (391, 5, CAST(N'2022-11-16T00:00:00.000' AS DateTime), 2617.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (392, 14, CAST(N'2023-09-17T00:00:00.000' AS DateTime), 2092.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (393, 3, CAST(N'2022-03-04T00:00:00.000' AS DateTime), 1790.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (394, 12, CAST(N'2022-05-11T00:00:00.000' AS DateTime), 2600.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (395, 3, CAST(N'2023-02-18T00:00:00.000' AS DateTime), 1886.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (396, 8, CAST(N'2023-09-07T00:00:00.000' AS DateTime), 2091.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (397, 4, CAST(N'2022-09-04T00:00:00.000' AS DateTime), 1688.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (398, 16, CAST(N'2022-12-17T00:00:00.000' AS DateTime), 1491.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (399, 11, CAST(N'2022-06-03T00:00:00.000' AS DateTime), 1540.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (400, 5, CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1275.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (401, 8, CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2473.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (402, 18, CAST(N'2022-08-08T00:00:00.000' AS DateTime), 1978.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (403, 17, CAST(N'2023-09-26T00:00:00.000' AS DateTime), 1378.0000, 1, 1)
GO
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (404, 2, CAST(N'2023-05-01T00:00:00.000' AS DateTime), 2143.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (405, 15, CAST(N'2023-03-10T00:00:00.000' AS DateTime), 1233.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (406, 15, CAST(N'2023-07-27T00:00:00.000' AS DateTime), 1546.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (407, 3, CAST(N'2023-05-01T00:00:00.000' AS DateTime), 2634.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (408, 14, CAST(N'2023-05-24T00:00:00.000' AS DateTime), 1944.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (409, 7, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 1549.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (410, 3, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 1518.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (411, 6, CAST(N'2022-04-28T00:00:00.000' AS DateTime), 1704.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (412, 5, CAST(N'2022-09-27T00:00:00.000' AS DateTime), 2319.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (413, 7, CAST(N'2022-02-27T00:00:00.000' AS DateTime), 2341.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (414, 8, CAST(N'2023-09-10T00:00:00.000' AS DateTime), 1865.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (415, 10, CAST(N'2022-09-09T00:00:00.000' AS DateTime), 1908.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (416, 7, CAST(N'2023-05-19T00:00:00.000' AS DateTime), 1648.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (417, 4, CAST(N'2022-11-04T00:00:00.000' AS DateTime), 1503.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (418, 12, CAST(N'2023-08-10T00:00:00.000' AS DateTime), 2474.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (419, 5, CAST(N'2023-07-03T00:00:00.000' AS DateTime), 2033.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (420, 15, CAST(N'2023-10-29T00:00:00.000' AS DateTime), 2205.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (421, 17, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 1495.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (422, 7, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 1460.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (423, 10, CAST(N'2022-11-30T00:00:00.000' AS DateTime), 2349.0000, 5, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (424, 5, CAST(N'2023-11-03T00:00:00.000' AS DateTime), 2131.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (425, 8, CAST(N'2022-04-07T00:00:00.000' AS DateTime), 1611.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (426, 1, CAST(N'2022-07-01T00:00:00.000' AS DateTime), 1728.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (427, 4, CAST(N'2022-08-25T00:00:00.000' AS DateTime), 1396.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (428, 7, CAST(N'2023-09-16T00:00:00.000' AS DateTime), 2660.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (429, 19, CAST(N'2023-08-18T00:00:00.000' AS DateTime), 1988.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (430, 18, CAST(N'2022-11-30T00:00:00.000' AS DateTime), 1751.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (431, 13, CAST(N'2022-04-06T00:00:00.000' AS DateTime), 1927.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (432, 6, CAST(N'2022-05-24T00:00:00.000' AS DateTime), 1522.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (433, 15, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 1997.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (434, 7, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 1252.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (435, 12, CAST(N'2022-06-24T00:00:00.000' AS DateTime), 2756.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (436, 5, CAST(N'2021-12-06T00:00:00.000' AS DateTime), 1568.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (437, 2, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 2643.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (438, 6, CAST(N'2022-09-25T00:00:00.000' AS DateTime), 1846.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (439, 9, CAST(N'2022-05-31T00:00:00.000' AS DateTime), 1203.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (440, 14, CAST(N'2023-09-01T00:00:00.000' AS DateTime), 2766.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (441, 15, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 1712.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (442, 8, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 1367.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (443, 18, CAST(N'2021-11-30T00:00:00.000' AS DateTime), 2243.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (444, 16, CAST(N'2022-10-05T00:00:00.000' AS DateTime), 1744.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (445, 11, CAST(N'2021-12-28T00:00:00.000' AS DateTime), 1312.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (446, 5, CAST(N'2022-12-20T00:00:00.000' AS DateTime), 2397.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (447, 14, CAST(N'2022-06-26T00:00:00.000' AS DateTime), 2429.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (448, 2, CAST(N'2023-01-20T00:00:00.000' AS DateTime), 2521.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (449, 20, CAST(N'2023-05-21T00:00:00.000' AS DateTime), 1422.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (450, 17, CAST(N'2022-06-05T00:00:00.000' AS DateTime), 1317.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (451, 19, CAST(N'2022-11-20T00:00:00.000' AS DateTime), 1430.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (452, 3, CAST(N'2022-03-27T00:00:00.000' AS DateTime), 1539.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (453, 6, CAST(N'2023-02-12T00:00:00.000' AS DateTime), 1417.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (454, 10, CAST(N'2023-07-06T00:00:00.000' AS DateTime), 1511.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (455, 2, CAST(N'2023-02-19T00:00:00.000' AS DateTime), 2320.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (456, 6, CAST(N'2021-12-02T00:00:00.000' AS DateTime), 1659.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (457, 11, CAST(N'2023-09-30T00:00:00.000' AS DateTime), 1301.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (458, 18, CAST(N'2022-11-07T00:00:00.000' AS DateTime), 1534.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (459, 16, CAST(N'2022-12-16T00:00:00.000' AS DateTime), 2303.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (460, 6, CAST(N'2022-06-12T00:00:00.000' AS DateTime), 2481.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (461, 14, CAST(N'2022-05-11T00:00:00.000' AS DateTime), 2005.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (462, 17, CAST(N'2022-10-24T00:00:00.000' AS DateTime), 1347.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (463, 9, CAST(N'2022-10-18T00:00:00.000' AS DateTime), 2027.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (464, 2, CAST(N'2023-02-22T00:00:00.000' AS DateTime), 1302.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (465, 11, CAST(N'2023-06-04T00:00:00.000' AS DateTime), 1416.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (466, 10, CAST(N'2023-02-21T00:00:00.000' AS DateTime), 2564.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (467, 6, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 1563.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (468, 5, CAST(N'2023-09-24T00:00:00.000' AS DateTime), 1631.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (469, 9, CAST(N'2022-06-15T00:00:00.000' AS DateTime), 1724.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (470, 18, CAST(N'2023-10-22T00:00:00.000' AS DateTime), 2487.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (471, 9, CAST(N'2022-03-08T00:00:00.000' AS DateTime), 1252.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (472, 9, CAST(N'2022-01-25T00:00:00.000' AS DateTime), 1372.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (473, 9, CAST(N'2022-04-07T00:00:00.000' AS DateTime), 1240.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (474, 11, CAST(N'2022-06-02T00:00:00.000' AS DateTime), 1332.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (475, 8, CAST(N'2022-06-30T00:00:00.000' AS DateTime), 1344.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (476, 7, CAST(N'2023-04-24T00:00:00.000' AS DateTime), 2746.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (477, 7, CAST(N'2021-12-17T00:00:00.000' AS DateTime), 1530.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (478, 13, CAST(N'2023-07-16T00:00:00.000' AS DateTime), 2793.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (479, 15, CAST(N'2022-09-07T00:00:00.000' AS DateTime), 2154.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (480, 2, CAST(N'2022-04-10T00:00:00.000' AS DateTime), 2643.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (481, 9, CAST(N'2023-09-13T00:00:00.000' AS DateTime), 2029.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (482, 17, CAST(N'2022-01-15T00:00:00.000' AS DateTime), 1923.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (483, 16, CAST(N'2023-03-25T00:00:00.000' AS DateTime), 2512.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (484, 4, CAST(N'2023-11-04T00:00:00.000' AS DateTime), 1256.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (485, 17, CAST(N'2022-10-12T00:00:00.000' AS DateTime), 2551.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (486, 6, CAST(N'2023-08-13T00:00:00.000' AS DateTime), 2737.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (487, 19, CAST(N'2022-03-24T00:00:00.000' AS DateTime), 1257.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (488, 16, CAST(N'2023-03-09T00:00:00.000' AS DateTime), 1237.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (489, 16, CAST(N'2022-09-10T00:00:00.000' AS DateTime), 1450.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (490, 3, CAST(N'2021-12-22T00:00:00.000' AS DateTime), 2628.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (491, 7, CAST(N'2022-02-19T00:00:00.000' AS DateTime), 2750.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (492, 6, CAST(N'2022-07-31T00:00:00.000' AS DateTime), 1748.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (493, 9, CAST(N'2022-10-19T00:00:00.000' AS DateTime), 1697.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (494, 9, CAST(N'2022-02-10T00:00:00.000' AS DateTime), 2696.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (495, 15, CAST(N'2022-12-21T00:00:00.000' AS DateTime), 2249.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (496, 16, CAST(N'2023-09-03T00:00:00.000' AS DateTime), 2566.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (497, 19, CAST(N'2023-02-06T00:00:00.000' AS DateTime), 1796.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (498, 1, CAST(N'2022-08-05T00:00:00.000' AS DateTime), 2482.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (499, 9, CAST(N'2022-07-09T00:00:00.000' AS DateTime), 2493.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (500, 14, CAST(N'2023-09-14T00:00:00.000' AS DateTime), 1559.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (501, 13, CAST(N'2021-11-20T00:00:00.000' AS DateTime), 1668.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (502, 2, CAST(N'2023-01-09T00:00:00.000' AS DateTime), 1855.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (503, 7, CAST(N'2023-04-01T00:00:00.000' AS DateTime), 1657.0000, 6, 1)
GO
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (504, 14, CAST(N'2022-11-16T00:00:00.000' AS DateTime), 1420.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (505, 19, CAST(N'2022-10-20T00:00:00.000' AS DateTime), 1955.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (506, 17, CAST(N'2022-03-03T00:00:00.000' AS DateTime), 2081.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (507, 3, CAST(N'2022-08-20T00:00:00.000' AS DateTime), 1782.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (508, 11, CAST(N'2023-05-15T00:00:00.000' AS DateTime), 1252.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (509, 16, CAST(N'2021-12-08T00:00:00.000' AS DateTime), 2095.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (510, 13, CAST(N'2023-04-12T00:00:00.000' AS DateTime), 2001.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (511, 10, CAST(N'2022-02-20T00:00:00.000' AS DateTime), 1438.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (512, 9, CAST(N'2021-12-15T00:00:00.000' AS DateTime), 2230.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (513, 18, CAST(N'2022-04-19T00:00:00.000' AS DateTime), 1771.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (514, 4, CAST(N'2023-07-14T00:00:00.000' AS DateTime), 2204.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (515, 11, CAST(N'2022-07-04T00:00:00.000' AS DateTime), 2434.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (516, 10, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 2723.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (517, 8, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2558.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (518, 12, CAST(N'2022-05-10T00:00:00.000' AS DateTime), 1921.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (519, 14, CAST(N'2023-04-11T00:00:00.000' AS DateTime), 1953.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (520, 20, CAST(N'2023-07-11T00:00:00.000' AS DateTime), 2061.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (521, 16, CAST(N'2023-01-07T00:00:00.000' AS DateTime), 2707.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (522, 3, CAST(N'2023-10-04T00:00:00.000' AS DateTime), 1651.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (523, 2, CAST(N'2022-12-06T00:00:00.000' AS DateTime), 2697.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (524, 19, CAST(N'2021-12-29T00:00:00.000' AS DateTime), 2569.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (525, 18, CAST(N'2023-01-14T00:00:00.000' AS DateTime), 1693.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (526, 13, CAST(N'2022-09-15T00:00:00.000' AS DateTime), 2139.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (527, 7, CAST(N'2023-05-27T00:00:00.000' AS DateTime), 2728.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (528, 12, CAST(N'2023-09-15T00:00:00.000' AS DateTime), 1822.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (529, 15, CAST(N'2023-10-22T00:00:00.000' AS DateTime), 1985.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (530, 15, CAST(N'2023-09-12T00:00:00.000' AS DateTime), 2621.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (531, 3, CAST(N'2022-04-01T00:00:00.000' AS DateTime), 2303.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (532, 13, CAST(N'2022-12-08T00:00:00.000' AS DateTime), 2528.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (533, 9, CAST(N'2023-05-23T00:00:00.000' AS DateTime), 1844.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (534, 3, CAST(N'2022-06-14T00:00:00.000' AS DateTime), 1857.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (535, 7, CAST(N'2021-12-19T00:00:00.000' AS DateTime), 2336.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (536, 5, CAST(N'2022-02-06T00:00:00.000' AS DateTime), 1667.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (537, 20, CAST(N'2022-06-11T00:00:00.000' AS DateTime), 2169.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (538, 19, CAST(N'2023-08-16T00:00:00.000' AS DateTime), 1206.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (539, 15, CAST(N'2021-11-24T00:00:00.000' AS DateTime), 2047.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (540, 4, CAST(N'2022-07-03T00:00:00.000' AS DateTime), 2298.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (541, 18, CAST(N'2023-06-22T00:00:00.000' AS DateTime), 2538.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (542, 18, CAST(N'2023-03-23T00:00:00.000' AS DateTime), 1337.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (543, 6, CAST(N'2022-10-18T00:00:00.000' AS DateTime), 1708.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (544, 17, CAST(N'2022-09-10T00:00:00.000' AS DateTime), 2637.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (545, 15, CAST(N'2023-06-26T00:00:00.000' AS DateTime), 2672.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (546, 14, CAST(N'2023-02-20T00:00:00.000' AS DateTime), 2424.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (547, 16, CAST(N'2022-07-28T00:00:00.000' AS DateTime), 1459.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (548, 19, CAST(N'2022-10-26T00:00:00.000' AS DateTime), 1462.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (549, 14, CAST(N'2022-03-15T00:00:00.000' AS DateTime), 1631.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (550, 16, CAST(N'2023-03-05T00:00:00.000' AS DateTime), 2184.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (551, 19, CAST(N'2023-02-26T00:00:00.000' AS DateTime), 1245.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (552, 13, CAST(N'2022-11-11T00:00:00.000' AS DateTime), 1540.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (553, 13, CAST(N'2022-08-29T00:00:00.000' AS DateTime), 1786.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (554, 7, CAST(N'2022-02-04T00:00:00.000' AS DateTime), 2318.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (555, 16, CAST(N'2022-05-25T00:00:00.000' AS DateTime), 2555.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (556, 2, CAST(N'2023-08-20T00:00:00.000' AS DateTime), 2289.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (557, 17, CAST(N'2022-02-22T00:00:00.000' AS DateTime), 1767.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (558, 5, CAST(N'2021-12-28T00:00:00.000' AS DateTime), 2049.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (559, 2, CAST(N'2023-03-28T00:00:00.000' AS DateTime), 2411.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (560, 2, CAST(N'2022-09-13T00:00:00.000' AS DateTime), 2358.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (561, 13, CAST(N'2022-10-18T00:00:00.000' AS DateTime), 1471.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (562, 13, CAST(N'2022-01-31T00:00:00.000' AS DateTime), 1943.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (563, 10, CAST(N'2022-06-04T00:00:00.000' AS DateTime), 1733.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (564, 14, CAST(N'2023-07-24T00:00:00.000' AS DateTime), 2766.0000, 7, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (565, 12, CAST(N'2021-11-14T00:00:00.000' AS DateTime), 2578.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (566, 17, CAST(N'2023-09-20T00:00:00.000' AS DateTime), 2486.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (567, 6, CAST(N'2023-02-20T00:00:00.000' AS DateTime), 1530.0000, 1, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (568, 18, CAST(N'2023-05-21T00:00:00.000' AS DateTime), 1480.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (569, 11, CAST(N'2022-01-21T00:00:00.000' AS DateTime), 2266.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (570, 17, CAST(N'2022-09-28T00:00:00.000' AS DateTime), 2518.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (571, 19, CAST(N'2023-07-08T00:00:00.000' AS DateTime), 1749.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (572, 6, CAST(N'2021-11-10T00:00:00.000' AS DateTime), 2662.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (573, 20, CAST(N'2022-05-20T00:00:00.000' AS DateTime), 1713.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (574, 1, CAST(N'2022-05-13T00:00:00.000' AS DateTime), 1796.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (576, 12, CAST(N'2023-08-22T00:00:00.000' AS DateTime), 1632.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (577, 4, CAST(N'2023-02-16T00:00:00.000' AS DateTime), 2283.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (578, 3, CAST(N'2023-02-07T00:00:00.000' AS DateTime), 2100.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (579, 13, CAST(N'2022-12-10T00:00:00.000' AS DateTime), 1945.0000, 8, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (580, 6, CAST(N'2023-05-04T00:00:00.000' AS DateTime), 1217.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (581, 19, CAST(N'2022-02-13T00:00:00.000' AS DateTime), 1239.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (582, 17, CAST(N'2022-02-09T00:00:00.000' AS DateTime), 2780.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (583, 11, CAST(N'2023-10-27T00:00:00.000' AS DateTime), 2576.0000, 2, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (584, 10, CAST(N'2023-03-12T00:00:00.000' AS DateTime), 2054.0000, 3, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (585, 15, CAST(N'2022-05-10T00:00:00.000' AS DateTime), 1941.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (586, 7, CAST(N'2023-05-12T00:00:00.000' AS DateTime), 2710.0000, 7, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (587, 10, CAST(N'2023-02-10T00:00:00.000' AS DateTime), 1578.0000, 3, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (588, 6, CAST(N'2023-08-16T00:00:00.000' AS DateTime), 1797.0000, 4, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (589, 18, CAST(N'2022-07-02T00:00:00.000' AS DateTime), 1924.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (590, 4, CAST(N'2022-10-26T00:00:00.000' AS DateTime), 2570.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (591, 15, CAST(N'2022-05-26T00:00:00.000' AS DateTime), 2046.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (592, 16, CAST(N'2022-10-17T00:00:00.000' AS DateTime), 1498.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (593, 2, CAST(N'2022-01-16T00:00:00.000' AS DateTime), 1945.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (594, 18, CAST(N'2022-02-06T00:00:00.000' AS DateTime), 2366.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (595, 12, CAST(N'2023-06-10T00:00:00.000' AS DateTime), 2604.0000, 2, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (596, 2, CAST(N'2023-01-08T00:00:00.000' AS DateTime), 2779.0000, 7, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (597, 13, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 2038.0000, 4, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (598, 12, CAST(N'2022-10-23T00:00:00.000' AS DateTime), 1828.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (599, 8, CAST(N'2021-12-20T00:00:00.000' AS DateTime), 1710.0000, 7, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (600, 18, CAST(N'2023-08-02T00:00:00.000' AS DateTime), 1395.0000, 5, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (601, 18, CAST(N'2022-10-13T00:00:00.000' AS DateTime), 1697.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (602, 6, CAST(N'2021-12-15T00:00:00.000' AS DateTime), 1236.0000, 2, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (604, 12, CAST(N'2022-05-06T00:00:00.000' AS DateTime), 1729.0000, 6, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (605, 1, CAST(N'2023-04-15T00:00:00.000' AS DateTime), 1682.0000, 5, 0)
GO
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (606, 5, CAST(N'2022-09-22T00:00:00.000' AS DateTime), 2729.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (612, 5, CAST(N'2022-11-11T00:20:44.080' AS DateTime), 420.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (616, 1, CAST(N'2022-11-13T14:04:42.940' AS DateTime), 100.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (619, 1, CAST(N'2022-11-13T14:22:11.373' AS DateTime), 1.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (625, 4, CAST(N'2022-11-14T19:49:22.457' AS DateTime), 500.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (627, 5, CAST(N'2022-11-24T22:01:49.000' AS DateTime), 500.0000, 1, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (628, 9, CAST(N'2022-11-24T00:00:00.000' AS DateTime), 200.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (629, 1, CAST(N'2022-11-14T22:05:31.267' AS DateTime), 555.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (630, 6, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 5555.0000, 4, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (631, 8, CAST(N'2022-11-23T00:00:00.000' AS DateTime), 555.0000, 4, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (633, 1, CAST(N'2022-11-01T22:14:36.000' AS DateTime), 500.0000, 5, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (634, 15, CAST(N'2022-11-19T22:15:37.000' AS DateTime), 1000.0000, 8, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (635, 5, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 650.0000, 8, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (636, 5, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 555.0000, 5, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (637, 7, CAST(N'2022-11-14T22:16:55.997' AS DateTime), 5000.0000, 4, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (638, 5, CAST(N'2022-11-18T00:00:00.000' AS DateTime), 5000.0000, 1, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (639, 2, CAST(N'2022-11-25T00:00:00.000' AS DateTime), 100.0000, 1, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (640, 1, CAST(N'2022-11-25T19:24:38.000' AS DateTime), 600.0000, 1, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (641, 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 500.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (642, 1, CAST(N'2022-11-25T19:25:22.000' AS DateTime), 500.0000, 1, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (643, 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 500.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (644, 1, CAST(N'2022-11-25T00:00:00.000' AS DateTime), 500.0000, 1, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (645, 1, CAST(N'2022-11-16T19:26:38.000' AS DateTime), 500.0000, 1, 0)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (646, 1, CAST(N'2022-11-16T00:00:00.000' AS DateTime), 500.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (647, 4, CAST(N'2022-11-27T00:00:00.000' AS DateTime), 600.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (648, 4, CAST(N'2022-11-29T00:00:00.000' AS DateTime), 600.0000, 3, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (649, 18, CAST(N'2022-11-29T00:00:00.000' AS DateTime), 650.0000, 1, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [fecha_hora], [pre_unitario], [id_sala], [activo]) VALUES (650, 20, CAST(N'2022-11-19T00:00:00.000' AS DateTime), 200.0000, 1, 1)
SET IDENTITY_INSERT [dbo].[Funciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([id_usuario], [usuario], [contras]) VALUES (1, N'admin', N'1234')
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Peliculas] ON 

INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (1, N'Cadena Perpetua', 145, 1)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (2, N'El padrino', 175, 2)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (3, N'El caballero oscuro', 152, 3)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (4, N'12 hombres sin piedad', 96, 4)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (5, N'La lista de Schindler', 205, 5)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (6, N'El señor de los anillos: El retorno del rey', 178, 6)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (7, N'Pulp Fiction', 154, 7)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (8, N'El señor de los anillos: La comunidad del anillo', 178, 8)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (9, N'El bueno, el feo y el malo', 161, 9)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (10, N'Forrest Gump', 144, 10)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (11, N'El club de la lucha', 205, 1)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (12, N'Origen', 207, 2)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (13, N'El señor de los anillos: Las dos torres', 179, 3)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (14, N'El Imperio contraataca', 120, 4)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (15, N'Matrix', 205, 5)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (16, N'Uno de los nuestros', 146, 6)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (17, N'Alguien voló sobre el nido del cuco', 133, 7)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (18, N'Seven', 122, 8)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (19, N'Los siete samuráis', 163, 9)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [duracion], [id_tipo]) VALUES (20, N'¡Qué bello es vivir!', 130, 10)
SET IDENTITY_INSERT [dbo].[Peliculas] OFF
GO
SET IDENTITY_INSERT [dbo].[Salas] ON 

INSERT [dbo].[Salas] ([id_sala], [id_tipo_sala]) VALUES (1, 1)
INSERT [dbo].[Salas] ([id_sala], [id_tipo_sala]) VALUES (2, 1)
INSERT [dbo].[Salas] ([id_sala], [id_tipo_sala]) VALUES (3, 2)
INSERT [dbo].[Salas] ([id_sala], [id_tipo_sala]) VALUES (4, 2)
INSERT [dbo].[Salas] ([id_sala], [id_tipo_sala]) VALUES (5, 3)
INSERT [dbo].[Salas] ([id_sala], [id_tipo_sala]) VALUES (6, 3)
INSERT [dbo].[Salas] ([id_sala], [id_tipo_sala]) VALUES (7, 4)
INSERT [dbo].[Salas] ([id_sala], [id_tipo_sala]) VALUES (8, 5)
SET IDENTITY_INSERT [dbo].[Salas] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (1, 1, 1, CAST(N'2022-11-06T22:05:54.220' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (2, 3, 2, CAST(N'2022-11-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (3, 3, 12, CAST(N'2022-11-06T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (4, 2, 2, CAST(N'2022-11-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (5, 1, 334, CAST(N'2022-11-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (6, 3, 3, CAST(N'2022-11-08T10:44:05.073' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (9, 1, 9, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (10, 2, 14, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (11, 3, 5, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (12, 2, 8, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (13, 1, 10, CAST(N'2022-11-12T13:25:06.853' AS DateTime), 0)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (14, 1, 1, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (15, 1, 1, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (16, 3, 30, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (17, 2, 16, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (18, 2, 18, CAST(N'2022-11-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (19, 2, 9, CAST(N'2022-11-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (20, 1, 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (21, 1, 1, CAST(N'2022-11-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (22, 3, 12, CAST(N'2022-11-14T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (23, 1, 1, CAST(N'2022-11-14T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (24, 1, 17, CAST(N'2022-11-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (25, 1, 1, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Tickets] ([id_ticket], [id_tipo_pago], [id_cliente], [fecha_compra], [activo]) VALUES (26, 2, 12, CAST(N'2022-11-15T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipo_peliculas] ON 

INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (1, N'Acción')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (2, N'Aventuras')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (3, N'Ciencia Ficción')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (4, N'Comedia')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (5, N'Documental')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (6, N'Drama')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (7, N'Fantasía')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (8, N'Musical')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (9, N'Suspense')
INSERT [dbo].[Tipo_peliculas] ([id_tipo], [genero]) VALUES (10, N'Terror')
SET IDENTITY_INSERT [dbo].[Tipo_peliculas] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_pagos] ON 

INSERT [dbo].[Tipos_pagos] ([id_tipo_pago], [nombre_tipo_pago]) VALUES (1, N'CRÉDITO')
INSERT [dbo].[Tipos_pagos] ([id_tipo_pago], [nombre_tipo_pago]) VALUES (2, N'DÉBITO')
INSERT [dbo].[Tipos_pagos] ([id_tipo_pago], [nombre_tipo_pago]) VALUES (3, N'EFECTIVO')
SET IDENTITY_INSERT [dbo].[Tipos_pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_Salas] ON 

INSERT [dbo].[Tipos_Salas] ([id_tipo_sala], [tipo]) VALUES (1, N'2D')
INSERT [dbo].[Tipos_Salas] ([id_tipo_sala], [tipo]) VALUES (2, N'3D')
INSERT [dbo].[Tipos_Salas] ([id_tipo_sala], [tipo]) VALUES (3, N'Premium Class')
INSERT [dbo].[Tipos_Salas] ([id_tipo_sala], [tipo]) VALUES (4, N'IMAX')
INSERT [dbo].[Tipos_Salas] ([id_tipo_sala], [tipo]) VALUES (5, N'Multiplex')
SET IDENTITY_INSERT [dbo].[Tipos_Salas] OFF
GO
ALTER TABLE [dbo].[Butacas]  WITH CHECK ADD  CONSTRAINT [fk_asiento_sala] FOREIGN KEY([id_sala])
REFERENCES [dbo].[Salas] ([id_sala])
GO
ALTER TABLE [dbo].[Butacas] CHECK CONSTRAINT [fk_asiento_sala]
GO
ALTER TABLE [dbo].[Detalle_Tickets]  WITH CHECK ADD  CONSTRAINT [fk_butaca_detalle] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[Butacas] ([id_butaca])
GO
ALTER TABLE [dbo].[Detalle_Tickets] CHECK CONSTRAINT [fk_butaca_detalle]
GO
ALTER TABLE [dbo].[Detalle_Tickets]  WITH CHECK ADD  CONSTRAINT [fk_funcion_detalle] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[Funciones] ([id_funcion])
GO
ALTER TABLE [dbo].[Detalle_Tickets] CHECK CONSTRAINT [fk_funcion_detalle]
GO
ALTER TABLE [dbo].[Detalle_Tickets]  WITH CHECK ADD  CONSTRAINT [fk_tickets] FOREIGN KEY([id_ticket])
REFERENCES [dbo].[Tickets] ([id_ticket])
GO
ALTER TABLE [dbo].[Detalle_Tickets] CHECK CONSTRAINT [fk_tickets]
GO
ALTER TABLE [dbo].[Funciones]  WITH CHECK ADD  CONSTRAINT [fk_pelicula] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [fk_pelicula]
GO
ALTER TABLE [dbo].[Funciones]  WITH CHECK ADD  CONSTRAINT [fk_sala_funcion] FOREIGN KEY([id_sala])
REFERENCES [dbo].[Salas] ([id_sala])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [fk_sala_funcion]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_tipo_peliculas] FOREIGN KEY([id_tipo])
REFERENCES [dbo].[Tipo_peliculas] ([id_tipo])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [fk_peliculas_tipo_peliculas]
GO
ALTER TABLE [dbo].[Salas]  WITH CHECK ADD  CONSTRAINT [fk_tipo_sala] FOREIGN KEY([id_tipo_sala])
REFERENCES [dbo].[Tipos_Salas] ([id_tipo_sala])
GO
ALTER TABLE [dbo].[Salas] CHECK CONSTRAINT [fk_tipo_sala]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_cliente]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_tipo_pago] FOREIGN KEY([id_tipo_pago])
REFERENCES [dbo].[Tipos_pagos] ([id_tipo_pago])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_tipo_pago]
GO
/****** Object:  StoredProcedure [dbo].[bajaTickets]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[bajaTickets]
@idTicket int
as
update tickets
set activo = 0
where id_ticket = @idTicket
GO
/****** Object:  StoredProcedure [dbo].[consultarClientes]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[consultarClientes]
as
begin
	select id_cliente,dni_cliente,email,calle,altura,telefono,nom_cliente,ape_cliente,ape_cliente+', '+nom_cliente+' - '+dni_cliente 
	from Clientes
end
GO
/****** Object:  StoredProcedure [dbo].[consultarUsuarios]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[consultarUsuarios]
as
begin
select *
from Login
end
GO
/****** Object:  StoredProcedure [dbo].[funcRecaudacion]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[funcRecaudacion]
@anio int
as
select year(fecha_hora),sum(pre_unitario)
from funciones
where year(fecha_hora) = @anio
group by year(fecha_hora)
GO
/****** Object:  StoredProcedure [dbo].[insertarUsuarios]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertarUsuarios]
@usuario varchar(50),@contra varchar(50)
as
begin
insert into Login (usuario,contras) values (@usuario,@contra)
end
GO
/****** Object:  StoredProcedure [dbo].[pelisRecaudacion]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pelisRecaudacion]
@idpeli int
as
select titulo,sum(pre_unitario)
from Funciones f join Peliculas p on p.id_pelicula=f.id_pelicula
where p.id_pelicula = @idpeli
group by titulo
GO
/****** Object:  StoredProcedure [dbo].[proxTicket]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proxTicket]
@prox int output
as
begin
set @prox = (select max(id_ticket)+1 from Tickets);
end
GO
/****** Object:  StoredProcedure [dbo].[SP_BAJA_CLIENTES]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BAJA_CLIENTES]
@idCliente int
as
begin
update clientes set activo=0 where id_cliente=@idCliente
end
GO
/****** Object:  StoredProcedure [dbo].[SP_BAJA_FUNCION]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BAJA_FUNCION]	
@idFuncion int
as
begin
update Funciones set activo=0 where id_funcion=@idFuncion
end
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_CLIENTES]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BUSCAR_CLIENTES]
@nombre varchar (50)
as
select nom_cliente,ape_cliente
from Clientes
where nom_cliente like ('%' +@nombre+ '%')
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_CLIENTES_APELLIDO]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BUSCAR_CLIENTES_APELLIDO]
@apellido varchar (50)
as
select id_cliente,dni_cliente, nom_cliente, ape_cliente, email
from Clientes
where ape_cliente like ('%' +@apellido+ '%') and activo=1
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_CLIENTES_DNI]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BUSCAR_CLIENTES_DNI]
@dni bigint 
as
select id_cliente,dni_cliente, nom_cliente, ape_cliente, email
from Clientes
where dni_cliente=@dni  and activo=1
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_CLIENTES_EMAIL]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------	
create proc [dbo].[SP_BUSCAR_CLIENTES_EMAIL]
@email varchar (100)
as
select id_cliente,dni_cliente, nom_cliente, ape_cliente, email
from Clientes
where email like ('%' +@email+ '%')  and activo=1
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_CLIENTES_NOMBRE]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BUSCAR_CLIENTES_NOMBRE]
@nombre varchar (50)
as
select id_cliente,dni_cliente, nom_cliente, ape_cliente, email
from Clientes
where nom_cliente like ('%' +@nombre+ '%') and activo=1
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAR_CLIENTES_TELEFONO]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_BUSCAR_CLIENTES_TELEFONO]
@telefono bigint 
as
select id_cliente,dni_cliente, nom_cliente, ape_cliente, email
from Clientes
where telefono=@telefono  and activo=1
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTE]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CONSULTAR_CLIENTE]
as
select * from clientes
where activo = 1
order by id_cliente desc
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES_ACTIVOS]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CONSULTAR_CLIENTES_ACTIVOS]
AS
begin
select id_cliente,dni_cliente, nom_cliente, ape_cliente, email
from clientes
where activo=1
order by id_cliente desc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_CLIENTES_ACTIVOS2]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CONSULTAR_CLIENTES_ACTIVOS2]
@param int = 0
AS
begin
select id_cliente,dni_cliente, nom_cliente, ape_cliente, email, ape_cliente+', '+nom_cliente+' - '+dni_cliente
from clientes
where activo=1
order by id_cliente desc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FUNCIONES]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CONSULTAR_FUNCIONES]
as
begin 
select *
from funciones 
where fecha_hora>=getdate()
and activo = 1
order by id_funcion desc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FUNCIONES_FILTRO]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CONSULTAR_FUNCIONES_FILTRO]
@fecha date
  as
  begin
  select f.id_funcion,p.titulo+' - '+cast(format(fecha_hora,'dd/MM/yyyy') as varchar)+' - Sala '+cast(id_sala as varchar)
  from funciones f, peliculas p 
  where f.id_pelicula=p.id_pelicula and f.fecha_hora>=@fecha
  end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FUNCIONES2]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_CONSULTAR_FUNCIONES2]
  as
  begin
  select f.id_funcion,p.titulo+' - '+cast(format(fecha_hora,'dd/MM/yyyy') as varchar)+' - Sala '+cast(id_sala as varchar),pre_unitario
  from funciones f, peliculas p 
  where f.id_pelicula=p.id_pelicula and f.fecha_hora>=getdate()
  end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_FUNCIONES3]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_FUNCIONES3]
   AS
  BEGIN
	SELECT f.id_funcion,f.id_pelicula,fecha_hora,pre_unitario,id_sala,p.titulo + '-' + CAST(P.duracion AS VARCHAR) + '-'+ CAST(f.fecha_hora AS VARCHAR) as titulos from Funciones f join Peliculas p on p.id_pelicula = f.id_pelicula
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PELICULA]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CONSULTAR_PELICULA]
as
select * from Peliculas
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_PELICULAS]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CONSULTAR_PELICULAS]
  as
  begin
  select id_pelicula, titulo
  from peliculas
  end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_TICKET]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CONSULTAR_TICKET]
AS
begin
SELECT * from Tickets
order by activo desc, fecha_compra desc
end
GO
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_TIPO_PAGO]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_CONSULTAR_TIPO_PAGO]
as
select * from Tipos_pagos
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_CLIENTE]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ELIMINAR_CLIENTE]
@id int
as
update clientes set activo = 0
where id_cliente = @id
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAR_FUNCIONES]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ELIMINAR_FUNCIONES]
@id_funcion int
as
update Funciones set activo = 0
where id_funcion = @id_funcion
GO
/****** Object:  StoredProcedure [dbo].[SP_GRABAR_CLIENTE]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GRABAR_CLIENTE] --usado en metodo GrabarCliente()
@nombre varchar(100),
@apellido varchar(100),
@calle varchar(50),
@altura int,
@telefono bigint,
@dni bigint,
@email varchar(100)
as
declare @activo bit = 1
begin
insert into clientes (dni_cliente,email,calle,altura,telefono,nom_cliente,ape_cliente,activo)
values (@dni,@email,@calle,@altura,@telefono,@nombre,@apellido,@activo)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GRABAR_FUNCION]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GRABAR_FUNCION]	--usado en método GrabarFuncion()
  @idPelicula int,
  @fecha datetime,
  @precio money,
  @idSala int
  as
  declare @activo bit = 1
  begin
  insert into Funciones (id_pelicula,fecha_hora,pre_unitario,id_sala,activo)
  values (@idPelicula,@fecha,@precio,@idSala,@activo)
  end
GO
/****** Object:  StoredProcedure [dbo].[SP_GRABAR_TICKET]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GRABAR_TICKET]
	@id_tipo_pago int,
	@id_cliente int,
	@fecha_compra datetime,
	@id_ticket int output
AS
BEGIN
	INSERT INTO Tickets (id_tipo_pago,id_cliente,fecha_compra,activo)
    VALUES (@id_tipo_pago,@id_cliente,@fecha_compra,1);
	set @id_ticket = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GRABAR_TICKET2]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_GRABAR_TICKET2]
	@id_tipo_pago int,
	@id_cliente int,
	@fecha_compra datetime
AS
BEGIN
	INSERT INTO Tickets (id_tipo_pago,id_cliente,fecha_compra)
    VALUES (@id_tipo_pago,@id_cliente,@fecha_compra);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLE_TICKET]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERTAR_DETALLE_TICKET] 
	@descuento int,
    @id_ticket int, 
    @costo money,
    @id_butaca int,
    @id_funcion int
as
BEGIN
	set @costo = @costo - ((@costo * @descuento)*0.01)
    INSERT INTO Detalle_Tickets(descuento,id_ticket,costo,id_butaca,id_funcion)
    VALUES (@descuento,@id_ticket,@costo,@id_butaca,@id_funcion);

END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLES]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_INSERTAR_DETALLES]
	@descuento money,
	@id_ticket int,
	@costo money,
	@id_butaca int,
	@id_funcion int
AS
BEGIN
	INSERT INTO Detalle_Tickets(descuento,id_ticket,costo,id_butaca,id_funcion)
    VALUES (@descuento,@id_ticket,@costo,@id_butaca,@id_funcion);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_PELICULA]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[SP_UPDATE_PELICULA]	
 @idPelicula int,
 @titulo varchar(50),
 @duracion int,
 @id_tipo int
 as
 begin
 update Peliculas set titulo=@titulo, duracion=@duracion, id_tipo=@id_tipo
 where id_pelicula = @idPelicula
 end
GO
/****** Object:  StoredProcedure [dbo].[SP_USUARIOS_LOGIN]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_USUARIOS_LOGIN]
as
begin
select usuario,contras from Login
end
GO
/****** Object:  StoredProcedure [dbo].[spConsultarFuncionesParametro]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spConsultarFuncionesParametro]
as
begin
	SELECT id_funcion '#',titulo 'Pelicula',duracion 'Duracion',fecha_hora 'Fecha', pre_unitario 'Precio'
	FROM Funciones f join Peliculas p
	on f.id_pelicula=p.id_pelicula
	where fecha_hora > getdate()
end
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTiposPagos]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spConsultarTiposPagos]
as
begin
select id_tipo_pago,nombre_tipo_pago from Tipos_pagos
end
GO
/****** Object:  StoredProcedure [dbo].[tiposPagoTickets]    Script Date: 15/11/22 23:53:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tiposPagoTickets]
@idTipoPago int
as
select tp.id_tipo_pago,nombre_tipo_pago,count(id_ticket)
from Tickets t join Tipos_pagos tp on tp.id_tipo_pago=t.id_tipo_pago
where tp.id_tipo_pago = @idTipoPago
group by tp.id_tipo_pago,nombre_tipo_pago
GO
/****** Object:  StoredProcedure [dbo].[pelisRecaudacion2]    Script Date: 16/11/22 10:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[pelisRecaudacion2]
as
select titulo 'Película',SUM(costo) 'Recaudación $',COUNT(t.id_ticket) 'Tickets vendidos'
from Detalle_Tickets d join Tickets t on t.id_ticket=d.id_ticket
join Funciones f on f.id_funcion=d.id_funcion
join peliculas p on p.id_pelicula=f.id_pelicula
group by titulo