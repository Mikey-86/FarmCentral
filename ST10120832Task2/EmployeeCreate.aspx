<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeCreate.aspx.cs" Inherits="ST10120832Task2.EmployeeCreate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href ="Style/StyleSheet1.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <p class="center header">
            <asp:Label ID="lblHeader" runat="server" Text="User: [Name]"></asp:Label>
                </p>
            <br />
            </div>
            <p class="center header">
            You can create a Farmer here:<br />
                </p>
        <p class="center">
            <asp:Label ID="Label1" runat="server" Text="First Name: "></asp:Label>
        </p>
        <p class="center">
        <asp:TextBox ID="txtFirstName" runat="server" Height="40px" Width="200px"></asp:TextBox>
            </p>
        <p class="center">
            <asp:Label ID="Label2" runat="server" Text="Surname:"></asp:Label>
        </p>
        <p class="center">
            <asp:TextBox ID="txtSurname" runat="server" OnTextChanged="txtSurname_TextChanged" Height="40px" Width="200px"></asp:TextBox>
        </p>
        <p class="center">
        <asp:Label ID="Label3" runat="server" Text="Cell number:"></asp:Label>
            </p>
        <p class="center">
        <asp:TextBox ID="txtPhoneNum" runat="server" Height="40px" Width="200px"></asp:TextBox>
            </p>
            <p class="center">
        Farmer or Employee<br />
                </p>
        <p class="center">
        <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="200px">
            <asp:ListItem>Farmer</asp:ListItem>
            <asp:ListItem>Employee</asp:ListItem>
        </asp:DropDownList>
                </p>
        <p class="center">
            <asp:Label ID="Label4" runat="server" Text="Password:"></asp:Label>
        </p>
        <p class="center">
            <asp:TextBox ID="txtPassword" runat="server" Height="40px" Width="200px"></asp:TextBox>
        </p>
        <br />
        <p class="center">
        <asp:Button ID="btnEnter" runat="server" OnClick="btnEnter_Click" Text="Create User" Height="40px" Width="200px" CssClass="Buttons Buttons:hover"/>
           </p>
        <br /><br />
        <p class="center">
            <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Return" Height="40px" Width="200px" CssClass="Buttons Buttons:hover space"/>
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" Height="40px" Width="200px" CssClass="Buttons Buttons:hover"/>
        </p>
    </form>
</body>
</html>
