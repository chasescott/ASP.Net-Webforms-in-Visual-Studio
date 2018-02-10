using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace CSP1
{
    public partial class ArtistSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void Search(object sender, EventArgs e)
        {
            this.BindGrid();
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT Designer FROM vwDistinctDesigners WHERE Designer LIKE '%' + @Designer + '%'";
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("Designer", txtSearch.Text.Trim());
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        GridView1.DataSourceID = null;
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}
