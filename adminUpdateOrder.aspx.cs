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
    public partial class adminUpdateOrder : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the order details from the database and display them on the labels
                int orderId = Convert.ToInt32(Request.QueryString["ID"]);
                string connectionString = ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString;
                string query = "SELECT * FROM [Order] WHERE OrderID = @OrderId";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@OrderId", orderId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        lblOrderID.Text = reader["OrderID"].ToString();
                        lblCustomerID.Text = reader["userID"].ToString();
                        lblProductID.Text = reader["productID"].ToString();
                        lblquantity.Text = reader["quantity"].ToString();
                        ddlOrderStatus.SelectedValue = reader["OrderStatus"].ToString();
                    }
                    reader.Close();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Update the order status in the database
            int orderId = Convert.ToInt32(lblOrderID.Text);
            string orderStatus = ddlOrderStatus.SelectedValue;
            string connectionString = ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString;
            string query = "UPDATE [Order] SET OrderStatus = @OrderStatus WHERE OrderID = @OrderId";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@OrderStatus", orderStatus);
                command.Parameters.AddWithValue("@OrderId", orderId);
                connection.Open();
                command.ExecuteNonQuery();
            }
            Response.Redirect("adminOrder.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminOrder.aspx");
        }
    }
}