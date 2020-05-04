using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace IP_TermProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT INTO [Users] ([User_Username],[User_Password],[User_Email],[User_FName],[User_LName]) VALUES ('"
                                + txtUserName.Text + "','" + txtPassword.Text + "','" + txtEmail.Text + "','" + txtFirstName.Text + "','" + txtLastName.Text + "')";
            cmd.Connection = db;
            db.Open();

            try
            {
                if (Page.IsValid)
                {
                    cmd.ExecuteNonQuery();

                    Table1.Visible = false;
                    btnSubmit.Visible = false;                                  //Disable everything and display that it is successful
                    Label9.Text = "Your account was successfully created! Returning to Home page";
                    Label9.ForeColor = System.Drawing.Color.Green;
                    Label9.Visible = true;
                    Timer1.Enabled = true;   //Add a simple 5 second delay
                }
            }
            catch
            {
                Label9.Text = "An error occured when creating your account";
                Label9.Visible = true;
            }
            finally
            {
                db.Close();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");        //Return to the home page
        }

        protected void cusCustom_ServerValidate(object source, ServerValidateEventArgs args)
        {
            char startletter = args.Value.ToCharArray().ElementAt(0);

            if (args.Value.Length > 8 && args.Value.Any(char.IsDigit) && args.Value.Any(char.IsLower)
                && args.Value.Any(char.IsUpper) && char.IsLetter(startletter))                          //This checks if the user has inputted a proper password for their account
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}