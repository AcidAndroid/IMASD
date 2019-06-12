
Imports System.Data

Partial Class Scripts_Empleado
    Inherits System.Web.UI.Page

    Private Sub Scripts_Empleado_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.lblMensaje.Visible = False
        Me.lblMensaje.Visible = False
        Me.lblinfo.Visible = False
        Dim id = Page.Request.QueryString("id")
        If id > 0 And Me.IsPostBack = False Then

            Me.BuscarDatosEmpleado(id)
        End If
    End Sub

    Private Sub BuscarDatosEmpleado(id As Integer)
        Dim operacion As New Conector
        Dim dts As New DataSet
        dts = operacion.EmpleadoRead(id)

        Me.txtnombre.Text = dts.Tables(0).Rows(0).Item("Nombre")
        Me.txtapellidoPaterno.Text = dts.Tables(0).Rows(0).Item("ApellidoP")
        Me.txtapellidoMaterno.Text = dts.Tables(0).Rows(0).Item("ApellidoM")
        Me.txtDireccion.Text = dts.Tables(0).Rows(0).Item("Direccion")
        Me.txtTelefono.Text = dts.Tables(0).Rows(0).Item("Telefono")
        Me.txtSueldo.Text = dts.Tables(0).Rows(0).Item("Sueldo")
        Me.ddlDepartamento.SelectedValue = dts.Tables(0).Rows(0).Item("DepartamentoId")
        Me.ddlDepartamento_SelectedIndexChanged(New Object, New EventArgs)


    End Sub


    Private Sub Scripts_Empleado_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim operacion As New Conector
        Me.ddlDepartamento.DataSource = operacion.DepartamentosRead
        Me.ddlDepartamento.DataTextField = "Descripcion"
        Me.ddlDepartamento.DataValueField = "DepartamentoId"
        Me.ddlDepartamento.DataBind()
    End Sub

    Public Sub ddlDepartamento_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlDepartamento.SelectedIndexChanged
        Me.txtDepartemento.Text = Me.ddlDepartamento.SelectedItem.Text
    End Sub

    Public Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click
        Me.Page.Validate()

        If Me.Page.IsValid Then
            Dim operacion As New Conector
            Dim dts As New DataSet
            Dim idnuevo = 0

            ''Actulizacion
            If Page.Request.QueryString("id") IsNot Nothing Then
                dts = operacion.EmpleadoUpdate(Page.Request.QueryString("id"), Me.txtnombre.Text, Me.txtapellidoPaterno.Text, Me.txtapellidoMaterno.Text, Me.txtDireccion.Text, Me.txtTelefono.Text, Me.txtSueldo.Text, Me.ddlDepartamento.SelectedItem.Value)
                idnuevo = dts.Tables(0).Rows(0).Item(0)
                If idnuevo > 0 Then
                    Me.lblinfo.Visible = True
                Else
                    Me.lblError.Visible = True
                End If
                ''Creacion
            Else
                dts = operacion.EmpleadoInsert(Me.txtnombre.Text, Me.txtapellidoPaterno.Text, Me.txtapellidoMaterno.Text, Me.txtDireccion.Text, Me.txtTelefono.Text, Me.txtSueldo.Text, Me.ddlDepartamento.SelectedItem.Value)
                idnuevo = dts.Tables(0).Rows(0).Item(0)
                If idnuevo > 0 Then
                    Me.lblMensaje.Visible = True
                Else
                    Me.lblError.Visible = True
                End If
            End If

        End If
    End Sub
End Class
