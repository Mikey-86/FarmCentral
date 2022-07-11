<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeView.aspx.cs" Inherits="ST10120832Task2.EmployeeView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href ="Style/StyleSheet1.css" rel="StyleSheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p class="center header">
            <asp:Label ID="lblHeader" runat="server" Text="User: [Name]"></asp:Label>
                <p />
            <br />
                <p class="center header">
            You can search for Farmer Products here<br />
                </p>
            <br />
        </div>
        <div class="center">
        <asp:GridView ID="gvProducts" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ID" CellPadding="4" ForeColor="#333333" GridLines="None">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FarmerConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [FarmerProducts]"></asp:SqlDataSource>
            </div>
        <br />
        <p class="center">
        <asp:Label ID="Label1" runat="server" Text="Filters:"></asp:Label>
        <br />
        <asp:Label ID="lblType" runat="server" Text="Select the type of Product, then click apply:"></asp:Label>
            </p>
&nbsp;<p class="center">
&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="typeOfProduct" DataValueField="typeOfProduct" Height="40px" Width="150px">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnProductFilter" runat="server" style="margin-bottom: 0px" Text="Apply Product Filter" OnClick="btnProductFilter_Click" CssClass="Buttons Buttons:hover" Height="40px" Width="200px"/>
        </p>
        <p class="center">
            <asp:Label ID="lblDate" runat="server" Text="Select Dates, then click apply:"></asp:Label>
        </p>
        <p class="center">
            <asp:Label ID="Label2" runat="server" Text="Start Date"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="End Date"></asp:Label>
        </p>
        <p class="center">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" Height="40px" Width="150px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" Height="40px" Width="150px"></asp:TextBox>
            <p />
            <p class="center">
            <asp:Button ID="btnDateFilter" runat="server" Text="Apply Date Filter" Width="200px" OnClick="btnDateFilter_Click" CssClass="Buttons Buttons:hover spaceLeft" Height="40px"/>
        </p>
        <p class="center">
            <asp:Button ID="btnReturn" runat="server" Text="Return" OnClick="btnReturn_Click" CssClass="Buttons Buttons:hover space" Height="40px" Width="150px"/>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="Buttons Buttons:hover" Height="40px" Width="150px"/>
        </p>
    </form>
</body>
</html>
