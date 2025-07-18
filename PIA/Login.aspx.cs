using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIA
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (username == "" || password == "")
            {
                lblMessage.Text = "Please enter both username and password.";
                return;
            }

            // Connection string (adjust as per your local DB config)
            string connectionString = "Data Source=localhost;Initial Catalog=PIA;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Role, Department FROM Users WHERE Username = @Username AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string role = reader["Role"].ToString();
                        string department = reader["Department"].ToString();

                        // Set session variables
                        Session["Username"] = username;
                        Session["Role"] = role;
                        Session["Department"] = department;

                        // Redirect based on role
                        if (role == "DepartmentAdmin")
                        {
                            Response.Redirect("DepartmentDashboard.aspx");
                        }
                        else if (role == "Intern")
                        {
                            Response.Redirect("InternPanel.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Unknown role.";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                    }
                }
            }
        }
    }
}