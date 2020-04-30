using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IP_TermProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)                //Checks if a user is signed in
            {
                Drop_Off.Visible = true;
                btnStart.Visible = false;
            }
            else
            {
                Drop_Off.Visible = false;
                btnStart.Visible = true;
            }
        }
    }
}