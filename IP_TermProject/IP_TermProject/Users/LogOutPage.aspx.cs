using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IP_TermProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();        //This will remove the user from the user session
            Session.Abandon();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");       //Go back to the homepage
        }
    }
}