Imports System.Data
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
' <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")>
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)>
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Public Class Conector
    Inherits System.Web.Services.WebService

    <WebMethod()>
    Public Function HelloWorld() As String
        Return "Hola a todos"
    End Function

    <WebMethod()>
    Public Function DepartamentosRead() As DataSet

        Dim operacion As New DB

        Return operacion.DBExecuteSP("SPNomina_DepartamentoRead")

    End Function

    <WebMethod()>
    Public Function EmpleadosRead(dep As Integer) As DataSet

        Dim operacion As New DB
        operacion.Parametros.Add(New SqlClient.SqlParameter("@DepartamentoId", dep))
        Return operacion.DBExecuteSP("SPNomina_EmpeladosRead")

    End Function

    <WebMethod()>
    Public Function EmpleadoRead(emp As Integer) As DataSet

        Dim operacion As New DB
        operacion.Parametros.Add(New SqlClient.SqlParameter("@EmpleadoId", emp))
        Return operacion.DBExecuteSP("SPNomina_EmpeladoRead")

    End Function

    <WebMethod()>
    Public Function EmpleadoDelete(emp As Integer) As DataSet

        Dim operacion As New DB
        operacion.Parametros.Add(New SqlClient.SqlParameter("@EmpleadoId", emp))
        Return operacion.DBExecuteSP("dbo.SPNomina_EmpeladoDelete")

    End Function

    <WebMethod()>
    Public Function EmpleadoInsert(nombre As String, ap As String, am As String, dir As String, tel As String, sueldo As Double, dep As Integer) As DataSet

        Dim operacion As New DB
        operacion.Parametros.Add(New SqlClient.SqlParameter("@DepartamentoId", dep))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@Nombre", nombre))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@ApellidoP", ap))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@ApellidoM", am))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@Direccion", dir))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@Telefono", tel))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@Sueldo", sueldo))



        Return operacion.DBExecuteSP("SPNomina_EmpeladoInsert")

    End Function

    <WebMethod()>
    Public Function EmpleadoUpdate(id As Integer, nombre As String, ap As String, am As String, dir As String, tel As String, sueldo As Double, dep As Integer) As DataSet

        Dim operacion As New DB
        operacion.Parametros.Add(New SqlClient.SqlParameter("@EmpleadoId", id))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@DepartamentoId", dep))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@Nombre", nombre))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@ApellidoP", ap))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@ApellidoM", am))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@Direccion", dir))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@Telefono", tel))
        operacion.Parametros.Add(New SqlClient.SqlParameter("@Sueldo", sueldo))



        Return operacion.DBExecuteSP("SPNomina_EmpeladoUpdate")

    End Function

End Class