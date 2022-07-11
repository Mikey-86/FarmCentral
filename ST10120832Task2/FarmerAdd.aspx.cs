using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ST10120832Task2
{
    public partial class FarmerAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Displaying user name
            lblHeader.Text = "Hi Farmer, " + Globals.UserName + " " + Globals.UserSurname;
            //Populating gridview 
                this.BindGrid();   
        }

        //Binding datagrid with farmers ID
        private void BindGrid()
        {
            using(FarmerEntities entity = new FarmerEntities())
            {
                gvProducts.DataSourceID = null;
                gvProducts.DataSource = (from FarmerProducts in entity.FarmerProducts
                                         where FarmerProducts.FarmerID == Globals.IDFarmers select FarmerProducts).ToList();                                       
                gvProducts.DataBind();
            }
        }

        //Adding new farmer products when this button is pressed
        protected void Insert(Object sender, EventArgs e)
        {
            try
            {
                var entity = new FarmerEntities();
                var product = new FarmerProduct()
                {
                    nameOfProduct = txtNameOfProduct.Text,
                    typeOfProduct = txtProductType.Text,
                    date = DateTime.TryParse(txtDate.Text, out DateTime date) ? date : DateTime.Now,
                    FarmerID = Globals.IDFarmers
                };
                entity.FarmerProducts.Add(product);
                entity.SaveChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Product sucessfully added!" + "');", true);
                //Refreshing table
                BindGrid();
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "An error occured, please try again" + "');", true);
            }
        }

        //Returns to previous page
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("FarmerLanding.aspx");
            Response.Close();
        }

        //Logs the user out
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Response.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //Reteiving user entered value
            int value = Convert.ToInt32(txtDelete.Text);
            //DB model creation
            try
            {
                var entity = new FarmerEntities();

                var delete = (from FarmerProducts in entity.FarmerProducts
                             where FarmerProducts.FarmerID == Globals.IDFarmers
                             where FarmerProducts.ID == value
                             select FarmerProducts).FirstOrDefault();

                //Removing row
                entity.FarmerProducts.Remove(delete);
                entity.SaveChanges();

                //Popup to show sucessful deletion
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Patient Details Deleted Sucessfully!" + "');", true);
                BindGrid();

            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "An error occured, please try again" + "');", true);
            }
        }
    }
}