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
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                // create the SQL command to retrieve user data
                SqlCommand cmd = new SqlCommand("SELECT * FROM Cart WHERE UserID = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", Session["Id"]);

                // open the database connection and execute the command
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                // if the reader has any data, assign it to the text boxes
                if (reader.Read())
                {
                    txtID.Text = reader["Id"].ToString();
                    txtName.Text = reader["Name"].ToString();
                    txtQuantity.Text = reader["Quantity"].ToString();
                    txtColor.Text = reader["Color"].ToString();
                    txtPrice.Text = reader["Price"].ToString();
                }

                // close the reader and the connection
                reader.Close();
                conn.Close();

                decimal price, quantity, sum;
                if (!decimal.TryParse(txtPrice.Text, out price))
                {
                    // Show an error message or handle the invalid input as appropriate
                    return;
                }
                if (!decimal.TryParse(txtQuantity.Text, out quantity))
                {
                    // Show an error message or handle the invalid input as appropriate
                    return;
                }
                sum = price * quantity;
                txtSum.Text = sum.ToString();

            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Payment successfully!');</script>");
            string connectionString = "Database1";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString))
            {
                conn.Open();

                // Delete the item from the cart table
                SqlCommand deleteCommand = new SqlCommand("DELETE FROM Cart WHERE UserID = @Id", conn);
                deleteCommand.Parameters.AddWithValue("@Id", Session["Id"]); // assuming you have stored the customer ID in a Session variable
                deleteCommand.ExecuteNonQuery();
                conn.Close();
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Product] WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", txtID.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                bool recordFound = dr.Read();
                string ID = dr["Id"].ToString();
                string Name = dr["Name"].ToString();
                int Quantity = int.Parse(dr["Quantity"].ToString());
                string Color = dr["Color"].ToString();
                string Price = string.Format("{0:c}", dr["Price"]);
                conn.Close();
                conn.Open();
                // Decrement the quantity of the product in the database
                int qty = Quantity - Int32.Parse(txtQuantity.Text);
                SqlCommand updateCommand = new SqlCommand("UPDATE Product SET Quantity = @Quantity WHERE Id = @Id", conn);
                updateCommand.Parameters.AddWithValue("@Id", txtID.Text); // assuming you have stored the product ID in a variable or a hidden field
                updateCommand.Parameters.AddWithValue("@Quantity", qty);
                updateCommand.ExecuteNonQuery();
                conn.Close();
                conn.Open();
                string insertQuery = "INSERT INTO [Order](UserId,ProductId,Quantity,OrderStatus)values(@UserId,@ProductId,@Quantity,@OrderStatus)";
                SqlCommand con = new SqlCommand(insertQuery, conn);
                con.Parameters.AddWithValue("@UserId", Session["Id"]);
                con.Parameters.AddWithValue("@ProductId", txtID.Text);
                con.Parameters.AddWithValue("@Quantity", txtQuantity.Text);
                string orderStatus = "Ordered";
                con.Parameters.AddWithValue("@OrderStatus", orderStatus);
                con.ExecuteNonQuery();
                conn.Close();

            }
            Clear();
            tabCart.Visible = true;
            btnCheckOut.Visible = true;
            btnDelete.Visible = true;
            lblText.Visible = false;
            tabReview.Visible = false;
        }

        public void Clear()
        {
            txtID.Text = txtName.Text = txtQuantity.Text = txtColor.Text = txtPrice.Text = txtSum.Text = "";
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string connectionString = "Database1";
            SqlCommand command = new SqlCommand("DELETE FROM Cart WHERE UserID = @Id", conn);
            command.Parameters.AddWithValue("@Id", Session["Id"]); // assuming you have stored the customer ID in a Session variable
            conn.Open();
            command.ExecuteNonQuery();
            conn.Close();
            Clear();
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            if (txtID.Text != "" && txtName.Text != "" && txtQuantity.Text != "" && txtColor.Text != "" && txtPrice.Text != "")
            {
                tabCart.Visible = false;
                btnCheckOut.Visible = false;
                btnDelete.Visible = false;
                lblText.Visible = true;
                tabReview.Visible = true;
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Cart] WHERE UserID = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", Session["Id"]);
                SqlDataReader dr = cmd.ExecuteReader();
                bool recordFound = dr.Read();
                tabReview.Visible = true;
                tabCart.Visible = false;
                lblID.Text = dr["Id"].ToString();
                lblName.Text = dr["Name"].ToString();
                lblQuantity.Text = dr["Quantity"].ToString();
                lblColor.Text = dr["Color"].ToString();
                lblPrice.Text = string.Format("{0:c}", txtSum.Text);
                conn.Close();
                conn.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM [User] WHERE Id = @Id", conn);
                command.Parameters.AddWithValue("@Id", Session["Id"]);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    txtAddress.Text = reader["Address"].ToString();
                    txtCardNumber.Text = reader["CreditCardNum"].ToString();
                    txtExpDate.Text = reader["ExpiredDate"].ToString();
                    txtCVV.Text = reader["CVV"].ToString();
                }
                reader.Close();
                conn.Close();
            }
            else /*if (txtID.Text == null && txtName.Text == null && txtQuantity.Text == null && txtColor.Text == null && txtPrice == null)*/
            {
                Response.Write("<script>alert('Your cart is empty!');</script>");
            }
        }

        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            decimal price, sum, total;
            decimal quantity;
            if (decimal.TryParse(txtPrice.Text, out price) && decimal.TryParse(txtQuantity.Text, out quantity))
            {
                sum = price * quantity;
                txtSum.Text = sum.ToString();
                int id;
                if (int.TryParse(txtID.Text, out id))
                {
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString))
                    {
                        conn.Open();
                        SqlCommand command = new SqlCommand("UPDATE Cart SET Quantity = @Quantity WHERE Id = @Id AND UserID = @UserId", conn);
                        command.Parameters.AddWithValue("@Quantity", quantity);
                        command.Parameters.AddWithValue("@Id", id);
                        command.Parameters.AddWithValue("@UserId", Session["Id"]);
                        command.ExecuteNonQuery();
                    }

                }
            }
        }


    }
}