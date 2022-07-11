using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace ST10120832Task2
{
    //Code Attribution
    //This was taken from StackOverflow
    //https://stackoverflow.com/questions/14368129/how-to-use-global-variables-in-c
    //Tommaso Belluzzo
    //https://stackoverflow.com/users/796085/tommaso-belluzzo
    //Class to store global variables
    static class Globals
    {
        public static int IDFarmers;
        public static string UserName;
        public static string UserSurname;
    }
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            try
            {
                //Creating database object to interact with
                var user = new FarmerEntities();
                int compare = Convert.ToInt32(txtID.Text);
                var empObj = user.Users.Where(x => x.ID == compare).FirstOrDefault();

                //Code Attribution
                //This was taken from StackOverflow
                //https://stackoverflow.com/questions/34960131/how-to-compare-this-salted-password-when-user-logs-in
                //Securecurve
                //https://stackoverflow.com/users/829796/securecurve
                //Appending salt to entered password for comparison
                string salt = empObj.SALT;
                string salted = txtPassword.Text + salt;


                //Code Attribution
                //This was taken from StackOverflow
                //https://stackoverflow.com/questions/10624932/hashing-password-in-wpf-c-sharp-application
                //Moribvndvs
                //https://stackoverflow.com/users/64750/moribvndvs
                //Hashing entered password to compare to stored password
                var hasher = new SHA256Managed();
                var unhashed = System.Text.Encoding.Unicode.GetBytes(salted);
                var hashed = hasher.ComputeHash(unhashed);

                //Determining if password is a match
                bool passwordMatch = false;

                if (empObj.password == Convert.ToBase64String(hashed))
                {
                    passwordMatch = true;
                }
                else
                {
                    passwordMatch = false;
                }

                //Clearing password values for security 
                hashed = null;
                salted = null;
                salt = null;

                //Check against saved password and then determining if Farmer or Employee
                //direct to correct page (landing for Employees or Farmer landing for Farmers)
                if (passwordMatch == true)
                {
                    if (empObj.isFarmer == true)
                    {
                        SetName(empObj.firstName, empObj.surname);
                        SetID(compare);
                        Response.Redirect("FarmerLanding.aspx");
                        Response.Close();
                    }
                    else
                    {
                        SetName(empObj.firstName, empObj.surname);
                        Response.Redirect("EmployeeLanding.aspx");
                        Response.Close();
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Password or ID incorrect, please try again" + "');", true);
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Password or ID incorrect, please try again" + "');", true);
            }
        }

        //Methods to assign Global variables so that they can be used in hte application
        public void SetID(int LoginID)
        {
            //retriving global variable first and then assigning it with users primary key (empID)
            Globals.IDFarmers = LoginID;
        }

        public void SetName(String name, String surname)
        {
            Globals.UserName = name;
            Globals.UserSurname = surname;
        }
    }
}