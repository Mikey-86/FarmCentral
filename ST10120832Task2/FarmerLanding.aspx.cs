using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10120832Task2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //This page only deals with the direction theFarmer can take on the system. Add or view products, or logout
        protected void Page_Load(object sender, EventArgs e)
        {
            lblHeader.Text = "Hi Farmer, " + Globals.UserName + " " + Globals.UserSurname;
        }

        //Directs Farmer to FarmerAdd page
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("FarmerAdd.aspx");
            Response.Close();
        }

        //Directs user back to login page
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Response.Close();
        }
    }
}