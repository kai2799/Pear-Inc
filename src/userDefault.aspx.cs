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
    public partial class userDefault : System.Web.UI.Page
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

        protected void imgBanner1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("userProduct.aspx");
        }

        protected void imgBanner2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("userProduct.aspx");
        }
    }
}