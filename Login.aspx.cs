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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE Email=@email AND Password=@pwd", conn);
                cmd.Parameters.AddWithValue("@email", txtLoginEmail.Text);
                cmd.Parameters.AddWithValue("@pwd", txtLoginPassword.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["Id"] = dr["Id"].ToString();
                        int userRole = Convert.ToInt16(dr["IsAdmin"].ToString());
                        switch (userRole)
                        {
                            case 0:
                                Response.Redirect("~/userDefault.aspx");
                                break;
                            case 1:
                                Response.Redirect("~/adminDefault.aspx");
                                break;
                        }
                    }
                }
                else
                {
                    lblLoginErrorMsg.Visible = true;
                    lblLoginErrorMsg.Text = "Invalid email or password";
                    lblLoginErrorMsg.ForeColor = System.Drawing.Color.Red;
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void linkForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/forgotPassword.aspx");
        }

        protected void linkSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignUp.aspx");
        }
    }
}