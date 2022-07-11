using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace ST10120832Task2
{
    public partial class EmployeeCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Code Attribution
            //This was taken from StackOverflow
            //https://stackoverflow.com/questions/14368129/how-to-use-global-variables-in-c
            //Tommaso Belluzzo
            //https://stackoverflow.com/users/796085/tommaso-belluzzo
            //Displaying user name
            lblHeader.Text = "User: " + Globals.UserName + " " + Globals.UserSurname;
        }

        protected void txtSurname_TextChanged(object sender, EventArgs e)
        {

        }

        //Creates a new user (farmer or employee) when clicked
        protected void btnEnter_Click(object sender, EventArgs e)
        {
            //Finds which value has been selected for isFarmer attribute 
            if (txtFirstName.Text != String.Empty || txtPassword.Text != String.Empty)
            {
                bool farmerEmployeeSelect = true;
                if(DropDownList1.SelectedIndex == 0)
                {
                    farmerEmployeeSelect = true;
                }
                else if(DropDownList1.SelectedIndex == 1)
                {
                    farmerEmployeeSelect=false;
                }
                //salt for password
                string userSalt = Salty();

                //Adding salt to password
                string salted = txtPassword.Text + userSalt;

                //Code Attribution
                //This was taken from StackOverflow
                //https://stackoverflow.com/questions/10624932/hashing-password-in-wpf-c-sharp-application
                //Moribvndvs
                //https://stackoverflow.com/users/64750/moribvndvs
                //Hashing 
                var hasher = new SHA256Managed();
                var unhashed = System.Text.Encoding.Unicode.GetBytes(salted);
                var hashed = hasher.ComputeHash(unhashed);

                try
                {
                    //Creating DB object to store values entered by employee
                    var context = new FarmerEntities();
                    var employee = new User()
                    {
                        firstName = txtFirstName.Text.ToUpper(),
                        surname = txtSurname.Text.ToUpper(),
                        phoneNum = Convert.ToInt32(txtPhoneNum.Text),
                        password = Convert.ToBase64String(hashed),
                        isFarmer = farmerEmployeeSelect,
                        SALT = userSalt
                    };
                    context.Users.Add(employee);
                    context.SaveChanges();
                    //Alert to show successful addition
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Employee created sucessfully!" + "');", true);

                    //clearing textboxes
                    txtFirstName.Text = "";
                    txtSurname.Text = "";
                    txtPhoneNum.Text = "";
                    txtPassword.Text = "";
                }
                catch (Exception)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error occured, please try again!" + "');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Required fields have not been entered!" + "');", true);
            }
        }

        public string Salty()
        {
            //Code Attribution
            //This was taken from StackOverflow
            //https://stackoverflow.com/questions/34960131/how-to-compare-this-salted-password-when-user-logs-in
            //Securecurve
            //https://stackoverflow.com/users/829796/securecurve
            //Creating a random number using cryptography
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] salts = new byte[10];
            rng.GetBytes(salts);
            //Converting to string representation to use 
            return Convert.ToBase64String(salts);
        }


        //REturns the user to the Login page
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Response.Close();
        }

        //Returns the user to Employee Landing page
        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeLanding.aspx");
            Response.Close();
        }
    }
}