using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CSP1.Account
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( IsPostBack) return;
            string sql = "SELECT Pic, Location, Biography, Awards, Inspiration, Style, Freelance, Website, Name from UserProfile WHERE fkUserName=@fkUserName";
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand sqlCmd = new SqlCommand(sql, conn);
            conn.Open();
            sqlCmd.Parameters.AddWithValue("@fkUserName", User.Identity.Name);
            SqlDataReader sqlDr = sqlCmd.ExecuteReader();
            sqlDr.Read();
            Image1.ImageUrl= sqlDr["Pic"].ToString();
            tbLocation.Text = sqlDr["Location"].ToString();
            tbBiography.Text = sqlDr["Biography"].ToString();
            tbAwards.Text = sqlDr["Awards"].ToString();
            tbInspiration.Text = sqlDr["Inspiration"].ToString();
            tbStyle.Text = sqlDr["Style"].ToString();
            tbFreelance.Text = sqlDr["Freelance"].ToString();
            tbWebsite.Text = sqlDr["Website"].ToString();
            tbName.Text = sqlDr["Name"].ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string existingFileName = fuPic.FileName;

            string imagesFolder = Server.MapPath("Images");

            if (fuPic.HasFile)
            { fuPic.SaveAs(imagesFolder + "/" + existingFileName); }


            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert;
            if (fuPic.HasFile)
            {
                insert = new SqlCommand("UPDATE UserProfile SET Pic=@Pic, Location=@Location, Biography=@Biography, Awards=@Awards, Inspiration=@Inspiration, Style=@Style, Freelance=@Freelance, Website=@Website, Name=@Name WHERE fkUserName=@fkUserName", conn);
                insert.Parameters.AddWithValue("@Pic", "Images/" + fuPic.FileName);
            }
            else
            {
                insert = new SqlCommand("UPDATE UserProfile SET Location=@Location, Biography=@Biography, Awards=@Awards, Inspiration=@Inspiration, Style=@Style, Freelance=@Freelance, Website=@Website, Name=@Name WHERE fkUserName=@fkUserName", conn);


            }
            insert.Parameters.AddWithValue("@Location", tbLocation.Text);
            insert.Parameters.AddWithValue("@Biography", tbBiography.Text);
            //insert.Parameters.AddWithValue("@PDF", "Images/" + fupIMG.FileName);
            insert.Parameters.AddWithValue("@Awards", tbAwards.Text);
            insert.Parameters.AddWithValue("@Inspiration", tbInspiration.Text);
            insert.Parameters.AddWithValue("@Style", tbStyle.Text);
            insert.Parameters.AddWithValue("@Freelance", tbFreelance.Text);
            insert.Parameters.AddWithValue("@Website", tbWebsite.Text);
            insert.Parameters.AddWithValue("@Name", tbName.Text);
            insert.Parameters.AddWithValue("@fkUserName", User.Identity.Name);



            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
                Label1.Text = "Profile Updated!";
            }
            catch (Exception ex)
            {
                Label1.Text = "Error: " + ex.Message;

                conn.Close();
            }

            conn.Close();
            Response.Redirect("EditProfile.aspx");





        }
    }
}