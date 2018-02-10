<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSP1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">  

    <style>

        body{
            background-image:url('Images/BG2.jpg'); position:center; background-color:white;
        }
        
        #jumbo {
          /* IE8 and below */
          background: rgba(255, 255, 255, 0.8);
          /* all other browsers */
          background: rgba(255, 255, 255, 0.8); 
        }
        #white {
          background: rgba(255, 255, 255, 0.8); 
        }

        .jumbotron2 {
  padding-top: 30px;
  padding-bottom: 30px;
  margin-bottom: 30px;
  color: inherit;
  background-color: rgba(255, 255, 255, 0.5); 
}
.jumbotron h1,
.jumbotron .h1 {
  color: inherit;
}
.jumbotron p {
  margin-bottom: 15px;
  font-size: 21px;
  font-weight: 200;
}
.jumbotron > hr {
  border-top-color: #d5d5d5;
}
.container .jumbotron,
.container-fluid .jumbotron {
  padding-right: 15px;
  padding-left: 15px;
  border-radius: 6px;
}
.jumbotron .container {
  max-width: 100%;
}
@media screen and (min-width: 768px) {
  .jumbotron {
    padding-top: 48px;
    padding-bottom: 48px;
  }
  .container .jumbotron,
  .container-fluid .jumbotron {
    padding-right: 60px;
    padding-left: 60px;
  }
  .jumbotron h1,
  .jumbotron .h1 {
    font-size: 63px;
  }
}

    </style>
    <br />
    <br />
    <br />
    <br />
    <section>
    
        <div class="jumbotron" id="jumbo">
            <div class="row">
                <div class="col-lg-10">
                    <h4>Hello, <%=User.Identity.Name%></h4>
                    <h1>Surface Pattern Design</h1>
                    <h2>The perfect opportunity for surface pattern designers to share designs and find inspiration...</h2>
                    <a href="List.aspx" class="btn btn-primary" role="button">Be Inspired...</a>
                    </div>
                </div>
            </div>
        </section>
    
</asp:Content>
