using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IP_TermProject
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserCount.Text = UserGrid.Rows.Count.ToString();
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (UserGrid.SelectedRow == null)           //If nothing is selected don't display the detailsview.
            {
                UserDetails.Visible = false;
            }
            else
            {
                UserDetails.Visible = true;           //else display the detailsview.
            }
        }

        protected void UserDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            UserGrid.DataBind();
            UserGrid.SelectRow(-1);
        }

        protected void UserDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            UserGrid.DataBind();
            UserGrid.SelectRow(UserGrid.SelectedRow.RowIndex);
        }

        protected void UserDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            UserGrid.DataBind();
            UserGrid.SelectRow(-1);
        }
    }
}