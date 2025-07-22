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

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter both username and password.";
                return;
            }

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

                        // Fetch InternID only if role is Intern
                        if (role == "Intern")
                        {
                            con.Close(); // Close reader
                            string internIdQuery = "SELECT InternID FROM Interns WHERE InternID = @Username";
                            using (SqlCommand cmdIntern = new SqlCommand(internIdQuery, con))
                            {
                                cmdIntern.Parameters.AddWithValue("@Username", username);
                                con.Open();
                                object internIdObj = cmdIntern.ExecuteScalar();
                                if (internIdObj != null)
                                {
                                    Session["InternID"] = internIdObj.ToString();
                                }
                                else
                                {
                                    lblMessage.Text = "Intern ID not found. Please contact admin.";
                                    return;
                                }
                            }
                        }

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