<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="CSP1.Account.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <br />
        <div class="col-md-12">
        <asp:Image ID="Image1" runat="server" alt="" style="border:2px solid black; width:200px; vertical-align: middle;" class="img-responsive" />
        </div>
        <br />
        <div class="col-md-4">Upload New Profile Image:</div><div class="col-md-8"><asp:FileUpload ID="fuPic" runat="server" Width="400px" /></div>
<div class="col-md-4"></div><div class="col-md-8"></div>
    <div class="col-md-4">Name/Alias:  </div><div class="col-md-8"><asp:TextBox ID="tbName" runat="server" Width="400px"></asp:TextBox></div>
<div class="col-md-4"></div><div class="col-md-8"></div>
    <div class="col-md-4">City:  </div><div class="col-md-8"><asp:TextBox ID="tbLocation" runat="server" Width="400px"></asp:TextBox></div>
<div class="col-md-4"></div><div class="col-md-8"></div>
    <div class="col-md-4">Biography:  </div><div class="col-md-8"><asp:TextBox ID="tbBiography" runat="server" TextMode="MultiLine" Height="50px" Width="400px"></asp:TextBox></div>

    <div class="col-md-4">Awards/Noteworthy Projects:  </div><div class="col-md-8"><asp:TextBox ID="tbAwards" runat="server" TextMode="MultiLine" Height="50px" Width="400px"></asp:TextBox></div>

    <div class="col-md-4">Who inspires you?  </div><div class="col-md-8"><asp:TextBox ID="tbInspiration" runat="server" TextMode="MultiLine" Height="50px" Width="400px"></asp:TextBox></div>

    <div class="col-md-4">What is your style?  </div><div class="col-md-8"><asp:TextBox ID="tbStyle" runat="server" TextMode="MultiLine" Height="50px" Width="400px"></asp:TextBox></div>

    <div class="col-md-4">Do you work Freelance?  </div><div class="col-md-8"><asp:TextBox ID="tbFreelance" runat="server" Width="400px"></asp:TextBox></div>

        <div class="col-md-4"></div><div class="col-md-8"></div>

    <div class="col-md-4">Portfolio Link:  </div><div class="col-md-8"><asp:TextBox ID="tbWebsite" runat="server" Width="400px"></asp:TextBox></div>
    </div>
    
    <br />
    <asp:Button ID="Button1" runat="server" Text="Update Profile" OnClick="Button1_Click" />
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
</asp:Content>
