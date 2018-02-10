<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="CSP1.Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <strong>Overview</strong>
<p>After much consideration, I have decided to continue with my original plan to design an image sharing site that will cater to the surface pattern design community.  Surface Pattern Designers create repeatable patterns that can be used in a multitude of everyday materials such as wallpapers, interior fabrics, clothing textiles and so on.  I feel that this is a community that would respond well to a website like this because: <br />(a)	There is currently no website that caters solely for the sharing of images within the surface pattern design community and; <br />(b)	Surface pattern design is a wholly visual and textural branch of design.  As such, I feel that the community would respond well to an opportunity to share designs and images that inspire them.</P>
<br /><br />
<p><strong>Aesthetics</strong></P>
<p>As a website that would be used primarily by the design community, it is vital that is instantly visually appealing.  If not, any new visitors to the site would be instantly turned off.  Artists and designers are often as concerned about the ways in which their work is displayed as they are about the work itself.  A new surface pattern designer who visits the site will not be inclined to share their images if there is a garish coloured background which will clash with their images.  Bearing this in mind, I plan to implement the following visual design:
<br />1.	A subtle Bootstrap colour scheme in the navbar and any buttons together with simple black/white/grey font colour and backgrounds. 
<br />2.	A simple and uncomplicated Bootstrap theme. 
<br />3.	Crisp and uncomplicated fonts that do not detract from the imagery.
<br />4.	Removal of any obvious grid lines in the list.aspx page(s).
<br />5.	Use of repeaters where possible throughout the site to enable slicker appearances of pages.
<br />6.	Apply a thin black border to each image.  This is important as it will offer definition and contrast to the image rather than applying a borderless image straight onto a white background.  
<br />7.	Bootstrap image carousel where possible to enable artists to showcase multiple similar designs or variations of any given design.
<br />8.	Use of JavaScript libraries, specifically lightbox to enhance image selection.</P>
        <br /><br />

<p><strong>Functionality</strong></P>
<p>I believe that the following functionalities will be necessary for this website to be both appealing and useful to surface pattern designers:
<br />1.	RSS Feed to enable visitors to the site to see the top 10 most recent image additions to the website.
<br />2.	Ratings to enable users to rate each other’s images out of 5.  This should be limited to those who have signed up as a user.
<br />3.	Comments to give designers the opportunity to comment on one another’s work.  This should be limited to designers registered to the website only.
<br />4.	Tagging to give designers the opportunity to tag their artwork with certain tags relating to style, colour, influences and purpose (i.e. wallpaper, upholstery, fashion etc.).  This will also be open to other artists to tag another users artwork too.
<br />5.	User account facility and user profile pages to enable artists to create a profile page where they show artwork they have uploaded and ensure that artwork, comments and tagging can only be actioned by people who have joined the website.
<br />6.	Search facilities to enable visitors to the site to search by tags and keywords.
<br />7.	Option to “Share” images via social media and/or email a link.
<br />8.	An add new images facility that would enable designers to add images, assign tags or keywords but be limited to registered users.</P
        <br /><br />
<p><strong>Database Relationships</strong></P>
<p>I have assessed the relationship that will be required of the website and created an entity relationship diagram which can be found <a href="erd.aspx">here</a>.



    </p>
</asp:Content>
