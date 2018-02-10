using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;

namespace CSP1
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadioButtonList1.Visible = false;

            if (!User.Identity.IsAuthenticated)
            {
                DiscussionForm.Visible = false;
                PlaceHolder2.Visible = false;
                
            }
           

            if (IsPostBack && RadioButtonList1.SelectedItem!=null)
            {
                int score = Convert.ToInt16(RadioButtonList1.SelectedValue);
                int thing = Convert.ToInt16(Request["ArtworkId"]);
                string id = User.Identity.GetUserId();
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                conn.Open();
                SqlCommand deleteCmd = new SqlCommand("DELETE FROM Ratings WHERE fk_User=@fk_User AND fk_Artwork = @thing", conn);
                deleteCmd.Parameters.AddWithValue("@fk_User", id);
                deleteCmd.Parameters.AddWithValue("@thing", thing);
                deleteCmd.ExecuteNonQuery();

                SqlCommand insertCmd = new SqlCommand("INSERT INTO Ratings (fk_User, Score, fk_Artwork) VALUES (@fk_User, @Score, @fk_Artwork)", conn);
                insertCmd.Parameters.AddWithValue("@fk_User", id);
                insertCmd.Parameters.AddWithValue("@Score", score);
                insertCmd.Parameters.AddWithValue("@fk_Artwork", thing);
                insertCmd.ExecuteNonQuery();

                conn.Close();
                //Response.Redirect("List.aspx");


            }



        }

      
        

        protected void btnCommentSubmit_Click(object sender, EventArgs e)
        {
            {

                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand insert = new SqlCommand("insert into Comments(Title, Body, Author, PostingTime, Image_FKid) values(@Title, @Body, @Author, @PostingTime, @Image_FKid)", conn);
                insert.Parameters.AddWithValue("@Title", tbCommentTitle.Text);
                insert.Parameters.AddWithValue("@Body", tbCommentBody.Text);
                insert.Parameters.AddWithValue("@Author", User.Identity.Name);
                insert.Parameters.AddWithValue("@PostingTime", DateTime.Now);
                insert.Parameters.AddWithValue("@Image_FKid", Request.QueryString["ArtworkID"]);
                conn.Open();


                try
                {
                    
                    insert.ExecuteNonQuery();

                }


            
                catch (Exception ex)
                {
                    lbl_msg.Text = "Error: " + ex.Message;

                    
                }

                conn.Close();

                Response.Redirect("Details.aspx?ArtworkID=" + Request.QueryString["ArtworkID"]);
            }
        }

        protected void btnNewTags_Click(object sender, EventArgs e)
        {      

            string[] newTags = tbNewTags.Text.Split(',');

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            for (int ct = 0; ct < CheckBoxList1.Items.Count; ct++)
            {
                //if (CheckBoxList1.Items[ct].Selected) Response.Write("-" + CheckBoxList1.Items[ct].Value);
                if (CheckBoxList1.Items[ct].Selected) connectTagAndImage(Convert.ToInt16(CheckBoxList1.Items[ct].Value), Convert.ToInt16(Request.QueryString["ArtworkID"]), conn);
            }

            if (tbNewTags.Text == "") return;
            foreach (string tag in newTags)
            {
                int id = getIdforTag(tag, conn);
                int imageId = Convert.ToInt16(Request.QueryString["ArtworkID"]);
                if (id>0)
                {
                    //Response.Write(tag + " is in the database");
                    connectTagAndImage(id, imageId, conn);
                }
                else //the tag isnt in the database?...
                {
                    int newTagId = addTagtoDb(tag, conn);
                    connectTagAndImage(newTagId, imageId, conn);
                }
                
            }

        }

        protected int addTagtoDb(string tag, SqlConnection conn)
        {
            string addTagsql = "INSERT INTO Tags(TagName) VALUES (@TagName)";
            SqlCommand sqlCmd = new SqlCommand(addTagsql, conn);
            sqlCmd.Parameters.AddWithValue("@TagName", tag);
            sqlCmd.ExecuteNonQuery();
            string lastRecordAddedSql = "SELECT TOP 1 Id from Tags ORDER BY Id DESC";
            SqlCommand sqlCmd2 = new SqlCommand(lastRecordAddedSql, conn);
            SqlDataReader sqldr = sqlCmd2.ExecuteReader();
            sqldr.Read();
            int retval = Convert.ToInt16(sqldr["Id"]);
            sqldr.Close();
            return retval;
        }

        protected void connectTagAndImage (int tagId, int imageId, SqlConnection conn)
        {
            string addTagImageConnectionSql = "INSERT INTO TagImageJunction(Tag_FKid, Image_FKid) VALUES (@Tag_FKid, @Image_FKid)";
            SqlCommand sqlCmd = new SqlCommand(addTagImageConnectionSql, conn);
            sqlCmd.Parameters.AddWithValue("@Tag_FKid", tagId);
            sqlCmd.Parameters.AddWithValue("@Image_FKid", imageId);
            sqlCmd.ExecuteNonQuery();

        }

        protected int getIdforTag(string tagName, SqlConnection conn)
        {
            int retval = -1;
            string findTagsql = "SELECT Id from Tags WHERE TagName=@TagName";
            SqlCommand sqlCmd = new SqlCommand(findTagsql, conn);
            sqlCmd.Parameters.AddWithValue("@TagName", tagName);
            SqlDataReader sqldr = sqlCmd.ExecuteReader();
            if (sqldr.HasRows)
            {
                sqldr.Read();
                retval =  Convert.ToInt16(sqldr["Id"]);
             }
             sqldr.Close();
             return retval;
            }
        }

    }
