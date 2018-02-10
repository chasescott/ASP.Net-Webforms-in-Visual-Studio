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
    public partial class SaveRating : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Single score = Convert.ToSingle(Request.Params["Score"]);
            int thing = Convert.ToInt16(Request.Params["Thing"]);
            string id = User.Identity.GetUserId();

            if (score == 0 || thing == 0 || id == "") return;

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
        }
    }
}