using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Data.SqlClient;


namespace CSP1
{
    public partial class ArtworkAddNewTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                pHolder1.Visible = true;
                pHolder2.Visible = false;
            }
            else
            {
                pHolder1.Visible = false;
                pHolder2.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string existingFileName = fupIMG.FileName;

            string imagesFolder = Server.MapPath("Images");

            if (fupIMG.HasFile)
            { fupIMG.SaveAs(imagesFolder + "/" + existingFileName); }

            

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insert = new SqlCommand("insert into ArtworkTest(Title, Concept, Designer, DateofArtwork, PDF, Colour1, Colour2, Colour3, IDUser) values(@Title, @Concept, @Designer, @DateofArtwork, @PDF, @Colour1, @Colour2, @Colour3, @IDUser)", conn);       

            insert.Parameters.AddWithValue("@Title", tbTitle.Text);
            insert.Parameters.AddWithValue("@Concept", tbConcept.Text);
            insert.Parameters.AddWithValue("@Designer", tbDesigner.Text);
            insert.Parameters.AddWithValue("@PDF", "Images/" + fupIMG.FileName);
            insert.Parameters.AddWithValue("@DateofArtwork", DateTime.Now);
            insert.Parameters.AddWithValue("@Colour1", DropDownList1.SelectedItem.Text);
            insert.Parameters.AddWithValue("@Colour2", DropDownList2.SelectedItem.Text);
            insert.Parameters.AddWithValue("@Colour3", DropDownList3.SelectedItem.Text);
            insert.Parameters.AddWithValue("@IDUser", User.Identity.Name);
            try
            {
                conn.Open();
                insert.ExecuteNonQuery();
                tbTitle.Text = String.Empty;
                tbConcept.Text = String.Empty;
                tbDesigner.Text = String.Empty;
                DropDownList1.SelectedIndex = 0;
                DropDownList2.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                lbl_msg.Text = "Upload Successful";

            }
            catch (Exception ex)
            {
                lbl_msg.Text = "Error: " + ex.Message;
             
                conn.Close();
            }






        }
    }
}