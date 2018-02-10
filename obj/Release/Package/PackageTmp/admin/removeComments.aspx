<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="removeComments.aspx.cs" Inherits="CSP1.admin.removeComments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    This page is for removing comments.<br />
    <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Title" DataValueField="Id">
    </asp:CheckBoxList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [Id], [Title] FROM [Comments]"></asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete Comments" />
    <br />
    <br />
</asp:Content>
