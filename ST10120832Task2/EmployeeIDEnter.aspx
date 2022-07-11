<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeIDEnter.aspx.cs" Inherits="ST10120832Task2.EmployeeIDEnter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href ="Style/StyleSheet1.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center header">
            Please enter the farmers ID that you wish to see</div>
        <p class="center">
        <asp:TextBox ID="txtID" runat="server" Height="40px" Width="300px"></asp:TextBox>
            </p>
        <br />
        <p class="center">
        <asp:Button ID="btnEnter" runat="server" OnClick="btnEnter_Click" Text="Enter Details" CssClass="space Buttons Buttons:hover" Height="40px" Width="200px"/>
        <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Return" CssClass="Buttons Buttons:hover" Height="40px" Width="200px"/>
            </p>
    </form>
</body>
</html>
