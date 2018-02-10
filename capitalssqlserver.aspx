<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="capitalssqlserver.aspx.cs" Inherits="CSP1.capitalssqlserver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [country], [city] FROM [WorldCapitals]"></asp:SqlDataSource>
</asp:Content>
