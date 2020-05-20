<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="ProjectASP_JoaoMauricio.Presentation.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
  </head>
    
<body>
    <div style="width:80%;margin:auto;">
        <div>
            <asp:Image  runat="server" ImageUrl="~/Images/logo.png"  style="width:50%;display:block;margin-left:auto;margin-right:auto;" />
        </div>
    
        <form   runat="server">
            
            <div  style="width:40%;margin:auto; margin-top:30px; background-color:aquamarine;">
                   
                <div class="inputs" style="width:90%;margin:auto;padding:5%">
                      <asp:Label  runat="server" Text="Username : "></asp:Label>
                      <br />
                      <asp:TextBox ID="TxtUser"  runat="server" OnTextChanged="TextBox1_TextChanged" Width="100%" ></asp:TextBox>
                      <br /><br />
                      <asp:Label  runat="server" Text="Password : "></asp:Label>
                      <br />
                      <asp:TextBox ID="TxtPass" runat="server" Width="100%"></asp:TextBox>
                      <br />
                      <br />
                      <asp:Label ID="LabelWarning" runat="server"></asp:Label>
                      <br />
                
                      <asp:Button ID="bttLogin" class="btn btn-danger" runat="server" OnClick="bttLogin_Click" Text="Login" style="display:block;margin-left:auto;margin-right:auto;" Height="39px" Width="100px" />
                </div>  
            </div>
        </form>
     </div>
</body>
</html>
