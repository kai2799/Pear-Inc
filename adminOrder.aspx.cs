using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grp
{
    public partial class adminOrder : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        private void BindGrid()
        {

            using (conn)
            {

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Order]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = conn;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grvOrder.DataSource = dt;
                            grvOrder.DataBind();
                        }
                    }
                }
            }
        }


        protected void btnOrderSearch_Click(object sender, EventArgs e)
        {
            if (txtSearchOrder.Text == "")
            {
                BindGrid();
            }
            else
            {
                using (conn)
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Order] WHERE OrderID=@ID"))
                    {
                        cmd.Parameters.AddWithValue("@ID", txtSearchOrder.Text);
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = conn;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                grvOrder.DataSource = dt;
                                grvOrder.DataBind();
                            }
                        }
                    }
                }
            }

        }
        protected void btnOrderDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "OrderDelete")
            {
                try
                {
                    string OrderDelete = e.CommandArgument.ToString();
                    conn.Open();
                    string DeleteQuery = "DELETE FROM [Order] WHERE OrderID=@id";
                    using (SqlCommand cmd = new SqlCommand(DeleteQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@id", OrderDelete);
                        int rows = cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Record deleted successfully!');</script>");
                    }
                    conn.Close();
                    BindGrid();
                }
                catch (SqlException ex)
                {
                    lblAdminOrderMsg.Text = "Error: " + ex.ToString();
                    lblAdminOrderMsg.ForeColor = System.Drawing.Color.Red;
                }

            }
        }

    }
}