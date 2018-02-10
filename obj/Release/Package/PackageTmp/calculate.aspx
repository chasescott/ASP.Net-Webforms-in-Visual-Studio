<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="calculate.aspx.cs" Inherits="CSP1.calculate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="First Number"></asp:Label>
        <asp:TextBox ID="tbNumber1" runat="server"></asp:TextBox>
    </p>
    <p>
        Second Number<asp:TextBox ID="tbNumber2" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button runat="server" OnClick="Button1_Click" Text="Add" />
    </p>
    <p>
        <asp:Label ID="lblResult" runat="server">Label</asp:Label>
    </p>
    <p>
    </p>
</asp:Content>
