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
    public partial class admin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // create the SQL command to retrieve user data
                SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", Session["Id"]);

                // open the database connection and execute the command
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // if the reader has any data, assign it to the text boxes
                if (reader.Read())
                {
                    txtID.Text = reader["Id"].ToString();
                    txtName.Text = reader["Name"].ToString();
                    string gender = reader["Gender"].ToString();
                    string newStr = gender.Replace(" ", "");
                    txtGender.Text = newStr;
                    var date = reader.GetDateTime(4);
                    var formattedDate = date.ToString("yyyy-MM-dd");
                    txtDOB.Text = formattedDate;
                    txtEmail.Text = reader["Email"].ToString();
                    txtContactNumber.Text = reader["Phone"].ToString();
                }

                // close the reader and the connection
                reader.Close();
                conn.Close();


                // Disable all fields
                txtName.Enabled = false;
                txtGender.Enabled = false;
                txtDOB.Enabled = false;
                txtEmail.Enabled = false;
                txtContactNumber.Enabled = false;

                // Hide save and delete buttons
                btnSave.Visible = false;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            // Enable all fields for editing
            txtName.Enabled = true;
            txtGender.Enabled = true;
            txtDOB.Enabled = true;
            txtEmail.Enabled = true;
            txtContactNumber.Enabled = true;


            // Hide edit button
            btnEdit.Visible = false;

            // Show save and delete buttons
            btnSave.Visible = true;

            if (txtGender.Text != "Female" && txtGender.Text != "Male" && txtGender.Text != "Others")
            {
                revGender.Visible = true;
            }
            else
            {
                revGender.Visible = false;
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Save updated fields to the database using SQL commands
            SqlCommand command = new SqlCommand("UPDATE [User] SET Name = @Name, Gender = @Gender, DOB = @DOB, Email = @Email, Phone = @ContactNumber WHERE Id = @Id", conn);
            command.Parameters.AddWithValue("@Id", Session["Id"]); // assuming you have stored the customer ID in a Session variable
            command.Parameters.AddWithValue("@Name", txtName.Text);
            command.Parameters.AddWithValue("@Gender", txtGender.Text);
            command.Parameters.AddWithValue("@DOB", txtDOB.Text);
            command.Parameters.AddWithValue("@Email", txtEmail.Text);
            command.Parameters.AddWithValue("@ContactNumber", txtContactNumber.Text);
            conn.Open();
            command.ExecuteNonQuery();
            conn.Close();


            // Disable all fields
            txtName.Enabled = false;
            txtGender.Enabled = false;
            txtDOB.Enabled = false;
            txtEmail.Enabled = false;
            txtContactNumber.Enabled = false;

            // Hide save and delete buttons
            btnSave.Visible = false;

            // Show edit button
            btnEdit.Visible = true;

            
        }


    }
}