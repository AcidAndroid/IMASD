
Imports System.Data

Partial Class _Default
    Inherits Page

    Private Sub _Default_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim operacion As New Conector
        Me.ddlDepartamento.DataSource = operacion.DepartamentosRead
        Me.ddlDepartamento.DataTextField = "Descripcion"
        Me.ddlDepartamento.DataValueField = "DepartamentoId"
        Me.ddlDepartamento.DataBind()
    End Sub

    Private Sub EmpleadosPorDep()
        Dim iddepartamento = 0
        If Me.ddlDepartamento.SelectedItem Is Nothing Then
            Me.txtDepartemento.Text = 0
        Else
            Me.txtDepartemento.Text = IIf(Me.ddlDepartamento.SelectedItem Is Nothing, 0, Me.ddlDepartamento.SelectedItem.Text)
            iddepartamento = Me.ddlDepartamento.SelectedValue
        End If

        Dim operacion As New Conector
        Me.GridView1.DataSource = operacion.EmpleadosRead(iddepartamento)
        Me.DataBind()
    End Sub

    Private Sub EmpleadoPorNumero()

        Dim operacion As New Conector
        Me.GridView1.DataSource = operacion.EmpleadoRead(Me.txtNumeroEmpleado.Text)
        Me.DataBind()
    End Sub

    Public Sub ddlDepartamento_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlDepartamento.SelectedIndexChanged
        Me.EmpleadosPorDep()

    End Sub

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand

    End Sub

    Private Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing
        Dim idempleado = Me.GridView1.Rows(e.NewEditIndex).Cells(2).Text
        Response.Redirect("Empleado.aspx?id=" & idempleado)
    End Sub

    Private Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim idempleado = Me.GridView1.Rows(e.RowIndex).Cells(2).Text
        Dim operacion As New Conector
        Dim dts As New DataSet

        dts = operacion.EmpleadoDelete(idempleado)

        If dts.Tables(0).Rows(0).Item(0) > 0 Then
            Me.lblMensaje.Visible = True
            Me.EmpleadosPorDep()
        End If

    End Sub

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.lblMensaje.Visible = False
        Me.lblError.Visible = False
    End Sub

    Private Sub btnBuscarNumeroEmpleado_Click(sender As Object, e As EventArgs) Handles btnBuscarNumeroEmpleado.Click
        Me.EmpleadoPorNumero()
    End Sub
End Class