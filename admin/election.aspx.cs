using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CSP1.admin
{
    public partial class election : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand insert = new SqlCommand("INSERT into AspNetUserRoles(UserId, RoleId) values(@UserId, @RoleId)", conn);
            insert.Parameters.AddWithValue("@UserId", ddl_user.SelectedValue);
            insert.Parameters.AddWithValue("@RoleId", ddl_user.SelectedValue);

            try
            {

                insert.ExecuteNonQuery();

            }



            catch (Exception ex)
            {
                lbl_msg.Text = "Error: " + ex.Message;


            }

            conn.Close();
        }
    }
}