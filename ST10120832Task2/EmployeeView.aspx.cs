using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10120832Task2
{
    public partial class EmployeeView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code Attribution
            //This was taken from StackOverflow
            //https://stackoverflow.com/questions/14368129/how-to-use-global-variables-in-c
            //Tommaso Belluzzo
            //https://stackoverflow.com/users/796085/tommaso-belluzzo
            //displaying user name
            lblHeader.Text = "User: " + Globals.UserName + " " + Globals.UserSurname;
            //To populate gridview
            this.BindGrid();
        }

        //Binding datagrid with farmers ID
        private void BindGrid()
        {
            using (FarmerEntities entity = new FarmerEntities())
            {
                gvProducts.DataSourceID = null;
                gvProducts.DataSource = (from FarmerProducts in entity.FarmerProducts
                                         where FarmerProducts.FarmerID == Globals.IDFarmers 
                                         select FarmerProducts).ToList();
               gvProducts.DataBind();
            }
        }

        //Returns the user to previous page (EmployeeIDEnter)
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeIDEnter.aspx");
            Response.Close();
        }

        //Returns the user to Login page
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Response.Close();
        }

        //Filter for Product type
        protected void btnProductFilter_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem != null)
            {
                //determines which value to filter by
                string selected = DropDownList1.SelectedItem.Text;

                //Databind of selected filters
                using (FarmerEntities entity = new FarmerEntities())
                {
                    gvProducts.DataSourceID = null;
                    gvProducts.DataSource = (from FarmerProducts in entity.FarmerProducts
                                             where FarmerProducts.FarmerID == Globals.IDFarmers 
                                             where FarmerProducts.typeOfProduct.Equals(selected)
                                             select FarmerProducts).ToList();
                    gvProducts.DataBind();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Filter parameter not specified, please try again" + "');", true);
            }
        }

        //Filters grid by date range specified 
        protected void btnDateFilter_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem != null)
            {
                //Code Attribution
                //This was taken from StackOverflow
                //https://stackoverflow.com/questions/45301550/how-to-show-date-in-textbox-which-type-is-date-in-asp-net
                //RMH
                //https://stackoverflow.com/users/7600246/rmh
                //Converting dates into Datetime values, so they can used
                var dateStart = DateTime.TryParse(txtStartDate.Text, out DateTime date) ? date : DateTime.Now;
                var dateEnd = DateTime.TryParse(txtEndDate.Text, out DateTime endDate) ? endDate : DateTime.Now;

                if (txtStartDate.Text != null && txtEndDate.Text != null)
                {
                    //Databind of selected filters
                    using (FarmerEntities entity = new FarmerEntities())
                    {
                        gvProducts.DataSourceID = null;
                        gvProducts.DataSource = (from FarmerProducts in entity.FarmerProducts
                                                 where FarmerProducts.FarmerID == Globals.IDFarmers
                                                 where FarmerProducts.date >= dateStart && FarmerProducts.date <= dateEnd
                                                 select FarmerProducts).ToList();
                        gvProducts.DataBind();
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Filter parameter not specified, please try again" + "');", true);
            }
        }

        protected void radType_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}