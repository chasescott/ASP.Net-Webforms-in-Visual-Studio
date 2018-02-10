<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNew.aspx.cs" Inherits="CSP1.ArtworkAddNewTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    
    

    <asp:PlaceHolder ID="pHolder1" runat="Server">
        <div class="row"><div class="col-md-12"><h4>Please <a href="Account/Login.aspx">login/register</a> to contribute content.</h4></div></div>
        </asp:PlaceHolder>
    
    <asp:PlaceHolder ID="pHolder2" runat="Server">
    <div class="row">
        <br />
    <div class ="col-md-2">Title:</div><div class ="col-md-4"><asp:TextBox ID="tbTitle" runat="server"></asp:TextBox></div>
        </div><br />
    <div class="row">
        <div class ="col-md-2">Concept:</div><div class ="col-md-4"><asp:TextBox ID="tbConcept" runat="server" TextMode="MultiLine" Height="101px" Width="401px"></asp:TextBox></div>
    </div><br />
    <div class="row">
        <div class ="col-md-2">Artist:</div><div class ="col-md-4"><asp:TextBox ID="tbDesigner" runat="server"></asp:TextBox></div>
    </div><br />
    <%--<div class="row">
        <div class ="col-md-2">Date Artwork Created:</div><div class ="col-md-4"><asp:TextBox ID="tbDateOfArtwork" runat="server" Height="22px" TextMode="DateTime"></asp:TextBox></div>
    </div><br />--%>
    <div class="row">
        <div class ="col-md-2">Add Design:</div><div class ="col-md-4"><asp:FileUpload ID="fupIMG" runat="server" /></div>
    </div><br />
    <div class="row">
        &nbsp;</div>
        <div class="row">
            <div class ="col-md-3">Select Up To 3 Key Colours:</div>
            <div class ="col-md-3">
            <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Selected="True">None</asp:ListItem>
        <asp:ListItem>Black</asp:ListItem>
        <asp:ListItem>Blue</asp:ListItem>
        <asp:ListItem>Chartreuse</asp:ListItem>
        <asp:ListItem>Green</asp:ListItem>
        <asp:ListItem>Grey</asp:ListItem>
        <asp:ListItem>Multi</asp:ListItem>
        <asp:ListItem>Orange</asp:ListItem>
        <asp:ListItem>Pink</asp:ListItem>
        <asp:ListItem>Purple</asp:ListItem>
        <asp:ListItem>Red</asp:ListItem>
        <asp:ListItem>White</asp:ListItem>
        <asp:ListItem>Yellow</asp:ListItem>
    </asp:DropDownList>    
            </div>
            <div class ="col-md-3">
            <asp:DropDownList ID="DropDownList2" runat="server">
        <asp:ListItem Selected="True">None</asp:ListItem>
        <asp:ListItem>Black</asp:ListItem>
        <asp:ListItem>Blue</asp:ListItem>
        <asp:ListItem>Chartreuse</asp:ListItem>
        <asp:ListItem>Green</asp:ListItem>
        <asp:ListItem>Grey</asp:ListItem>
        <asp:ListItem>Multi</asp:ListItem>
        <asp:ListItem>Orange</asp:ListItem>
        <asp:ListItem>Pink</asp:ListItem>
        <asp:ListItem>Purple</asp:ListItem>
        <asp:ListItem>Red</asp:ListItem>
        <asp:ListItem>White</asp:ListItem>
        <asp:ListItem>Yellow</asp:ListItem>
    </asp:DropDownList>    
            </div>
            <div class ="col-md-3">
            <asp:DropDownList ID="DropDownList3" runat="server">
        <asp:ListItem Selected="True">None</asp:ListItem>
        <asp:ListItem>Black</asp:ListItem>
        <asp:ListItem>Blue</asp:ListItem>
        <asp:ListItem>Chartreuse</asp:ListItem>
        <asp:ListItem>Green</asp:ListItem>
        <asp:ListItem>Grey</asp:ListItem>
        <asp:ListItem>Multi</asp:ListItem>
        <asp:ListItem>Orange</asp:ListItem>
        <asp:ListItem>Pink</asp:ListItem>
        <asp:ListItem>Purple</asp:ListItem>
        <asp:ListItem>Red</asp:ListItem>
        <asp:ListItem>White</asp:ListItem>
        <asp:ListItem>Yellow</asp:ListItem>
    </asp:DropDownList>    
            </div>

        </div><br />
    <div class="row">
        &nbsp;</div>
    <div class="row">
        <div class ="col-md-12"><asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
    </div></div><br />
    <div class="row">
        <div class ="col-md-12">
        <asp:Label ID="lbl_msg" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
            </div>
    </div><br />

        </asp:PlaceHolder>
</asp:Content>
