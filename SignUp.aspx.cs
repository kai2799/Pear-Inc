using Antlr.Runtime;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grp
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)//if any value post in
            {
                DateTime today = DateTime.Today;
                ravRegDOB.MinimumValue=today.AddYears(-95).ToShortDateString();
                ravRegDOB.MaximumValue = today.AddYears(-18).ToShortDateString();
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // handle the form submission when the user clicks the "Submit" button
            string name = txtRegName.Text;
            string bio = txtRegBio.Text;
            string gender = rblRegGender.SelectedValue;
            string email = txtRegEmail.Text;
            string password = txtRegPassword.Text;
            string phone = txtRegPhone.Text;
            string address = txtRegAddress.Text;
            int isAdmin = 0;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
            conn.Open();

            // Check if the email is already registered
            SqlCommand cmdCheckEmail = new SqlCommand("SELECT COUNT(*) FROM [User] WHERE Email=@Email", conn);
            cmdCheckEmail.Parameters.AddWithValue("@Email", email);
            int emailCount = (int)cmdCheckEmail.ExecuteScalar();

            if (emailCount > 0)
            {
                // Email already registered, show error message
                lblRegErrorMsg.Visible = true;
                lblRegErrorMsg.Text = "Email already registered. Please enter a different email.";
            }
            else
            {
                // Create a new SqlCommand object with an INSERT statement
                SqlCommand command = new SqlCommand("INSERT INTO [User] (Name, Bio, Gender, DOB, Email, Phone, Address, Password, IsAdmin) VALUES (@Name, @Bio, @Gender, @DOB, @Email, @Phone, @Address, @SPassword, @IsAdmin)", conn);
                // Add parameters to the INSERT statement
                command.Parameters.AddWithValue("@Name", name);
                command.Parameters.AddWithValue("@Bio", bio);
                command.Parameters.AddWithValue("@Gender", gender);
                command.Parameters.AddWithValue("@DOB", txtRegDOB.Text);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@SPassword", password);
                command.Parameters.AddWithValue("@Phone", phone);
                command.Parameters.AddWithValue("@Address", address);
                command.Parameters.AddWithValue("@IsAdmin", isAdmin);

                // Execute the INSERT statement
                command.ExecuteNonQuery();
                // Close the connection
                conn.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Account Registered successfully!'); window.location='" + ResolveUrl("~/Login.aspx") + "';", true);
            }
        }

        protected void linkLogin1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }    
    }

}