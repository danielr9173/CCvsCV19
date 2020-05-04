using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IP_TermProject.MasterPages
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["UserInfo"];            //Get the user cookie.

            if (cookie != null)
            {
                lblUser.Text = cookie["First Name"] + " " + cookie["Last Name"];            //Display the users name
                txtFullname.Text = cookie["First Name"] + " " + cookie["Last Name"];
            }

            lblControl.Text = Session["User"].ToString();
            Calendar1.Attributes.Add("style", "position:relative");           //Just for making the table a little nicer

            if (hasScheduledDates() && !Table1.Visible)                       //The hasScheduledDates() methond checks if the user
            {                                                                 //has scheduled table.
                Table1.Visible = false;
                btnTable.Visible = false;
                GridView1.Visible = true;                                     //Change the page to properly show correct content.
                btnSchedule.Visible = true;
            }
            else
            {
                Table1.Visible = true;
                btnTable.Visible = true;
                GridView1.Visible = false;
                btnSchedule.Visible = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string UserID=null, UserEmail=null;                                         //These are for getting the Users ID and Usersname

            SqlConnection dbUser = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlConnection dbSchedule = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = dbUser;
            dbUser.Open();

            try
            {
                cmd.CommandText = "SELECT [User_ID] FROM [Users] WHERE ([User_Username] = '" + Session["User"].ToString() + "')"; //Get the users ID
                UserID = cmd.ExecuteScalar().ToString();

                cmd.CommandText = "SELECT [User_Email] FROM [Users] WHERE ([User_Username] = '" + Session["User"].ToString() + "')"; //Get the users Email
                UserEmail = cmd.ExecuteScalar().ToString();
            }
            catch
            {

            }
            finally
            {
                dbUser.Close();         //Close the database
            }

            cmd.Connection = dbSchedule;
            dbSchedule.Open();

            try
            {
                cmd.CommandText = "INSERT INTO [Schedules] ([User_ID],[Sch_Username],[Sch_Email],[Sch_Item],[Sch_Date],[Sch_Status]) VALUES ('"
                                   + UserID + "','" + Session["User"].ToString() + "','" + UserEmail + "','" + ddlItem.SelectedValue + "','" + Calendar1.SelectedDate.ToString("MM/dd/yyyy") + "','Requested')";
                
                cmd.ExecuteNonQuery();

                if (Page.IsValid)
                {
                    Table1.Visible = false;                                     //Disable everything and display that it is successful
                    btnTable.Visible = false;
                    Label4.Text = "Your scheduling date has been successfully sent! Please check back later to see the status of the drop off date. Have a good day";
                    Label4.ForeColor = System.Drawing.Color.Green;
                    Label4.Visible = true;
                    Timer1.Enabled = true;                                      //Add a simple 5 second delay
                }
            }
            catch
            {

            }
            finally
            {
                dbSchedule.Close();         //Close the database
            }


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.IsOtherMonth || e.Day.Date < DateTime.Today || e.Day.Date == DateTime.Today)         //This is so that the user can't select a day that is 
            {                                                                                              //not on that month and on the same day and passed days.
                e.Day.IsSelectable = false;
            }
        }
        protected void Calendar1_PreRender(object sender, EventArgs e)
        {
            if(Calendar1.SelectedDate == default(DateTime))
                Calendar1.SelectedDate = DateTime.Today.AddDays(1);                   //Sets the next day to be the default day.
        }

        private Boolean hasScheduledDates()
        {
            SqlConnection dbSchedule = new SqlConnection(SqlDataSource1.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.Connection = dbSchedule;
            dbSchedule.Open();
            cmd.CommandText = "SELECT count(*) FROM [Schedules] WHERE ([Sch_Username] = '" + Session["User"].ToString() + "')";

            if ((int)cmd.ExecuteScalar() > 0)
                return true;
            else
                return false;
        }

        protected void btnSchedule_Click(object sender, EventArgs e)
        {
            Table1.Visible = true;
            btnTable.Visible = true;
            GridView1.Visible = false;          //Change the page to properly show correct content.
            btnSchedule.Visible = false;

        }
    }
}