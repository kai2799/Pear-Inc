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
    public partial class FAQ : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string valueEmail = txtEmail.Text;
            string valueName = txtName.Text;
            string valueMessage = txtMessage.Text;

            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                    string insertQuery = "INSERT INTO Feedback(Id,Email,Name,Message,ImageFile)values(@uidf,@email,@name,@message,@imagefile)";
                    SqlCommand con = new SqlCommand(insertQuery, conn);
                    con.Parameters.AddWithValue("@uidf", Session["Id"]);
                    con.Parameters.AddWithValue("@email", valueEmail);
                    con.Parameters.AddWithValue("@name", valueName);
                    con.Parameters.AddWithValue("@message", valueMessage);

                    if (fiuImage.HasFile)
                    {
                        string extension = System.IO.Path.GetExtension(fiuImage.FileName);
                        //jpg and png files only

                        if ((extension == ".jpg") || (extension == ".jpeg") || (extension == ".png"))
                        {
                            if (fiuImage.PostedFile.ContentLength < 2100000)
                            {
                                String strPath = Request.PhysicalApplicationPath +
                                            "Images\\" + "Feedback\\" + fiuImage.FileName;
                                fiuImage.SaveAs(strPath);
                                lblMessage.ForeColor = System.Drawing.Color.Green;
                                lblMessage.Text = "Image was successfully uploaded!";
                            }
                            else
                            {
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                                lblMessage.Text = "Upload status: The file has to be less than 2MB!";
                            }
                        }

                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "No image selected. Please select an image and try again.";
                    }

                    con.Parameters.AddWithValue("imagefile", fiuImage.FileName);


                    con.ExecuteNonQuery();
                    Response.Write("<script>alert('New feedback added successfully!');</script>");
                    conn.Close();
                    clear();
                }
            }
            catch (Exception ex)
            {

            }
        }

        void clear()
        {
            txtEmail.Text = "";
            txtName.Text = "";
            txtMessage.Text = "";
            lblMessage.Text = "";

        }
    }
}