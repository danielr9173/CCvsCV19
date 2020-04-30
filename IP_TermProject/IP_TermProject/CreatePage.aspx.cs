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
                cmd.ExecuteNonQuery();

                Table1.Visible = false;
                btnSubmit.Visible = false;                                  //Disable everything and display that it is successful
                Label9.Text = "Your account was successfully created! Returning to Home page";
                Label9.ForeColor = System.Drawing.Color.Green;
                Label9.Visible = true;
                Timer1.Enabled = true;   //Add a simple 5 second delay
            }
            catch
            {
                Label9.Text = "An error occured when creating your account. Please try again";
                Label9.Visible = true;
            }
            finally
            {
                db.Close();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("/Homepage.aspx");        //Return to the home page
        }
    }
}