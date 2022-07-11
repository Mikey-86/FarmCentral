using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10120832Task2
{
    public partial class EmployeeLanding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code Attribution
            //This was taken from StackOverflow
            //https://stackoverflow.com/questions/14368129/how-to-use-global-variables-in-c
            //Tommaso Belluzzo
            //https://stackoverflow.com/users/796085/tommaso-belluzzo
            //Displaying user name
            lblHeader.Text = "Hi User, " + Globals.UserName + " " + Globals.UserSurname;
        }

        //Directs Employee user to Employee create page
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeCreate.aspx");
            Response.Close();
        }

        //Directs Employee user to Employee view page
        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeIDEnter.aspx");
            Response.Close();
        }

        //Directs Employee user back to Login page
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Response.Close();
        }
    }
}