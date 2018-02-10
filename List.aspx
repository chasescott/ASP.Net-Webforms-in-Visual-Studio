<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="CSP1.ArtworkTest" %>
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
  max-width: 200px;
  height: auto;
  border:2px solid black;
  border-radius: 6px;
  margin:0 auto;

}

  .img-respo1:hover {
            display: block;
  max-width: 200px;
  height: auto;
  border:2px solid lightgrey;
  border-radius: 6px;
  margin:0 auto;
  transition-duration:0.5s;

       }

    </style>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [Id], [Title], [Concept], [Designer], [DateofArtwork], [PDF] FROM [ArtworkTest]"></asp:SqlDataSource>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
            <div style ="border-bottom:1px solid black;">
            <span style="">

                <div class="row">
                    <div class="col-md-1">  </div>
  <div class="col-md-4">
    
        <a href="Details.aspx?ArtworkID=<%# Eval("Id") %>"><img src="<%# Eval("PDF") %>" alt="View Details" class="img-respo1 img-center2;"></a>
  </div>
  <div class="col-md-4">
    
        <div class="caption">
            <div style="text-align:center;">
          <p><h4><%# Eval("Title") %></h4></p>
          <p>designed by <%# Eval("Designer") %></p>
          <p><input value ="<%# Eval("AverageScore") %>" type="number" class="rating" min=0 max =5 step=0.2 data-size="sm" data-readonly="true"/> </p>
        </div>
            </div>
      </a>
    
  </div>
  <div class="col-md-2">   <div style="text-align:center;"><p></p><p>
        <a href="Details.aspx?ArtworkID=<%# Eval("Id") %>" class="btn btn-primary" role="button">View Details</a></p>
        </div>
      </a>
    </div>
                    <div class="col-md-1">  </div>
 </div>
</div>

<SeparatorTemplate>
    
</SeparatorTemplate>

            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            
              
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            


        </InsertItemTemplate>
        <ItemTemplate>
            <div style ="border-bottom:1px solid black;">
            <span style="">

                <div class="row">
                    <div class="col-md-1">  </div>
  <div class="col-md-4">
    
        <a href="Details.aspx?ArtworkID=<%# Eval("Id") %>"><img src="<%# Eval("PDF") %>" alt="View Details" class="img-respo1 img-center2;"></a>
  </div>
  <div class="col-md-4">
    
        <div class="caption">
            <div style="text-align:center;">
          <p><h4><%# Eval("Title") %></h4></p>
          <p>designed by <%# Eval("Designer") %></p>
           <p><input value ="<%# Eval("AverageScore") %>" type="number" class="rating" min=0 max =5 step=0.2 data-size="sm" data-readonly="true"/> </p>
        </div>
            </div>
      </a>
    
  </div>
  <div class="col-md-2"><div style="text-align:center;"><p></p>   <p>
        <a href="Details.aspx?ArtworkID=<%# Eval("Id") %>" class="btn btn-primary" role="button">View Details</a></p>
        </div>
      </a>
    </div>
                    <div class="col-md-1">  </div>
 </div>
</div>
<SeparatorTemplate>
    
</SeparatorTemplate>
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
           

        </SelectedItemTemplate>
    </asp:ListView>

    

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT * FROM [ArtworkTestPlusRatings]"></asp:SqlDataSource>

    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">

    <asp:DataPager ID="DataPager1" runat="server" HorizontalAlign="center" PagedControlID="ListView1">
           <Fields>
               <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
               <asp:NumericPagerField />
           </Fields>
       </asp:DataPager>

 </asp:Panel>

</asp:Content>