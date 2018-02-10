<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List2.aspx.cs" Inherits="CSP1.List2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" GroupItemCount="3">
        <AlternatingItemTemplate>
            <td runat="server" style="">

<div class="row">
  <div class="col-sm-6 col-md-4">
    <div class ="thumbnail">
      <img src="<%# Eval("PDF") %>"  style="border:2px solid black;" " alt="...">
      
          </div>
          <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      </div>
    
  </div>
</div>
<ListView.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)></ListView.AutoResizeColumns>


            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="">Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />Title:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />Concept:
                <asp:TextBox ID="ConceptTextBox" runat="server" Text='<%# Bind("Concept") %>' />
                <br />Designer:
                <asp:TextBox ID="DesignerTextBox" runat="server" Text='<%# Bind("Designer") %>' />
                <br />DateofArtwork:
                <asp:TextBox ID="DateofArtworkTextBox" runat="server" Text='<%# Bind("DateofArtwork") %>' />
                <br />PDF:
                <asp:TextBox ID="PDFTextBox" runat="server" Text='<%# Bind("PDF") %>' />
                <br />
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
            <td runat="server" style="">Title:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />Concept:
                <asp:TextBox ID="ConceptTextBox" runat="server" Text='<%# Bind("Concept") %>' />
                <br />Designer:
                <asp:TextBox ID="DesignerTextBox" runat="server" Text='<%# Bind("Designer") %>' />
                <br />DateofArtwork:
                <asp:TextBox ID="DateofArtworkTextBox" runat="server" Text='<%# Bind("DateofArtwork") %>' />
                <br />PDF:
                <asp:TextBox ID="PDFTextBox" runat="server" Text='<%# Bind("PDF") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /></td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="">

<div class="row">
  <div class="col-sm-6 col-md-4">
    <div class ="thumbnail">
      <img src="<%# Eval("PDF") %>" style="border:2px solid black;" alt="...">
      
          </div>
          <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      </div>
    
  </div>
</div>
                <ListView.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)></ListView.AutoResizeColumns>
            </td>
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
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />Title:
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                <br />Concept:
                <asp:Label ID="ConceptLabel" runat="server" Text='<%# Eval("Concept") %>' />
                <br />Designer:
                <asp:Label ID="DesignerLabel" runat="server" Text='<%# Eval("Designer") %>' />
                <br />DateofArtwork:
                <asp:Label ID="DateofArtworkLabel" runat="server" Text='<%# Eval("DateofArtwork") %>' />
                <br />PDF:
                <asp:Label ID="PDFLabel" runat="server" Text='<%# Eval("PDF") %>' />
                <br /></td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT * FROM [ArtworkTest]"></asp:SqlDataSource>
</asp:Content>
