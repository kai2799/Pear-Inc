using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grp
{
    public partial class adminDefault : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();

            // Display first banner
            string select1_cmd = "SELECT ImageName FROM [Banner] WHERE BannerId=@id";
            SqlCommand con1 = new SqlCommand(select1_cmd, conn);
            con1.Parameters.AddWithValue("@id", 1);
            SqlDataReader reader1 = con1.ExecuteReader();

            if (reader1.Read()) // Check if there are rows to read
            {
                string imgName = reader1.GetString(0);
                imgBanner1.ImageUrl = "~/Images/Banners/" + imgName;
            }
            else
            {
                // Handle case where no rows were returned
            }
            reader1.Close();

            // Display second banner
            string select2_cmd = "SELECT ImageName FROM [Banner] WHERE BannerId=@id";
            SqlCommand con2 = new SqlCommand(select2_cmd, conn);
            con2.Parameters.AddWithValue("@id", 2);
            SqlDataReader reader2 = con2.ExecuteReader();

            if (reader2.Read()) // Check if there are rows to read
            {
                string imgName = reader2.GetString(0);
                imgBanner2.ImageUrl = "~/Images/Banners/" + imgName;
            }
            else
            {
                // Handle case where no rows were returned
            }
            reader2.Close();

            conn.Close();
        }


        protected void btnUploadB1_Click(object sender, EventArgs e)
        {
            if (fuBanner1.HasFile)
            {
                string extension = Path.GetExtension(fuBanner1.FileName);
                if ((extension == ".jpg") || (extension == ".png") || (extension == ".jpeg"))
                {
                    int maxFileSize = 2100000;
                    if (fuBanner1.PostedFile.ContentLength < maxFileSize)
                    {
                        try
                        {
                            string filename = Path.GetFileName(fuBanner1.FileName);
                            string path = Path.Combine(Server.MapPath("~/Images/Banners/"), filename);
                            fuBanner1.PostedFile.SaveAs(path);
                            lblUploadErrorMsg.Text = filename + " uploaded.";
                            lblUploadErrorMsg.ForeColor = Color.Green;
                            lblB1Name.Text = filename;

                            // Set the ImageUrl property of the imgBanner1 control to the path of the uploaded image
                            imgBanner1.ImageUrl = "~/Images/Banners/" + lblB1Name.Text;

                            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString))
                            {
                                conn.Open();
                                string updateCmd = "UPDATE [Banner] SET ImageName=@img WHERE BannerId=@id";
                                using (SqlCommand cmd = new SqlCommand(updateCmd, conn))
                                {
                                    cmd.Parameters.AddWithValue("@id", 1);
                                    cmd.Parameters.AddWithValue("@img", lblB1Name.Text);
                                    cmd.ExecuteNonQuery();
                                }
                                
                            }

                            Response.Write("<script>alert('Banner updated successfully!');</script>");
                        }
                        catch (Exception ex)
                        {
                            lblUploadErrorMsg.Text = "Unable to save file: " + ex.Message;
                            lblUploadErrorMsg.ForeColor = Color.Red;
                        }
                    }
                    else
                    {
                        lblUploadErrorMsg.ForeColor = Color.Red;
                        lblUploadErrorMsg.Text = "Upload status: the file has to be less than " + (maxFileSize / 1024).ToString() + "KB!";
                    }
                }
                else
                {
                    lblUploadErrorMsg.ForeColor = Color.Red;
                    lblUploadErrorMsg.Text = "Upload status: Only JPG, JPEG, and PNG files are accepted!";
                }
            }
            else
            {
                lblUploadErrorMsg.ForeColor = Color.Red;
                lblUploadErrorMsg.Text = "No image is selected. Please select an image file and try again.";
            }
        }

        protected void btnUploadB2_Click(object sender, EventArgs e)
        {
            if (fuBanner2.HasFile)
            {
                string extension = Path.GetExtension(fuBanner2.FileName);
                if ((extension == ".jpg") || (extension == ".png") || (extension == ".jpeg"))
                {
                    int maxFileSize = 2100000;
                    if (fuBanner2.PostedFile.ContentLength < maxFileSize)
                    {
                        try
                        {
                            string filename = Path.GetFileName(fuBanner2.FileName);
                            string path = Path.Combine(Server.MapPath("~/Images/Banners/"), filename);
                            fuBanner2.PostedFile.SaveAs(path);
                            lblUploadErrorMsg.Text = filename + " uploaded.";
                            lblUploadErrorMsg.ForeColor = Color.Green;
                            lblB2Name.Text = filename;

                            // Set the ImageUrl property of the imgBanner1 control to the path of the uploaded image
                            imgBanner2.ImageUrl = "~/Images/Banners/" + lblB2Name.Text;

                            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString))
                            {
                                conn.Open();
                                string updateCmd = "UPDATE [Banner] SET ImageName=@img WHERE BannerId=@id";
                                using (SqlCommand cmd = new SqlCommand(updateCmd, conn))
                                {
                                    cmd.Parameters.AddWithValue("@id", 2);
                                    cmd.Parameters.AddWithValue("@img", lblB2Name.Text);
                                    cmd.ExecuteNonQuery();
                                }

                            }

                            Response.Write("<script>alert('Banner updated successfully!');</script>");
                        }
                        catch (Exception ex)
                        {
                            lblUploadErrorMsg.Text = "Unable to save file: " + ex.Message;
                            lblUploadErrorMsg.ForeColor = Color.Red;
                        }
                    }
                    else
                    {
                        lblUploadErrorMsg.ForeColor = Color.Red;
                        lblUploadErrorMsg.Text = "Upload status: the file has to be less than " + (maxFileSize / 1024).ToString() + "KB!";
                    }
                }
                else
                {
                    lblUploadErrorMsg.ForeColor = Color.Red;
                    lblUploadErrorMsg.Text = "Upload status: Only JPG, JPEG, and PNG files are accepted!";
                }
            }
            else
            {
                lblUploadErrorMsg.ForeColor = Color.Red;
                lblUploadErrorMsg.Text = "No image is selected. Please select an image file and try again.";
            }
        }

    }
}