using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using CSP1.Models;
using System.Data.SqlClient;

namespace CSP1.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcs16adlConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand insert = new SqlCommand("insert into UserProfile(fkUserName, Pic, Location, Biography, Awards, Inspiration, Style, Freelance, Website, Name) values(@UserName, @Pic, @Location, @Biography, @Awards, @Inspiration, @Style, @Freelance, @Website, @Name)", conn);
                insert.Parameters.AddWithValue("@UserName", Email.Text);
                insert.Parameters.AddWithValue("@Pic", "Images/nophoto.jpg");
                insert.Parameters.AddWithValue("@Location", "City, Country");
                insert.Parameters.AddWithValue("@Biography","Full biography details");
                insert.Parameters.AddWithValue("@Awards", "Details of any awards or noteworthy projects");
                insert.Parameters.AddWithValue("@Inspiration", "Who inspires you?");
                insert.Parameters.AddWithValue("@Style", "What is your style?");
                insert.Parameters.AddWithValue("@Freelance", "Freelance availability information");
                insert.Parameters.AddWithValue("@Website", "Portfolio/Website URL");
                insert.Parameters.AddWithValue("@Name", "Any other names/aliases");

                try
                {
                    conn.Open();
                    insert.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    lbl_msg.Text = "Error: " + ex.Message;
                    conn.Close();
                }

                

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}