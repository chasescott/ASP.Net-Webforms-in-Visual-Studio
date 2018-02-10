<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ColourSearch.aspx.cs" Inherits="CSP1.ColourSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    

    <style>
.divider
{
   border: 1px dotted #C5C5C5;
   height: 5px;
   margin-bottom: 15px;
   width: 100%;

}

.img-center2 {margin:0 auto;}

.img-rounded2 {
   display: block;
  max-width: 100%;
  height: auto;
  border:2px solid black;
  border-radius: 6px;
  margin:0 auto;
}

  .img-respo1 {
  display: block;
  max-width: 100px;
  height: auto;
  border:2px solid black;
  border-radius: 6px;
  margin:0 auto;

}

  .img-respo1:hover {
            display: block;
  max-width: 100px;
  height: auto;
  border:2px solid lightgrey;
  border-radius: 6px;
  margin:0 auto;
  transition-duration:0.5s;

       }

  table.test td { padding: 3px; } 

    </style>



     <br />
      <br />
    <div class="col-md-12"><h4><b>Filter By Colour</b></h4></div>
      <br />

    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <table width="20%" align="center" class="test"><tr>
        <td align="center">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="6">
        <AlternatingItemTemplate>

            <td runat="server" style=""><a href="ByColour.aspx?Tag=<%# Eval("Colour") %>"><img src="<%# Eval("Link") %>" alt="View Details" class="img-respo1 img-center2;"></a>
                <hr /></td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style=""><a href="ByColour.aspx?Tag=<%# Eval("Colour") %>"><img src="<%# Eval("Link") %>" alt="View Details" class="img-respo1 img-center2;"></a>
                <hr />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /></td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style=""><a href="ByColour.aspx?Tag=<%# Eval("Colour") %>"><img src="<%# Eval("Link") %>" alt="View Details" class="img-respo1 img-center2;"></a>
                <hr />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /></td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style=""><a href="ByColour.aspx?Tag=<%# Eval("Colour") %>"><img src="<%# Eval("Link") %>" alt="View Details" class="img-respo1 img-center2;"></a>
                <hr /></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style=""><a href="ByColour.aspx?Tag=<%# Eval("Colour") %>"><img src="<%# Eval("Link") %>" alt="View Details" class="img-respo1 img-center2;"></a>
                <br /></td>
        </SelectedItemTemplate>
    </asp:ListView>

            </td></tr></table>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT * FROM [vwColour]"></asp:SqlDataSource>

    </asp:Panel>


  

    <br />




</asp:Content>
