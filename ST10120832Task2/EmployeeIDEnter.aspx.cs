using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10120832Task2
{
    public partial class EmployeeIDEnter : System.Web.UI.Page
    {
        //This page asks the employee which farmer products they want to see, before moving to the next page (EmployeeView)
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            //Code Attribution
            //This was taken from StackOverflow
            //https://stackoverflow.com/questions/14368129/how-to-use-global-variables-in-c
            //Tommaso Belluzzo
            //https://stackoverflow.com/users/796085/tommaso-belluzzo
            //Adding value to global variables 
            Globals.IDFarmers = Convert.ToInt32(txtID.Text);
            Response.Redirect("EmployeeView.aspx");
            Response.Close();
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeLanding.aspx");
            Response.Close();
        }
    }
}