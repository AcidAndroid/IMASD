<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Busqueda de empleados</h1>
        
    </div>

    <div class="row">
        <div class="col-sm-12">
            <h3>Busqueda por Departmento</h3>  
            <div class="input-group">
      <div class="input-group-btn">

          
          
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Departamento<span class="caret"></span></button>
         
          <asp:ListBox ID="ddlDepartamento" class="dropdown-menu" runat="server" AutoPostBack="true">
              
          </asp:ListBox>
        
      </div><!-- /btn-group -->
        <asp:TextBox ID="txtDepartemento" class="form-control" aria-label="..." runat="server"></asp:TextBox>
      <%--<input type="text" >--%>
    </div><!-- /input-group -->
        </div>
        
    </div>
    <div class="row">
        <h3>Busqueda por Numero de empleado</h3>  
        <div class="col-sm-12">
            <div class="input-group ">
             <span class="input-group-addon glyphicon glyphicon-search" aria-hidden="true"" ></span> 
            <asp:TextBox runat="server" ID="txtNumeroEmpleado" placeholder="Numero de empleado" class="form-control" MaxLength="10"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtNumeroEmpleado" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:Button ID="btnBuscarNumeroEmpleado" CssClass="btn btn-success" runat="server" Text="Button" />
        </div>
        </div>
        
    </div>
    <div class="row">
        <div class="col-sm-12">
                
                    <asp:Label ID="lblMensaje" class="bg-success alert alert-success alert-link" runat="server" Text="Empleado Borrado" Visible="false"></asp:Label>               
               
                
                    <asp:Label ID="lblError"  class="bg-danger alert alert-success alert-link" runat="server" Text="Error en la operacion" Visible="false"></asp:Label>

                      
                
            </div>
    </div>

    <div class="row">
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
            <ControlStyle CssClass="btn btn-danger" />
            </asp:CommandField>
            <asp:CommandField ShowCancelButton="False" ShowEditButton="True">
            <ControlStyle CssClass="btn btn-info" />
            </asp:CommandField>
        </Columns>
        </asp:GridView>

    </div>
</asp:Content>
