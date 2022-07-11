<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarmerLanding.aspx.cs" Inherits="ST10120832Task2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href ="Style/StyleSheet1.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center header">
            &nbsp;<asp:Label ID="lblHeader" runat="server" Text="Hi Farmer [Name] " ></asp:Label>
            <br />
            <br />
        </div>
        <div class="center">
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add / View Products" CssClass="Buttons Buttons:hover" Height="40px" Width="280px"/>
            </div>
        <br />
        <br />
        <div class="center">
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" CssClass="Buttons Buttons:hover" Height="40px" Width="280px"/>
        </div>
    </form>
</body>
</html>
