using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class RemoveIntern : System.Web.UI.Page
{
    string conStr = ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null || Session["Role"] == null || Session["Role"].ToString() != "DepartmentAdmin")
        {
            Response.Redirect("Login.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadInterns(""); // Load all interns of current department
        }
    }

    protected void LoadInterns(string cnic)
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string department = Session["Department"]?.ToString();
            string query = "SELECT * FROM Interns WHERE Department = @Department";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Department", department);

            if (!string.IsNullOrEmpty(cnic))
            {
                query += " AND CNIC LIKE @CNIC";
            }

            if (!string.IsNullOrEmpty(cnic))
            {
                cmd.Parameters.AddWithValue("@CNIC", "%" + cnic + "%");
            }

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            gvInterns.DataSource = dt;
            gvInterns.DataBind();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadInterns(txtSearchCNIC.Text.Trim());
    }

    protected void gvInterns_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteIntern")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvInterns.Rows[index];
            string internId = row.Cells[0].Text;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();

                // Step 1: Delete related records from Attendance table
                string deleteAttendanceQuery = "DELETE FROM Attendance WHERE InternID = @InternID";
                using (SqlCommand cmdAttendance = new SqlCommand(deleteAttendanceQuery, con))
                {
                    cmdAttendance.Parameters.AddWithValue("@InternID", internId);
                    cmdAttendance.ExecuteNonQuery();
                }

                // Step 2: Delete record from Interns table
                string deleteInternQuery = "DELETE FROM Interns WHERE InternID = @InternID";
                using (SqlCommand cmdIntern = new SqlCommand(deleteInternQuery, con))
                {
                    cmdIntern.Parameters.AddWithValue("@InternID", internId);
                    cmdIntern.ExecuteNonQuery();
                }

                // Step 3: Delete record from Users table
                string deleteUserQuery = "DELETE FROM Users WHERE Username = @Username";
                using (SqlCommand cmdUser = new SqlCommand(deleteUserQuery, con))
                {
                    cmdUser.Parameters.AddWithValue("@Username", internId); // Username is same as InternID
                    cmdUser.ExecuteNonQuery();
                }

                con.Close();

                lblMessage.Text = "Intern removed successfully!";
                LoadInterns(txtSearchCNIC.Text.Trim());
            }
        }
    }

    protected void gvInterns_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        // Optional: add row styling if needed
    }
}