<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="election.aspx.cs" Inherits="CSP1.admin.election" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:DropDownList ID="ddl_user" runat="server" DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="Id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [Id], [UserName] FROM [AspNetUsers]"></asp:SqlDataSource>
Should have role
    <asp:DropDownList ID="ddl_role" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [AspNetRoles]"></asp:SqlDataSource>
    <br />

    <asp:Button ID="Button1" runat="server" Text="Give User Role" OnClick="Button1_Click" />

    <br />
    <asp:Label ID="lbl_msg" runat="server" Text="Label"></asp:Label>

</asp:Content>
