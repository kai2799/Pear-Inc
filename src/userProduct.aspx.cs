using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace Grp
{
    public partial class userProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
        string valueName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showThings.Visible = false;
            }
        }

        protected void dlProduct_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                Label lblValue = (Label)e.Item.FindControl("lblName");
                valueName = lblValue.Text;

                Label3.Text = valueName;


            }
        }

        protected void linkbtn_Add_Click(object sender, EventArgs e)
        {

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Product] WHERE Name=@name", conn);
            cmd.Parameters.AddWithValue("name", Label3.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            bool recordFound = dr.Read();
            if (recordFound)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "togglePopup()", true);

                // Get the image data from the database
                string imagePath = dr["ImageFile"].ToString();
                byte[] imageData = File.ReadAllBytes(Server.MapPath("/Images/Products/" + imagePath));

                // Set the image data to the ImageUrl property of the Image control
                if (imageData != null && imageData.Length > 0)
                {
                    string base64String = Convert.ToBase64String(imageData);
                    ImgPhoneDetails.ImageUrl = "data:image/png;base64," + base64String;
                }

                lblNameDetail.Text = dr["Name"].ToString();
                //--decimal price = (decimal)dr["Price"];
                //--lblPriceDetail.Text = price.ToString("0.00");
                lblPriceDetail.Text = dr["Price"].ToString();
                lblProductDescriptionDetail.Text = dr["Description"].ToString();
                lblStorageDetail.Text = dr["Storage"].ToString();
                lblColorDetail.Text = dr["Color"].ToString();
                lblStockAvailabel.Text = dr["Quantity"].ToString();
                lblstorepID.Text = dr["Id"].ToString();

            }
            else
            {
                //tabResult.Visible = false;
                //lblResult.Text = "No result found...";
                //lblResult.ForeColor = System.Drawing.Color.Red;
                //lblResult.BackColor = System.Drawing.Color.Yellow;
            }
            conn.Close();






        }

        protected void linkbtnIphone14_Click(object sender, EventArgs e)
        {
            int phoneModel;

            showThings.Visible = true;
            phoneModel = 14;
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Product WHERE ProductCatergory = '" + phoneModel + "'", conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    if (phoneModel > 0)
                    {
                        sda.Fill(dt);
                        dlProduct.DataSource = dt;
                        dlProduct.DataBind();
                    }
                }
            }
            conn.Close();
        }

        protected void linkbtnIphone12_Click(object sender, EventArgs e)
        {
            int phoneModel;

            showThings.Visible = true;
            phoneModel = 12;
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Product WHERE ProductCatergory = '" + phoneModel + "'", conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    if (phoneModel > 0)
                    {
                        sda.Fill(dt);
                        dlProduct.DataSource = dt;
                        dlProduct.DataBind();
                    }
                }
            }
            conn.Close();
        }

        protected void linkbtnIphone13_Click(object sender, EventArgs e)
        {
            int phoneModel;

            showThings.Visible = true;
            phoneModel = 13;
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Product WHERE ProductCatergory = '" + phoneModel + "'", conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    if (phoneModel > 0)
                    {
                        sda.Fill(dt);
                        dlProduct.DataSource = dt;
                        dlProduct.DataBind();
                    }
                }
            }
            conn.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            showThings.Visible = true;
            
            string SearchName = txtSearch.Text;
            //string SearchName = Page.Request.Form["txtSearch"].ToString();
            //string SearchName = txtFrom.Text;
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Product WHERE Name LIKE '%' + @name + '%'", conn);
            cmd.Parameters.AddWithValue("name", SearchName);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Close();

            // Set the search results to the DataList control
            dlProduct.DataSource = dt;
            dlProduct.DataBind();

        }

        protected void btnFilterPrice_Click(object sender, EventArgs e)
        {
            showThings.Visible = true;

            Double valueFrom = Double.Parse(txtFrom.Text);
            Double valueTo = Double.Parse(txtTo.Text);

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Product WHERE [Price] BETWEEN @minPrice AND @maxPrice", conn);
            cmd.Parameters.AddWithValue("@minPrice", valueFrom);
            cmd.Parameters.AddWithValue("@maxPrice", valueTo);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            conn.Close();

            dlProduct.DataSource = dt;
            dlProduct.DataBind();

            //Label2.Text = "abc";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            string query = "SELECT * FROM Cart WHERE UserID = @checkID";
            SqlCommand check = new SqlCommand(query, conn);
            check.Parameters.AddWithValue("@checkID", Session["Id"]);
            conn.Open();
            SqlDataReader readerID = check.ExecuteReader();

            if (readerID.HasRows)
            {
                Response.Write("<script>alert('Product in cart can only be one.');</script>");
                conn.Close();
            }
            else
            {
                int stockQuantity = int.Parse(lblStockAvailabel.Text);
                int valueQuantity = int.Parse(txtQuantity.Text);


                if (stockQuantity > valueQuantity)
                {
                    conn.Close();
                    conn.Open();

                    string insertQuery = "INSERT INTO Cart(UserID,Id,Name,Quantity,Color,Price)values(@uID,@pID,@prodName,@prodQuan,@prodColor,@prodPrice)";
                    SqlCommand con = new SqlCommand(insertQuery, conn);
                    con.Parameters.AddWithValue("@uID", Session["Id"]);
                    con.Parameters.AddWithValue("@pID", lblstorepID.Text);
                    con.Parameters.AddWithValue("@prodName", lblNameDetail.Text);
                    con.Parameters.AddWithValue("@prodQuan", valueQuantity);
                    con.Parameters.AddWithValue("@prodColor", lblColorDetail.Text);
                    con.Parameters.AddWithValue("@prodPrice", lblPriceDetail.Text);
                    con.ExecuteNonQuery(); //not gonna return anything, not gonna retrive anything
                    conn.Close();

                    Response.Write("<script>alert('Product added to cart');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Insufficient stock');</script>");
                }
            }
        }
    }
}