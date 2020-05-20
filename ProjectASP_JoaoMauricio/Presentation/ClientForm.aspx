<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientForm.aspx.cs" Inherits="ProjectASP_JoaoMauricio.Presentation.ClientForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <title></title>
    <link rel="stylesheet" type ="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
   
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
                    
              <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between">
                    <div style="width: 23%;padding:0 1% 0 1%;"> Region
                        <asp:DropDownList ID="DropDownListRegion" class="btn btn-danger" runat="server"  Height="35px" Width="100%" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" DataTextField="Region" DataValueField="Region">
                            <asp:ListItem  Value="1" >All</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="width: 23%;padding:0 1% 0 1%;"> City                        
                        <asp:DropDownList ID="DropDownListCity" class="btn btn-danger" runat="server"  AutoPostBack="True"  Height="35px" Width="100%" ValidateRequestMode="Enabled" DataSourceID="SqlDataSource2" AppendDataBoundItems="true" DataTextField="CIty" DataValueField="CIty">
                            <asp:ListItem  Value="1" >All</asp:ListItem>                
                        </asp:DropDownList>
                    </div>
                   <div style="width: 23%; padding: 0 1% 0 1%;">Price(Max)
                        <asp:DropDownList ID="DropDownListPrice" class="btn btn-danger" runat="server"  Height="35px" Width="100%">
                            <asp:ListItem Value="2">100000</asp:ListItem>
                            <asp:ListItem Value="3">200000</asp:ListItem>
                            <asp:ListItem Value="4">500000</asp:ListItem>
                            <asp:ListItem Value="5">1000000</asp:ListItem>
                            <asp:ListItem Value="6">5000000</asp:ListItem>
                            <asp:ListItem Value="7">99999999.99</asp:ListItem>
             </asp:DropDownList>
                    </div>
                     <div style="width: 25%;padding:0 1% 0 1%;"> Rooms(Min)
                         <asp:DropDownList ID="DropDownListRooms" class="btn btn-danger" runat="server"  Height="35px" Width="100%">
                            <asp:ListItem Value="1">0</asp:ListItem>
                            <asp:ListItem Value="2">1</asp:ListItem>
                           <asp:ListItem Value="3">2</asp:ListItem>
                           <asp:ListItem Value="4">3</asp:ListItem>
                        </asp:DropDownList>
                     </div>
                </li>
            </ul>

            <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between">
                    <div style="width: 25%;padding:0 1% 0 1%;">Bathrooms(Min)
            <asp:DropDownList ID="DropDownListBathroom" class="btn btn-danger" runat="server"  Height="35px" Width="100%">
                <asp:ListItem Value="1">0</asp:ListItem>
                 <asp:ListItem Value="2">1</asp:ListItem>
                <asp:ListItem Value="3">2</asp:ListItem>
                <asp:ListItem Value="4">3</asp:ListItem>
             </asp:DropDownList>
                    </div>
                    
                    <div style="width: 25%;padding:0 1% 0 1%;"> Pool    <br />                  
                       <asp:RadioButton ID="RadioButtonPollYes" runat="server" GroupName="Poll" />
                   Yes <asp:RadioButton ID="RadioButtonPollNo" style="margin:0 5px 0 5px" runat="server" GroupName="Poll" />No
                    
                    </div>
                   <div style="width: 25%; padding: 0 1% 0 1%;">Garage  <br /> 
                       <asp:RadioButton ID="RadioButtonGarageYes" runat="server" GroupName="Garage"  />
                     Yes<asp:RadioButton ID="RadioButtonGarageNo" style="margin:0 5px 0 5px" runat="server" GroupName="Garage" />No                    
                    </div>
                     <div style="width: 25%;padding:0 1% 0 1%;"> Fireplace  <br /> 
                      <asp:RadioButton ID="RadioButtonFirePlaceYes" runat="server" GroupName="Fireplace" />
                    Yes<asp:RadioButton ID="RadioButtonFirePlaceNo" style="margin:0 5px 0 5px" runat="server" GroupName="Fireplace" />No                    
                     </div>
                </li>
            </ul>
                   

                    <div>
                        
            
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT DISTINCT [Region] FROM [House]"></asp:SqlDataSource>                      
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnection %>" SelectCommand="SELECT DISTINCT [CIty] FROM [House]"></asp:SqlDataSource>
               
              
                <br />
             </div>

         <div>
            
               
             
             </div>

        <div style="max-width:30%;margin:auto;" >              
            <asp:Button ID="ButtonSearch" class="btn btn-danger" runat="server" Height="35px" Width="40%" Text="Search" OnClick="ButtonSearch_Click" />
            <asp:Button ID="ButtonReset" class="btn btn-danger" runat="server" Height="35px" Width="40%" Text="Reset" OnClick="ButtonReset_Click" />
                 
        </div>
                 </td>

                 
            </tr>
           
        </table>
        
                    
                        <asp:Label ID="StatusLbl" runat="server" Text=""></asp:Label>
        
        <div>
      <%--  <img src="placeholder" id="houseimage1" runat="server"/>--%>
        </div>
            <!-- class="img-thumbnail"  width="152" alt="houseimage1"<asp:Image ID="Image1" runat="server" Height="269px" Width="1234px" />-->
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                 <asp:ImageField  DataImageUrlField="Image" HeaderText="Image" ControlStyle-Height="100px"></asp:ImageField>          
                        <asp:TemplateField>
                            <ItemTemplate>
                               <%-- <asp:LinkButton runat="server" ID="ViewBtn" OnClick="ViewBtn_Click" CausesValidation="false" CommandArgument='<%# Eval("HouseID") %>'>View</asp:LinkButton>--%>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
        </asp:GridView>
    </form>
</div>
</body>
</html>
