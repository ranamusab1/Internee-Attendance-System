using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PIA
{
    public partial class AdminViewAttendance : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["PIAConnection"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Role"] == null || Session["Role"].ToString() != "DepartmentAdmin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAttendance();
            }
        }

        private void LoadAttendance(string nameFilter = "", string dateFilter = "")
        {
            if (string.IsNullOrEmpty(connectionString))
            {
                lblMessage.Text = "Database connection string is missing or invalid.";
                return;
            }

            string department = Session["Department"]?.ToString();
            if (string.IsNullOrEmpty(department))
            {
                lblMessage.Text = "Department not set. Please login again.";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT I.InternID, I.InternName, I.CNIC, A.Date AS AttendanceDate, A.Status
                        FROM Interns I
                        LEFT JOIN Attendance A ON I.InternID = A.InternID
                        WHERE I.Department = @Department";

                    if (!string.IsNullOrEmpty(nameFilter))
                    {
                        query += " AND I.InternName LIKE @NameFilter";
                    }
                    if (!string.IsNullOrEmpty(dateFilter))
                    {
                        query += " AND A.Date = @DateFilter";
                    }
                    query += " ORDER BY I.InternID, A.Date DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Department", department);
                        if (!string.IsNullOrEmpty(nameFilter))
                        {
                            cmd.Parameters.AddWithValue("@NameFilter", "%" + nameFilter + "%");
                        }
                        if (!string.IsNullOrEmpty(dateFilter))
                        {
                            cmd.Parameters.AddWithValue("@DateFilter", dateFilter);
                        }
                        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        conn.Open();
                        adapter.Fill(dt);

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
                            lblMessage.Text = "No attendance records found for this department.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading attendance: " + ex.Message;
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string nameFilter = txtFilterName.Text.Trim();
            string dateFilter = txtFilterDate.Text.Trim();
            LoadAttendance(nameFilter, dateFilter);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFilterName.Text = "";
            txtFilterDate.Text = "";
            LoadAttendance();
        }
    }
}