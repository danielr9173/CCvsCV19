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
            if (Session["User"] != null)                        //Checks if a user is signed in
            {
                btnIn_Out.InnerHtml = "Log Out";                //Changes the sign in button to Log In
                btnIn_Out.HRef = "~/Users/LogOutPage.aspx";
                btnHome.HRef = "~/Users/HomePage.aspx";
                btnInfo.HRef = "~/Users/InfoPage.aspx";
                iconHome.HRef = "~/Users/HomePage.aspx";
            }
            else if (Session["Admin"] != null)                  //Check if a admin is signed in
            {
                btnIn_Out.InnerHtml = "Log Out";                //Changes the sign in button to Log In
                btnIn_Out.HRef = "~/Users/LogOutPage.aspx";
                btnInfo.HRef = "~/Users/InfoPage.aspx";

                btnHome.HRef = "~/Administrators/AdminHome.aspx"; //Changes the reference to the admin home page
                iconHome.HRef = "~/Administrators/AdminHome.aspx";
            }
            else
            {
                btnIn_Out.InnerHtml = "Sign In";
                btnIn_Out.HRef = "~/Users/SignInPage.aspx";     //Keep everything the same
                btnHome.HRef = "~/Users/HomePage.aspx";
                btnInfo.HRef = "~/Users/InfoPage.aspx";
                iconHome.HRef = "~/Users/HomePage.aspx";
            }
        }
    }
}