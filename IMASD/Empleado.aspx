<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Empleado.aspx.vb" MasterPageFile="~/Site.Master" Inherits="Scripts_Empleado" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h4>Datos Empleado</h4>
    <div class="row">
        <div class="col-sm-6">
        
        <div class="row">
        <div class="input-group input-group-lg">
            <span class="input-group-addon glyphicon glyphicon-list-alt" aria-hidden="true"" id="basic-addon1"></span> 
            <asp:TextBox runat="server" ID="txtnombre" placeholder="Nombre" class="form-control" MaxLength="50"  ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnombre" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
       
        </div>
    <div class="row ">
        <div class="input-group input-group-lg">
             <span class="input-group-addon glyphicon glyphicon-list-alt" aria-hidden="true"" ></span> 
            <asp:TextBox runat="server" ID="txtapellidoPaterno" placeholder="Apellido Paterno" class="form-control" MaxLength="50" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtapellidoPaterno" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row ">
       <div class="input-group input-group-lg">
            <span class="input-group-addon glyphicon glyphicon-list-alt" aria-hidden="true"" ></span> 
            <asp:TextBox runat="server" ID="txtapellidoMaterno" placeholder="Apellido Materno" class="form-control"  MaxLength="50"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtapellidoMaterno" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>

    </div>

        <div class="col-sm-6">
<div class="row ">
       <div class="input-group input-group-lg">
            <span class="input-group-addon glyphicon glyphicon-tree-deciduous" aria-hidden="true"" ></span> 
            <asp:TextBox runat="server" ID="txtDireccion" placeholder="Direccion" class="form-control" MaxLength="150" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDireccion" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row ">
       <div class="input-group input-group-lg">
            <span class="input-group-addon glyphicon glyphicon-phone-alt" aria-hidden="true"" ></span> 
           
            <asp:TextBox runat="server" ID="txtTelefono" placeholder="Teléfono" class="form-control"  MaxLength="13"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTelefono" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    </div>
    </div>
    <hr />
            <h4>Datos Laborales</h4>
    <div class="row">
        <div class="col-sm-6">
             <div class="input-group input-group-lg">
             <span class="input-group-addon">$</span>
            <asp:TextBox runat="server" ID="txtSueldo" placeholder="Sueldo" class="form-control" MaxLength="10"  ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtSueldo" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        </div>
        <div class="col-sm-6">
           
        <div class="input-group input-group-lg">
        
      <div class="input-group-btn">
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlDepartamento" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Departamento<span class="caret"></span></button>
         
          <asp:ListBox ID="ddlDepartamento" class="dropdown-menu" runat="server" AutoPostBack="true">
              
          </asp:ListBox>
       
      </div><!-- /btn-group -->
        <asp:TextBox ID="txtDepartemento" class="form-control" aria-label="..." runat="server"></asp:TextBox>
     
    </div><!-- /input-group -->

            

  </div><!-- /.col-lg-6 -->
    
        
    </div>
    
    <div class="row">
         <div class="col-sm-12">
        <asp:Button ID="btnEnviar" runat="server" Text="Guardar" class="btn btn-success"  />

     </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-sm-12">
                
                    <asp:Label ID="lblMensaje" class="bg-success alert alert-success alert-link" runat="server" Text="Empleado agregado" Visible="false"></asp:Label>               
               
                
                    <asp:Label ID="lblError"  class="bg-danger alert alert-success alert-link" runat="server" Text="Error en la operacion" Visible="false"></asp:Label>

            <asp:Label ID="lblinfo" class="bg-info alert alert-info alert-link" runat="server" Text="Empleado actualizado" Visible="false"></asp:Label>               
                
            </div>
    </div>

     

        
</asp:Content>
