<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberDetails.aspx.cs" Inherits="CSP1.Account.MemberDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
  border:2px solid black;
  border-radius: 6px;
  margin:0 auto;
  transition-duration:0.5s;

       }

       .img-center2 {margin:0 auto;}

    </style><br />
    <b><asp:Hyperlink ID="terug" NavigateUrl="~/Account/ViewMembers.aspx" Text="< Back to member list" runat="server" /></b>
    <br />
    <br />
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcs16adlConnectionString %>" SelectCommand="SELECT * FROM [UserProfile] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="Tag" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div style="border-style:solid;border-width:thin;">
                <td style="vertical-align: central; padding-right:19px; padding-left:19px;">
                <div class="row"><p></p>
                    
                <div class="col-md-1"> </div>
                <div class="col-md-6">
                    <div style="text-align:Left;">
                <p><B>Name:  </B></p><p><%# Eval("Name") %> </p> <br />
                <p><B>Location:  </B></p><p><%# Eval("Location") %> </p><br />
                <p><B>Biography:  </B></p><p><%# Eval("Biography") %> </p><br />
                <p><B>Awards:  </B></p><p><%# Eval("Awards") %> </p><br />
                <p><B>Inspiration:  </B></p><p><%# Eval("Inspiration") %> </p> <br />
                <p><B>Style:  </B></p><p><%# Eval("Style") %> </p><br />
                <p><B>Freelance:  </B></p><p><%# Eval("Freelance") %> </p><br />
                <p><B>Website:  </B></p><p><a href="<%# Eval("Website") %>"><%# Eval("Website") %></a></p><br />
                <p><B>Email:  </B></p><p><a href="mailto:<%# Eval("fkUserName") %>"><%# Eval("fkUserName") %></a></p><br />
                </div>
                </div>
                
                <div class="col-md-4">

                    <img src ="<%# Eval("Pic") %>" alt="" class="img-respo1 img-center2;" /></a>
                    
                <p></p></div>
                    <div class="col-md-1"> </div>
                </div></td>
         </div>

                </ItemTemplate>
                </asp:Repeater>
       <br />
        <p></p>

    



</asp:Content>
