<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="CSP1.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <br />
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [Id], [Title], [Concept], [Designer], [DateofArtwork], [PDF] FROM [ArtworkTest] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="ArtworkID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <style>
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

       .img-center2 {margin:0 auto;}

    </style>

    
     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div style="border-style:solid;border-width:thin;">
                <td style="vertical-align: central; padding-right:19px; padding-left:19px;">
                <div class="row"><p></p>
                    
                <div class="col-md-1"> </div>
                <div class="col-md-3">
                    <div style="text-align:center;">
                <p><B>TITLE:  </B></p><p><%# Eval("Title") %> </p>
                <p><B>ARTIST:  </B></p><p><%# Eval("Designer") %> </p>
                        </div>
                </div>
                <div class="col-md-3">
                    <div style="text-align:center;">
                <p>
                   <B>CONCEPT:  </B></P><p> <%# Eval ("Concept") %></P>
                </div>
                    </div>
                <div class="col-md-4">

                    <a href="<%# Eval("PDF") %>" data-lightbox="<%# Eval ("PDF") %> %>" data-title="<%# Eval("Title") %> by <%# Eval("Designer") %>"><img src ="<%# Eval("PDF") %>" alt="Click to enlarge" class="img-respo1 img-center2;" /></a>
                    
                <p></p></div>
                    <div class="col-md-1"> </div>
                </div></td>
         </div>

                </ItemTemplate>
                </asp:Repeater>
       <br />
        <p></p>

        <asp:PlaceHolder ID="PlaceHolder2" runat="server">
        
    <div class="row; col-md-12;" style="border-style:solid;border-width:thin;">
        
        
    <div class="col-md-12"><h4><b>Select Tags</b></h4></div>
    <div class="col-md-2"></div>   
     <div class="col-md-8"><asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="TagName" DataValueField="Id" RepeatDirection="Horizontal" RepeatColumns="10" RepeatLayout="Table">
        </asp:CheckBoxList></div>
    <div class="col-md-2"></div>
          
    <p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT DISTINCT [Id], [TagName] FROM [Tags]"></asp:SqlDataSource>
    </p>
    <div class="row">
        <div class="col-md-12">
    <p>Add tags seperated by commas: <asp:TextBox ID="tbNewTags" runat="server" Width="323px"></asp:TextBox>
         <asp:Button ID="btnNewTags" runat="server" OnClick="btnNewTags_Click" Text="Add Tags" />
    </p></div>
        
          </div>
    </div>
    </asp:PlaceHolder>
  <br />
    <p></p>
    <asp:LoginView ID="LoginView1" runat="server"> 
<AnonymousTemplate><div class="row" style="border-style:solid;border-width:thin;">
    <div class="col-md-12"><h4><a href="Account/Login.aspx">Please register or log in to view comments, add comments, tag and rate.</a></h4></div>
    </div>
</AnonymousTemplate> 
<LoggedInTemplate>
   <div style="border-style: solid;border-width:thin;"> 
 <div class="col-md-12"><h4><b>Comments</b></h4></div>
    
    <asp:Repeater runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>
            
            <div class="row" style="border-bottom:1px thin black;">
                <div class="col-md-12"><b>Title:  </b><%# Eval("Title") %></div>
                <div class="col-md-12"><b>Date/Time:  </b><%# Eval("PostingTime") %></div>
                <div class="col-md-12"><b>Author:  </b><%# Eval("Author") %></div>
                <div class="col-md-12"><b>Comment:  </b><%# Eval("Body") %></div>
                </div>
                
            <p></p><p></p>
            <SeparatorTemplate>
    <hr />
</SeparatorTemplate>
            
        </ItemTemplate>
    </asp:Repeater>
        </div>
    </LoggedInTemplate> 
        </asp:LoginView>
        

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT [Title], [Body], [Author], [PostingTime], [Id], [Image_FKid] FROM [Comments] WHERE ([Image_FKid] = @Image_FKid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Image_FKid" QueryStringField="ArtworkID" Type="Int16" />
            </SelectParameters>
    </asp:SqlDataSource>
        
   
    <p></p>

    

    <asp:PlaceHolder ID="DiscussionForm" runat="server">
        <br />

        <div class="row;" style="align-content:center"> 

   <div class="col-md-12">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
    </asp:RadioButtonList></div>
 
            <div class="col-md-12"><h4><b>Rate:</b></h4></div>
            <div class="col-md-12">
       <input id="superRater" type="number" class="rating" min=0 max=5 step=0.2 data-size="md" />
       </div>
       </div>

<div class="col-md-12"><h4><b>Add Comments:</b></h4></div>
    <div class="col-md-4">Title</div>
    <div class="col-md-8"><asp:TextBox ID="tbCommentTitle" runat="server" Width="300px"></asp:TextBox></div>
    <br /><div class="col-md-4"> </div><div class="col-md-8"> </div>
     <div class="col-md-4">Comment</div><div class="col-md-8"><asp:TextBox ID="tbCommentBody" runat="server" Height="100px" TextMode="MultiLine" Width="300px"></asp:TextBox></div>
     <div class="col-md-12"> <p><asp:Button ID="btnCommentSubmit" runat="server" Text="Submit" OnClick="btnCommentSubmit_Click" /></p></div>
        <br />
 </div>





    </asp:PlaceHolder>

    <p>
        <asp:Label ID="lbl_msg" runat="server"></asp:Label>
    </p>
<p>

</p>
    <p>

    </p>
   
    <script>

        jQuery(document).ready(function(){
            $("#superRater").rating();
        });
        $("#superRater").on("rating.change", function (event, value, caption) {
            var aId = getUrlVars()["ArtworkID"];
            var rating = $("#superRater").val();

            $.get("SaveRating.aspx",
        {
            Thing: aId,
            Score: rating
        });
        
    
        });

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

</script>

     
</asp:Content>
