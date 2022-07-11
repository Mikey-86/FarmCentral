<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ST10120832Task2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href ="Style/StyleSheet1.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="center header">
            Welcome!
            <br />
            Please enter you login details below:<br />
            <br />
            <br />
            <br />
        </div>
        <p class="center">
        <asp:Label ID="Label1" runat="server" Text="ID Number" ></asp:Label></p>
        
        <p class="center">
        <asp:TextBox ID="txtID" runat="server" CssClass="Textbox" Height="40px" Width="280px"></asp:TextBox></p>
        <br />
        <br />
        <p class="center">
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></p>
            <p class="center">
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="Textbox" Height="40px" Width="280px"></asp:TextBox></p>
        <br />
        <br />
        <p class="center">
        <asp:Button ID="btnEnter" runat="server" Text="Enter" OnClick="btnEnter_Click" CssClass="Buttons Buttons:hover" Height="40px" Width="280px"/></p>
            
    </form>
</body>
</html>
