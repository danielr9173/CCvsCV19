using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IP_TermProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection dbUser = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlConnection dbAdmin = new SqlConnection(SqlDataSource2.ConnectionString);
            SqlCommand cmdUser = new SqlCommand();
            SqlCommand cmdAdmin = new SqlCommand();
            cmdUser.CommandType = System.Data.CommandType.Text;
            cmdAdmin.CommandType = System.Data.CommandType.Text;
            cmdUser.CommandText = "SELECT count([User_Username]) FROM [Users] WHERE ([User_Username] = '" + txtUsername.Text + "')";                //This will return a 1 if the user/admin exists or 
            cmdAdmin.CommandText = "SELECT count([Admin_Username]) FROM [Administrators] WHERE ([Admin_Username] = '" + txtUsername.Text + "')";    //0 if the user/admin does not exist.
            cmdUser.Connection = dbUser;                                                                                                      
            cmdAdmin.Connection = dbAdmin;
            dbUser.Open();
            dbAdmin.Open();

            HttpCookie cookie = new HttpCookie("UserInfo");                  //This cookie will hold the users username.

            if (cmdUser.ExecuteScalar().Equals(1))      //The ExecuteScalar() returns the count number, if the username exists it will return a 1, if not a 0,
            {
                cmdUser.CommandText = "SELECT [User_Password] FROM [Users] WHERE ([User_Password] = '" + txtPassword.Text + "')"; //This will return the password of the  user/admin.
                
                try
                {
                    string passUser= cmdUser.ExecuteScalar().ToString().Replace(" ", ""); //convert the command to a string, and replace the white space that may occur in the string to get rid it.
                    if (passUser == txtPassword.Text)
                    {                 
                        Table1.Visible = false;
                        btnSubmit.Visible = false;                                  //Disable everything and display that it is 
                        Label3.Text = "Logging you in!";
                        Label3.ForeColor = System.Drawing.Color.Green;
                        Label3.Visible = true;

                        cmdUser.CommandText = "SELECT [User_FName] FROM [Users] WHERE ([User_Username] = '" + txtUsername.Text + "')";
                        cookie["First Name"] = cmdUser.ExecuteScalar().ToString();                                                      //This will have the users first name that is signing in.      
                        cmdUser.CommandText = "SELECT [User_LName] FROM [Users] WHERE ([User_Username] = '" + txtUsername.Text + "')";
                        cookie["Last Name"] = cmdUser.ExecuteScalar().ToString();                                                       //This will have the users last name that is signing in.  
                        Response.Cookies.Add(cookie);                                                                                   //Then add the cookie object to the user computer, this will 
                                                                                                                                        //be use to display the full name
                        Session["User"] = txtUsername.Text;

                        Timer1.Enabled = true;                                            //Add a simple 5 second delay
                    }
                }
                catch
                {
                    Label3.Text = "Invaild username or password. Please try again";
                    Label3.Visible = true;
                }
                finally
                {
                    dbUser.Close();                 //if the password is correct or not close the database.
                }

            }
            else if (cmdAdmin.ExecuteScalar().Equals(1))        //Check if its an admin
            {
                cmdAdmin.CommandText = "SELECT [Admin_Password] FROM [Administrators] WHERE ([Admin_Password] = '" + txtPassword.Text + "')";
                try
                {
                    string passAdmin= cmdAdmin.ExecuteScalar().ToString().Replace(" ", ""); //convert the command to a string, and replace the white space that may occur in the string to get rid it it.
                    if (passAdmin == txtPassword.Text)
                    {
                        Table1.Visible = false;
                        btnSubmit.Visible = false;                                  //Disable everything and display that it is successful
                        Label3.Text = "Logging you in!";
                        Label3.ForeColor = System.Drawing.Color.Green;
                        Label3.Visible = true;

                        cmdAdmin.CommandText = "SELECT [Admin_FName] FROM [Administrators] WHERE ([Admin_Username] = '" + txtUsername.Text + "')";
                        cookie["First Name"] = cmdAdmin.ExecuteScalar().ToString();                                                      //The cookie will have the users first name that is signing in.      
                        cmdAdmin.CommandText = "SELECT [Admin_LName] FROM [Administrators] WHERE ([Admin_Username] = '" + txtUsername.Text + "')";
                        cookie["Last Name"] = cmdAdmin.ExecuteScalar().ToString();                                                       //The cookie will have the users last name that is signing in.  
                        Response.Cookies.Add(cookie);                                                                                   //Then add the cookie object to the admins computer, this will 
                                                                                                                                        //be use to display the full name
                        Session["Admin"] = txtUsername.Text;

                        Timer2.Enabled = true;                                       //Add a simple 5 second delay
                    }
                    else
                    {
                        Label3.Text = "Invaild username or password. Please try again";  //if not display the label.
                        Label3.Visible = true;
                    }
                }
                catch
                {
                    Label3.Text = "An error occured when authorizing your account. Please try again";
                    Label3.Visible = true;
                }
                finally
                {
                    dbAdmin.Close();                 //if the password is correct or not close the database.
                }
            }
            else
            {
                Label3.Text = "Invaild username or password. Please try again";      //if not right username display the label.
                Label3.Visible = true;
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void Timer2_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/Administrators/AdminHome.aspx");
        }
    }
}