<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeLanding.aspx.cs" Inherits="ST10120832Task2.EmployeeLanding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href ="Style/StyleSheet1.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <asp:Label ID="lblHeader" runat="server" Text="Hi [Name here]" CssClass="header"></asp:Label>
            <br />
            <br />
        </div>
        <p class="center">
        <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create" CssClass="Buttons Buttons:hover space" Height="40px" Width="240px"/>
            
        
        <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" Text="View Farmer Products" CssClass="Buttons Buttons:hover space" Height="40px" Width="240px"/>
            
            
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Logout" CssClass="Buttons Buttons:hover" Height="40px" Width="240px"/>
            </p>
    </form>
</body>
</html>
