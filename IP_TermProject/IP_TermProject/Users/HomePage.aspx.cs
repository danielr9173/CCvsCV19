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
            HttpCookie cookie = Request.Cookies["UserInfo"];

            if (Session["User"] != null)                //Checks if a user is signed in
            {
                if (cookie != null)
                {
                    lblHeader.Text = "Welcome " + cookie["First Name"] + " " + cookie["Last Name"];
                    lblPara.Text = "<br /><br />So what do you say " + cookie["First Name"] + " " + cookie["Last Name"]
                                    + " lets start saving lives!";
                }

                Drop_Off.Visible = true;
                btnStart.Visible = false;
            }
            else
            {
                lblHeader.Text = "Corpus Christi needs your help!";
                lblPara.Text = "";
                Drop_Off.Visible = false;
                btnStart.Visible = true;
            }
        }
    }
}