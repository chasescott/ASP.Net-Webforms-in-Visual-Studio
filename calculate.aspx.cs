using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSP1
{
    public partial class calculate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int number1;
            int number2;
            number1 = Int32.Parse(tbNumber1.Text);
            number2 = Int32.Parse(tbNumber2.Text);
            int number3 = number1 + number2;
            lblResult.Text = number3.ToString();
        }
    }
}