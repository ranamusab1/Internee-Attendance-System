using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PIA
{
    public partial class StudentViewAttendance : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["PIAConnection"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Role"] == null || Session["Role"].ToString() != "Intern")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAttendance();
                // Set user info from session
                if (Session["Username"] != null)
                    lblUsername.Text = "Username: " + Session["Username"].ToString();
                if (Session["Department"] != null)
                    lblDepartment.Text = "| Department: " + Session["Department"].ToString();
            }
        }

        private void LoadAttendance()
        {
            if (string.IsNullOrEmpty(connectionString))
            {
                lblMessage.Text = "Database connection string is missing or invalid.";
                return;
            }

            string internID = Session["InternID"]?.ToString();
            lblMessage.Text = $"Debug: InternID = {internID ?? "null"}"; // Debug output

            if (string.IsNullOrEmpty(internID))
            {
                lblMessage.Text = "Intern ID not set. Please login again.";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT Date AS AttendanceDate, Status FROM Attendance WHERE InternID = @InternID ORDER BY Date DESC";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@InternID", internID);
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        conn.Open();
                        adapter.Fill(dt);
                        lblMessage.Text = $"Debug: Rows returned = {dt.Rows.Count}"; // Debug output

                        if (dt.Rows.Count > 0)
                        {
                            gvAttendance.DataSource = dt;
                            gvAttendance.DataBind();
                            lblMessage.Text = "";
                        }
                        else
                        {
                            gvAttendance.DataSource = null;
                            gvAttendance.DataBind();
                            lblMessage.Text = "No attendance records found.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading attendance: " + ex.Message;
            }
        }
    }
}