﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSP1
{
    public partial class general : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Administrator"))
            { Response.Redirect("Default.aspx"); }
        }
    }
}