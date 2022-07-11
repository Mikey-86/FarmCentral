<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerAdd.aspx.cs" Inherits="ST10120832Task2.FarmerAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- 
      Code Attribution
    This was taken from dotnetguts
    https://dotnetguts.blogspot.com/2007/09/applying-css-to-aspnet-application.html
        -->
    <link href = "Style/StyleSheet1.css" rel="Stylesheet" type= "text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
        <asp:Label ID="lblHeader" runat="server" Text="Hi Farmer [name]" CssClass="header"></asp:Label>
            </div>
        <br />
        <br />

            <div class="center">
        Here you can add your new products to the system<br />
            </div>
        <br />
            <div class="center">
        <table ID="Table1" class="center" runat="server">
            <tr>
                <td>
                    Name of Product:<br />
                    <asp:TextBox ID="txtNameOfProduct" runat="server" Height="40px" Width="200px"></asp:TextBox>
                </td>
                <td>
                    Type of Product:<br />
                    <asp:TextBox ID="txtProductType" runat="server" Height="40px" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    Date:<br />
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" Height="40px" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <br />
                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" CssClass="Buttons Buttons:hover" Height="40px" Width="150px" />
                </td>
            </tr>
        </table>      
                </div>
        <br />
         <br />
        <br />

        <br />
        <div class="center">
        <asp:Label ID="Label1" runat="server" Text="Products:"></asp:Label>
            </div>
        <br />
        <div class="center">
        <asp:GridView ID="gvProducts" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" ForeColor="#333333" GridLines="None" Height="350px" Width="600px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="nameOfProduct" HeaderText="nameOfProduct" SortExpression="nameOfProduct" />
                <asp:BoundField DataField="typeOfProduct" HeaderText="typeOfProduct" SortExpression="typeOfProduct" />
                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="FarmerID" HeaderText="FarmerID" SortExpression="FarmerID" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FarmerConnectionString %>" SelectCommand="SELECT * FROM [FarmerProducts]">
        </asp:SqlDataSource>
            </div>
        <br />

        <p class="center">
        Enter the ID below to delete that product (ID can be found under ID in the above table)</p>
            <p class="center">
        <asp:TextBox ID="txtDelete" runat="server" Height="39px" Width="200px"></asp:TextBox></p>
            <p class="center">
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CssClass="Buttons Buttons:hover" Height="40px" Width="150px" /></p>


        <br />
        <br />
        <div class="center">
        <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Return" CssClass="Buttons Buttons:hover" Height="40px" Width="150px"/>

        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" CssClass="Buttons Buttons:hover " Height="40px" Width="150px" />
            </div>
    </form>
</body>
</html>
