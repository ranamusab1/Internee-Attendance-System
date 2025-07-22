using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIA
{
    public partial class RegisterIntern : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Role"] == null || Session["Role"].ToString() != "DepartmentAdmin")
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Generate Intern ID and Password
            string guid = Guid.NewGuid().ToString("N").Substring(0, 5); // random 5 chars
            string internID = "i" + guid;
            string internPassword = "pass" + new Random().Next(100, 999); // e.g. pass234

            string name = txtName.Text.Trim();
            string cnic = txtCNIC.Text.Trim();
            string contact = txtContact.Text.Trim();
            string email = txtEmail.Text.Trim();
            string startDate = txtStartDate.Text.Trim();
            string endDate = txtEndDate.Text.Trim();
            string uni = txtUniversity.Text.Trim();
            string roll = txtRollNumber.Text.Trim();
            string department = Session["Department"].ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

               
                string internQuery = @"INSERT INTO Interns 
                    (InternID, InternName, CNIC, ContactNumber, Email, StartDate, EndDate, UniversityName, UniversityRollNumber, Department)
                    VALUES
                    (@InternID, @InternName, @CNIC, @ContactNumber, @Email, @StartDate, @EndDate, @UniversityName, @UniversityRollNumber, @Department)";

                using (SqlCommand cmd = new SqlCommand(internQuery, con))
                {
                    cmd.Parameters.AddWithValue("@InternID", internID);
                    cmd.Parameters.AddWithValue("@InternName", name);
                    cmd.Parameters.AddWithValue("@CNIC", cnic);
                    cmd.Parameters.AddWithValue("@ContactNumber", contact);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@StartDate", startDate);
                    cmd.Parameters.AddWithValue("@EndDate", endDate);
                    cmd.Parameters.AddWithValue("@UniversityName", uni);
                    cmd.Parameters.AddWithValue("@UniversityRollNumber", roll);
                    cmd.Parameters.AddWithValue("@Department", department);
                    cmd.ExecuteNonQuery();
                }

                // Insert login credentials into Users table
                string userQuery = @"INSERT INTO Users (Username, Password, Role, Department)
                                     VALUES (@Username, @Password, 'Intern', @Department)";

                using (SqlCommand cmdUser = new SqlCommand(userQuery, con))
                {
                    cmdUser.Parameters.AddWithValue("@Username", internID);
                    cmdUser.Parameters.AddWithValue("@Password", internPassword);
                    cmdUser.Parameters.AddWithValue("@Department", department);
                    cmdUser.ExecuteNonQuery();
                }
            }

            lblMessage.Text = $"Intern Registered! ID: {internID} | Password: {internPassword}";
        }
    }
}