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
    public partial class editProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string prodId = Request.QueryString["ID"];
                txtEprodID.Text = prodId;

                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Product] WHERE Id=@ProdID", conn);
                cmd.Parameters.AddWithValue("ProdID", prodId);

                SqlDataReader dr = cmd.ExecuteReader();
                bool recordfound = dr.Read();
                if (recordfound)
                {
                    txtEprodName.Text = dr["Name"].ToString();
                    //Image
                    imgEprod.ImageUrl = "~/Images/Products/" + dr["ImageFile"].ToString();
                    lblEProdFile.Text = dr["ImageFile"].ToString();
                    txtEquantity.Text = dr["Quantity"].ToString();
                    txtEproddesc.Text = dr["Description"].ToString();
                    txtEStorage.Text = dr["Storage"].ToString();
                    txtEcolor.Text = dr["Color"].ToString();
                    txtEprice.Text = dr["Price"].ToString();
                    txtEcategory.Text = dr["ProductCatergory"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
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
                    lblEProdFile.Text = fiuProdImage.PostedFile.FileName;



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
            string UpdateQuery = "UPDATE Product SET Name=@ePname, ImageFile=@ePfile, Quantity=@ePquantity, Description=@ePdesc, Storage=@ePstorage, Color=@ePcolor, Price=@ePprice, ProductCatergory=@ePcategory WHERE Id=@Id";
            SqlCommand com = new SqlCommand(UpdateQuery, conn);
            com.Parameters.AddWithValue("@Id", txtEprodID.Text);
            com.Parameters.AddWithValue("@ePname", txtEprodName.Text);
            com.Parameters.AddWithValue("@ePfile", lblEProdFile.Text);
            com.Parameters.AddWithValue("@ePquantity", txtEquantity.Text);
            com.Parameters.AddWithValue("@ePdesc", txtEproddesc.Text);
            com.Parameters.AddWithValue("@ePstorage", txtEStorage.Text);
            com.Parameters.AddWithValue("@ePcolor", txtEcolor.Text);
            com.Parameters.AddWithValue("@ePprice", txtEprice.Text);
            com.Parameters.AddWithValue("@ePcategory", txtEcategory.Text);
            com.ExecuteNonQuery();
            Response.Write("<script>alert('Record updated successfully!');</script>");
            com.Dispose();
            conn.Close();
            Response.Redirect("product.aspx");
        }
    }
}