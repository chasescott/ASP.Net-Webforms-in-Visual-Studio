<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistSearch.aspx.cs" Inherits="CSP1.ArtistSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    
    <div class="row">
        <div class="col-md-6">
    <p>
        <br />
    </p>
    All Submitted artists:<br />
    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" ConvertEmptyStringToNull="False">
        <AlternatingItemTemplate>
            <span style="">
                <div class="row;"><div class="col-md-12">
                 <a href="ByArtist.aspx?Tag=<%# Eval("Designer") %>">
                         <h5><%# Eval("Designer") %></h5>
                         </a></div></div>
</span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">TagName:
            <asp:TextBox ID="TagNameTextBox" runat="server" Text='<%# Bind("Designer") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Artist:
            <asp:TextBox ID="TagNameTextBox" runat="server" Text='<%# Bind("Designer") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="">
                <div class="row;"><div class="col-md-12">
                 <a href="ByArtist.aspx?Tag=<%# Eval("Designer") %>">
                         <h5><%# Eval("Designer") %></h5>
                         </a></div></div>
</span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">Artist:
            <asp:Label ID="TagNameLabel" runat="server" Text='<%# Eval("Designer") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [Designer] FROM [vwDistinctDesigners]"></asp:SqlDataSource>
    </p></div>
    
  <div class ="col-md-6">
    
<p>
        <br />
    </p>
      Search All Submitted Artists:
      <p>
        <br />
    </p>
<asp:TextBox ID="txtSearch" runat="server" />
<asp:Button Text="Search" runat="server" OnClick="Search" />
<hr />


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BorderStyle="None" AllowSorting="True" Width="179px">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="Designer" DataNavigateUrlFormatString="ByArtist?Tag={0}" DataTextField="Designer" HeaderText="Artist" />
            </Columns>
        </asp:GridView>
    
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [Designer] FROM [vwDistinctDesigners]"></asp:SqlDataSource>
    </p>
    </div>
    </div>





</asp:Content>
