using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Grp
{
    public partial class product : System.Web.UI.Page
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

                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Product]"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = conn;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grvProducts.DataSource = dt;
                            grvProducts.DataBind();
                        }
                    }
                }
            }
        }

        protected void grvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvProducts.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void btnOpenAddProd_Click(object sender, EventArgs e)
        {
            if (panAddProd.Visible == true)
            {
                panAddProd.Visible = false;
            }
            else
            {
                panAddProd.Visible = true;
            }
        }

        protected void btnSubAdd_Click(object sender, EventArgs e)
        {

            try
            {
                int boolerr = 0;

                if (boolerr == 0)
                {
                    string filename;
                    if (fiuProdImage.HasFile)
                    {

                        try
                        {
                            filename = System.IO.Path.GetFileName(fiuProdImage.PostedFile.FileName);
                            fiuProdImage.PostedFile.SaveAs(Server.MapPath("~/Images/Products/" + fiuProdImage.FileName));
                            lblUploadStatus.Text = filename + " uploaded.";
                            lblUploadStatus.ForeColor = System.Drawing.Color.Green;
                            lblProdFileName.Text = fiuProdImage.PostedFile.FileName;
                        }
                        catch
                        {
                            lblUploadStatus.Text = "Unable to save file";
                            lblUploadStatus.ForeColor = System.Drawing.Color.Red;
                        }

                    }
                    else
                    {
                        lblUploadStatus.Text = "No file selected";
                        lblUploadStatus.ForeColor = System.Drawing.Color.Red;
                    }

                    conn.Open();
                    string insertQuery = "INSERT INTO Product(Name,ImageFile,Quantity,Description,Storage,Color,Price,ProductCatergory)values(@prodName,@prodImage,@prodQuan,@prodDes,@prodSto,@prodColor,@prodPrice,@prodCategory)";
                    SqlCommand con = new SqlCommand(insertQuery, conn);

                    con.Parameters.AddWithValue("@prodName", txtProdName.Text);
                    con.Parameters.AddWithValue("@prodImage", lblProdFileName.Text);
                    con.Parameters.AddWithValue("@prodQuan", txtProdQuantity.Text);
                    con.Parameters.AddWithValue("@prodDes", txtProdDesc.Text);
                    con.Parameters.AddWithValue("@prodSto", txtStorage.Text);
                    con.Parameters.AddWithValue("@prodColor", txtProdColor.Text);
                    con.Parameters.AddWithValue("@prodPrice", txtProdPrice.Text);
                    con.Parameters.AddWithValue("@prodCategory", txtProdCategory.Text);
                    con.ExecuteNonQuery(); //not gonna return anything, not gonna retrive anything
                    Response.Write("<script>alert('New product added successfully!');</script>");
                    conn.Close();
                    Clear();
                    BindGrid();
                }

                //}
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error: " + ex.ToString();
                lblResult.ForeColor = System.Drawing.Color.Red;
            }
        }

        public void Clear()
        {
            txtProdCategory.Text = txtProdName.Text = txtProdQuantity.Text = txtProdDesc.Text = txtStorage.Text = txtProdColor.Text = txtProdPrice.Text = "";
            lblResult.Text = lblUploadStatus.Text = "";

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                try
                {
                    string prodIDelete = "";
                    prodIDelete = e.CommandArgument.ToString();
                    conn.Open();
                    string DeleteQuery = "DELETE FROM Product WHERE Id=@IDdel";
                    using (SqlCommand cmd = new SqlCommand(DeleteQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@IDdel", prodIDelete);
                        int rows = cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Record deleted successfully!');</script>");
                    }
                }
                catch (SqlException ex)
                {
                    lblDEresult.Text = "Error: " + ex.ToString();
                    lblDEresult.ForeColor = System.Drawing.Color.Red;
                }
                conn.Close();
                BindGrid();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearchid.Text == "")
            {
                BindGrid();
            }
            else
            {
                using (conn)
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Product] WHERE Id=@Idsearch"))
                    {
                        cmd.Parameters.AddWithValue("@Idsearch", txtSearchid.Text);
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = conn;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                grvProducts.DataSource = dt;
                                grvProducts.DataBind();
                            }
                        }
                    }
                }
            }
        }
    }
}