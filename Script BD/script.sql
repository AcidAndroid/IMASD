USE [master]
GO
/****** Object:  Database [Nomina2018]    Script Date: 12/06/2019 04:26:40 p. m. ******/
CREATE DATABASE [Nomina2018]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nomina2018', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\Nomina2018.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nomina2018_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\Nomina2018_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nomina2018] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nomina2018].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nomina2018] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nomina2018] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nomina2018] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nomina2018] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nomina2018] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nomina2018] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nomina2018] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nomina2018] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nomina2018] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nomina2018] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nomina2018] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nomina2018] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nomina2018] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nomina2018] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nomina2018] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nomina2018] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nomina2018] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nomina2018] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nomina2018] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nomina2018] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nomina2018] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nomina2018] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nomina2018] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Nomina2018] SET  MULTI_USER 
GO
ALTER DATABASE [Nomina2018] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nomina2018] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nomina2018] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nomina2018] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nomina2018] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nomina2018', N'ON'
GO
ALTER DATABASE [Nomina2018] SET QUERY_STORE = OFF
GO
USE [Nomina2018]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Nomina2018]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 12/06/2019 04:26:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoId] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[DepartamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[EmpleadoId] [int] IDENTITY(100,1) NOT NULL,
	[DepartamentoId] [smallint] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApellidoP] [varchar](50) NOT NULL,
	[ApellidoM] [varchar](50) NOT NULL,
	[Direccion] [varchar](150) NOT NULL,
	[Telefono] [varchar](13) NOT NULL,
	[Sueldo] [money] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[EmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleado] ADD  CONSTRAINT [DF_Empleado_Sueldo]  DEFAULT ((0)) FOR [Sueldo]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Departamento] FOREIGN KEY([DepartamentoId])
REFERENCES [dbo].[Departamento] ([DepartamentoId])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Departamento]
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_DepartamentoDelete]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Borra un departamento
*/
Create Proc [dbo].[SPNomina_DepartamentoDelete]
@DepartamentoId smallint

as
begin

Begin try

Begin tran

delete from  Departamento 
where DepartamentoId = @DepartamentoId 

commit tran
select @@ROWCOUNT Borrado

end try
begin catch

rollback tran

SELECT  
	 0 Borrado
    ,ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState      
    ,ERROR_MESSAGE() AS ErrorMessage;  

end catch


end
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_DepartamentoInsert]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Ingresa un departamento
*/
Create Proc [dbo].[SPNomina_DepartamentoInsert]
@Descripcion varchar	(50)
as
begin

Begin try

Begin tran

Insert into Departamento 
(Descripcion)
values
(@Descripcion )

commit tran
select SCOPE_IDENTITY()Agregado

end try
begin catch

rollback tran

SELECT  
	0 Agregado
    ,ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState      
    ,ERROR_MESSAGE() AS ErrorMessage;  

end catch


end
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_DepartamentoRead]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Datos de los departamentos
*/
Create Proc [dbo].[SPNomina_DepartamentoRead]
as
begin

Begin try



select * from  Departamento 

end try
begin catch

SELECT  
	 0 Borrado
    ,ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState      
    ,ERROR_MESSAGE() AS ErrorMessage;  

end catch


end
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_DepartamentoUpdate]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Actualiza un departamento
*/
Create Proc [dbo].[SPNomina_DepartamentoUpdate]
@DepartamentoId smallint
,@Descripcion varchar	(50)
as
begin

Begin try

Begin tran

Update Departamento 
set Descripcion=@Descripcion
where DepartamentoId = @DepartamentoId 
commit tran
select @@ROWCOUNT Modificado

end try
begin catch

rollback tran

SELECT  
	 0 Modificado
    ,ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState      
    ,ERROR_MESSAGE() AS ErrorMessage;  

end catch


end
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_EmpeladoDelete]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/*  
Borra los datos de un empleado  
*/  
CREATE Proc [dbo].[SPNomina_EmpeladoDelete]  
@EmpleadoId int  
as  
begin  
  
Begin try  
  
Begin tran  
  
Delete from Empleado  
where EmpleadoId=@EmpleadoId  
  
  
  
commit tran  
select 1 Borrado  
  
end try  
begin catch  
  
rollback tran  
  
SELECT  0 Borrado  
    ,ERROR_NUMBER() AS ErrorNumber    
    ,ERROR_SEVERITY() AS ErrorSeverity    
    ,ERROR_STATE() AS ErrorState        
    ,ERROR_MESSAGE() AS ErrorMessage;    
  
end catch  
  
  
end  
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_EmpeladoInsert]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  
Ingresa un empleado  
*/  
CREATE Proc [dbo].[SPNomina_EmpeladoInsert]  
@DepartamentoId smallint  
,@Nombre varchar (50)  
,@ApellidoP varchar (50)  
,@ApellidoM varchar (50)  
,@Direccion varchar (150)  
,@Telefono varchar (13)  
,@Sueldo money
as  
begin  
  
Begin try  
  
Begin tran  
  
Insert into Empleado  
(DepartamentoId,Nombre,ApellidoP,ApellidoM,Direccion,Telefono,Sueldo )  
values  
(@DepartamentoId,@Nombre,@ApellidoP,@ApellidoM,@Direccion,@Telefono,@Sueldo )  
  
commit tran  
select SCOPE_IDENTITY()Agregado  
  
end try  
begin catch  
  
rollback tran  
  
SELECT  0 Agregado  
    ,ERROR_NUMBER() AS ErrorNumber    
    ,ERROR_SEVERITY() AS ErrorSeverity    
    ,ERROR_STATE() AS ErrorState        
    ,ERROR_MESSAGE() AS ErrorMessage;    
  
end catch  
  
  
end  
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_EmpeladoRead]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/*  
Buscar los datos de un empleado  
*/  
CREATE Proc [dbo].[SPNomina_EmpeladoRead]  
@EmpleadoId int  
as  
begin  
  
Begin try  
  
  
select E.*

from Empleado E  

where E.EmpleadoId=@EmpleadoId  
  
  
  
end try  
begin catch  
  
  
SELECT    
    ERROR_NUMBER() AS ErrorNumber    
    ,ERROR_SEVERITY() AS ErrorSeverity    
    ,ERROR_STATE() AS ErrorState        
    ,ERROR_MESSAGE() AS ErrorMessage;    
  
end catch  
  
  
end  
  
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_EmpeladosRead]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/*  
Buscar los datos de todos los empleados
*/  
CREATE Proc [dbo].[SPNomina_EmpeladosRead]  
@Departamentoid smallint=0
as  
begin  
  
Begin try  
  
  
select E.*
from Empleado E 
where Departamentoid=@Departamentoid
  
  
  
end try  
begin catch  
  
  
SELECT    
    ERROR_NUMBER() AS ErrorNumber    
    ,ERROR_SEVERITY() AS ErrorSeverity    
    ,ERROR_STATE() AS ErrorState        
    ,ERROR_MESSAGE() AS ErrorMessage;    
  
end catch  
  
  
end  
  
GO
/****** Object:  StoredProcedure [dbo].[SPNomina_EmpeladoUpdate]    Script Date: 12/06/2019 04:26:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
/*    
Actuliza los datos de un empleado    
*/    
CREATE Proc [dbo].[SPNomina_EmpeladoUpdate]    
@EmpleadoId int    
,@DepartamentoId smallint    
,@Nombre varchar (50)    
,@ApellidoP varchar (50)    
,@ApellidoM varchar (50)    
,@Direccion varchar (150)    
,@Telefono varchar (13)   
,@Sueldo money  
as    
begin    
    
Begin try    
    
Begin tran    
    
Update Empleado    
set DepartamentoId = @DepartamentoId    
,Nombre=@Nombre    
,ApellidoP=@ApellidoP    
,ApellidoM=@ApellidoM    
,Direccion=@Direccion    
,Telefono=@Telefono    
,Sueldo=@Sueldo    
where EmpleadoId=@EmpleadoId    
    
commit tran    
select 1 Modificado    
    
end try    
begin catch    
    
rollback tran    
    
SELECT  0 Modificado    
    ,ERROR_NUMBER() AS ErrorNumber      
    ,ERROR_SEVERITY() AS ErrorSeverity      
    ,ERROR_STATE() AS ErrorState          
    ,ERROR_MESSAGE() AS ErrorMessage;      
    
end catch    
    
    
end    
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Departamento', @level2type=N'COLUMN',@level2name=N'Descripcion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Departamentos de la empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Departamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de Empleado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empleado', @level2type=N'COLUMN',@level2name=N'EmpleadoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido paterno' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empleado', @level2type=N'COLUMN',@level2name=N'ApellidoP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido materno' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empleado', @level2type=N'COLUMN',@level2name=N'ApellidoM'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direccion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empleado', @level2type=N'COLUMN',@level2name=N'Direccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Empleados de la empresa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Empleado'
GO
USE [master]
GO
ALTER DATABASE [Nomina2018] SET  READ_WRITE 
GO
