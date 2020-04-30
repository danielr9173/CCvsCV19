using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IP_TermProject
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null || Session["Admin"] != null)                //Checks if a user is signed in
            {
                btnIn_Out.InnerHtml = "Log Out";
                btnIn_Out.HRef = "LogOutPage.aspx";
            }
            else
            {
                btnIn_Out.InnerHtml = "Sign In";
                btnIn_Out.HRef = "SignInPage.aspx";
            }
        }
    }
}