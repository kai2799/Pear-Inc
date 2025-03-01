using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grp
{
    public partial class forgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["db_Apple"].ConnectionString);
            string email = txtForgotPasswordEmail.Text.Trim();
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT Password FROM [User] WHERE Email = @Email", conn);
            cmd.Parameters.AddWithValue("@Email", email);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    string pwd = dr["Password"].ToString();
                    // Send password to user's email
                    MailMessage mail = new MailMessage();
                    mail.To.Add(email);
                    mail.Subject = "Password Retrieval";
                    mail.Body = "Dear Customer, Your password is: " + pwd;
                    mail.From = new MailAddress("gawoo0227@gmail.com");

                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential("gawoo0227@gmail.com", "kkzujliswzsfaxll");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Email Sent successfully!'); window.location='" + ResolveUrl("~/Login.aspx") + "';", true);
                }
            }
            else
            {
                lblForgotPasswordMsg.Text = "Invalid email address.";
                lblForgotPasswordMsg.Visible = true;
            }            
        }

        protected void linkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}