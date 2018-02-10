<%@ Page Language="C#" ContentType="text/xml" AutoEventWireup="true" CodeBehind="rss.aspx.cs" Inherits="CSP1.rss" %>

<asp:Repeater ID="RepeaterRSS" runat="server">
        <HeaderTemplate>
           <rss version="2.0">
                <channel>
                    <title>Surface Pattern Design</title>
                    <link>http://jose.cs.herts.ac.uk/cs16adl/practice</link>
                    <description>
                    A community website for Surface Pattern Designers to discuss ideas and designs.
                    </description>
        </HeaderTemplate>
        <ItemTemplate>
            <item>
                <title><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Title")) %></title>
                <link>details.aspx?ArtworkId=<%# DataBinder.Eval(Container.DataItem, "Id") %></link>
                <designer><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Designer"))%></designer>
                <pubDate><%# String.Format("{0:R}", DataBinder.Eval(Container.DataItem, "DateofArtwork"))%></pubDate>
                <concept><%# RemoveIllegalCharacters(DataBinder.Eval(Container.DataItem, "Concept"))%></concept>
        </item>
        </ItemTemplate>
        <FooterTemplate>
                </channel>
            </rss>  
        </FooterTemplate>
</asp:Repeater>

