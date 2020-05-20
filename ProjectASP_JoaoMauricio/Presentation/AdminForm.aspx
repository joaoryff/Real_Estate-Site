<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminForm.aspx.cs" Inherits="ProjectASP_JoaoMauricio.Presentation.AdminForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type ="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />

</head>
<body>
    <div style="max-width:80%;margin:auto;">
         <div>
            <asp:Image  runat="server" ImageUrl="~/Images/logo.png"  style="width:50%;display:block;margin-left:auto;margin-right:auto;" />
        </div>
    <form id="form1" runat="server"  >
        <table style="width: 100%;">
            <tr>
                <td >
              
                    <div style="margin:10px">
                    ID
                    <asp:DropDownList ID="DropDownID" class="btn btn-danger" runat="server"  Height="35px" Width="200px" DataSourceID="SqlDataSource6" DataTextField="HouseID" DataValueField="HouseID" OnSelectedIndexChanged="DropDownID_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        <asp:Label ID="StatusLbl" runat="server" Text=""></asp:Label> 
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT [HouseID] FROM [House]"></asp:SqlDataSource>
                        </div>
        <br />
             <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between">
                    <div style="width: 25%;padding:0 1% 0 1%;"> Region
                        <asp:DropDownList ID="DropDownListRegion" class="btn btn-danger"  runat="server"  Height="35px" Width="100%" DataSourceID="SqlDataSource1" DataTextField="Region" DataValueField="Region" AutoPostBack="True">
                            
                        </asp:DropDownList>
                    </div>
                    <div style="width: 25%;padding:0 1% 0 1%;"> City                        
                        <asp:DropDownList ID="DropDownListCity" class="btn btn-danger" runat="server"  AutoPostBack="True"  Height="35px" Width="100%" ValidateRequestMode="Enabled" DataSourceID="SqlDataSource3" DataTextField="CIty" DataValueField="CIty"></asp:DropDownList>
                    </div>
                   <div style="                           width: 25%;
                           padding: 0 1% 0 1%;"> Price
                        <asp:DropDownList ID="DropDownListPrice" class="btn btn-danger" runat="server"  Height="35px" Width="100%" DataSourceID="SqlDataSource4" DataTextField="Price" DataValueField="Price" AutoPostBack="True"></asp:DropDownList>
                    </div>
                     <div style="width: 25%;padding:0 1% 0 1%;">Rooms
                        <asp:DropDownList ID="DropDownListRooms" class="btn btn-danger" runat="server"  Height="35px" Width="100%" DataSourceID="SqlDataSource2" DataTextField="Rooms" DataValueField="Rooms" AutoPostBack="True"></asp:DropDownList>
                     </div>
                </li>
            </ul>
            <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between">
                    <div style="width: 25%;padding:0 1% 0 1%;">   Bathrooms
                        <asp:DropDownList ID="DropDownListBathroom" class="btn btn-danger" runat="server"  Height="35px" Width="100%" DataSourceID="SqlDataSource5" DataTextField="Bathrooms" DataValueField="Bathrooms" AutoPostBack="True"></asp:DropDownList>
                    </div>
                    <div style="width: 25%;padding:0 1% 0 1%;">  Garage
                        <asp:DropDownList ID="DropDownGarage" class="btn btn-danger" runat="server"  Height="35px" Width="100%" AutoPostBack="True">
                            <asp:ListItem>--</asp:ListItem>
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="2">No</asp:ListItem>               
                        </asp:DropDownList>
                    </div>
                   <div style="width: 25%;padding:0 1% 0 1%;"> Pool
                        <asp:DropDownList ID="DropDownPool" class="btn btn-danger" runat="server"  Height="35px" Width="100%" AutoPostBack="True">
                            <asp:ListItem>--</asp:ListItem>
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                             <asp:ListItem Value="2">No</asp:ListItem>   
                         </asp:DropDownList>
                    </div>
                     <div style="width: 25%;padding:0 1% 0 1%;"> Fireplace
                        <asp:DropDownList ID="DropDownFireplace" class="btn btn-danger" runat="server"  Height="35px" Width="100%" AutoPostBack="True">
                            <asp:ListItem>--</asp:ListItem>
                            <asp:ListItem Value="1">Yes</asp:ListItem>
                            <asp:ListItem Value="2">No</asp:ListItem>   
                         </asp:DropDownList>
                     </div>
                </li>
            </ul>
            
            <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between">
                   <div style="width: 100%;padding-right:1%"> 
                       <asp:FileUpload  id="FileUploadControl"  runat="server" onchange="fileInfo()" style="display:none"/>
                       <asp:TextBox ID="TextBox1" class="rounded" runat="server" Height="35px" Width="100%"></asp:TextBox>
                       
                   </div>
                     <div style="width: 20%;padding:0 0.5% 0 0.5%;">  
                       <asp:LinkButton ID="LinkButton1" class="btn btn-danger"  runat="server" Height="35px" Width="100%" padding="0 0.5% 0 0.5%">FileUpload</asp:LinkButton>
                   </div>
                   <div style="width: 20%;padding:0 0.5% 0 0.5%;">  
                       <asp:Button ID="ButtonSave" class="btn btn-danger" runat="server" Text="Save" Height="35px" Width="100%" OnClick="ButtonSave_Click" />
                   </div>
                   <div style="width: 20%;padding:0 0.5% 0 0.5%;"> 
                       <asp:Button ID="ButtonUpadate" class="btn btn-danger" runat="server" Text="Update" Height="35px" Width="100%" OnClick="ButtonUpadate_Click" />
                   </div>
                   <div style="width: 20%;padding:0 0.5% 0 0.5%;"> 
                       <asp:Button ID="ButtonDelete" class="btn btn-danger" runat="server" Text="Delete" Height="35px" Width="100%" OnClick="ButtonDelete_Click" />
                   </div>
                </li>
            </ul>                  
                      
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT DISTINCT Region FROM House"></asp:SqlDataSource>
               
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT DISTINCT CIty FROM House"></asp:SqlDataSource>
                
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT DISTINCT [Price] FROM [House]"></asp:SqlDataSource>
                
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT DISTINCT [Rooms] FROM [House]"></asp:SqlDataSource>                        
           
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT DISTINCT [Bathrooms] FROM [House] ORDER BY [Bathrooms]"></asp:SqlDataSource>           
                                             
        <div>   
      
                  
        </div>
                 </td>

                 
            </tr>
           
        </table>        
                    
        <p>
            <asp:Image ID="Image1" runat="server" Height="100%" Width="100%" />
        </p>
    </form>
</div>
</body>
</html>

<script type="text/javascript">

    function fileInfo() {
        document.getElementById('<%=TextBox1.ClientID%>').value = document.getElementById('<%=FileUploadControl.ClientID %>').value;
    }

</script>
