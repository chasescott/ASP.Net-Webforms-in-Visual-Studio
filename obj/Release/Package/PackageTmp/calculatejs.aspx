<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="calculatejs.aspx.cs" Inherits="CSP1.calculatejs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function doCalculate()
        {
            var num1 = parseInt(document.getElementById("tb1").value);
            var num2 = parseInt(document.getElementById("tb2").value);
            var num3 = num1 + num2;
            document.getElementById("tb3").value = num3;
        }

        </script>

    
    <p>
        <br />
       <input type="text" id="tb1" />
        <br />
       <input type="text" id="tb2" />
        <br />
        <a class="btn btn-default" onclick="doCalculate()">Calculate</a>
        <br />
        <input type="text" id="tb3" />
        <br />
    </p>
    <p>
        
    </p>
</asp:Content>
