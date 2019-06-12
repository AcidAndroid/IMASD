Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class DB

    Const Server As String = "DESKTOP-5SF5E0A\MSSQLSERVER01"
    Const Bd As String = "Nomina2018"
    Const usr As String = "sa"
    Const pass As String = "prueba"

    Private conexion As New SqlConnection()
    Private commando As New SqlCommand()
    Private adaptador As New SqlDataAdapter()

    Public ReadOnly Property Parametros As SqlParameterCollection
        Get
            Return Me.commando.Parameters
        End Get
    End Property







    Public Function Conectar() As Boolean
        Dim conectado As Boolean = False


        Me.conexion.ConnectionString = "app=" & System.AppDomain.CurrentDomain.FriendlyName _
            & ";User=" & usr & ";pwd=" & pass _
            & ";workstation id=" + System.Environment.MachineName _
            & ";packet size=8192" _
            & ";Server=" & Me.Server _
            & ";Database=" & Me.Bd _
            & ";Connect Timeout=0"


        If Me.conexion.State <> ConnectionState.Open Then

            Me.conexion.Open()
        End If


        If Me.conexion.State = System.Data.ConnectionState.Open Then
            conectado = True


        End If




        Return conectado


    End Function

    Public Function Desconectar() As Boolean
        If Me.conexion.State = System.Data.ConnectionState.Open Then
            Me.conexion.Close()
            Return True


        End If
        Return False
    End Function

    Public Function DBExecuteSP(sp As String) As DataSet
        Dim dtsSalida As New DataSet
        Try
            Me.Conectar()

            commando.Connection = Me.conexion
            commando.CommandType = CommandType.StoredProcedure
            commando.CommandText = sp
            commando.CommandTimeout = 0
            adaptador.SelectCommand = commando
            adaptador.Fill(dtsSalida)



        Catch ex As Exception
        Finally
            Me.Desconectar()
        End Try
        Return dtsSalida
    End Function



End Class
