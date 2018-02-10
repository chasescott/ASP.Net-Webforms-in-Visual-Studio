using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CSP1.admin
{
    public partial class removeComments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            

            foreach (ListItem li in CheckBoxList1.Items)
            {
                if (li.Selected)
                {
                    SqlCommand delSql = new SqlCommand("DELETE from Comments WHERE Id=@Id", conn);
                    delSql.Parameters.AddWithValue("@Id", li.Value);
                    delSql.ExecuteNonQuery();

                }
            }

            conn.Close();
            Response.Redirect("removeComments.aspx");
        }
    }
}