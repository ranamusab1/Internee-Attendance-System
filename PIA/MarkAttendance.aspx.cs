using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIA
{
    public partial class MarkAttendance : System.Web.UI.Page
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Role"] == null || Session["Role"].ToString() != "DepartmentAdmin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadInterns();
            }
        }

        private void LoadInterns()
        {
            string department = Session["Department"] as string;

            if (string.IsNullOrEmpty(department))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT InternID, InternName, CNIC FROM Interns WHERE Department = @Department";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Department", department);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            gvAttendance.DataSource = dt;
                            gvAttendance.DataBind();
                        }
                        else
                        {
                            gvAttendance.DataSource = null;
                            gvAttendance.DataBind();
                        }
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DateTime today = DateTime.Today;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                try
                {
                    foreach (GridViewRow row in gvAttendance.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            string internID = gvAttendance.DataKeys[row.RowIndex].Value?.ToString();
                            if (string.IsNullOrEmpty(internID))
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Invalid InternID for a row.');", true);
                                return;
                            }

                            CheckBox chkPresent = (CheckBox)row.FindControl("chkPresent");
                            if (chkPresent == null)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Checkbox not found for a row.');", true);
                                return;
                            }

                            string status = chkPresent.Checked ? "Present" : "Absent";

                            string checkQuery = "SELECT COUNT(*) FROM Attendance WHERE InternID = @InternID AND Date = @Date";
                            using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                            {
                                checkCmd.Parameters.AddWithValue("@InternID", internID);
                                checkCmd.Parameters.AddWithValue("@Date", today);
                                int count = (int)checkCmd.ExecuteScalar();

                                if (count == 0)
                                {
                                    string insertQuery = "INSERT INTO Attendance (InternID, Date, Status) VALUES (@InternID, @Date, @Status)";
                                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                                    {
                                        insertCmd.Parameters.AddWithValue("@InternID", internID);
                                        insertCmd.Parameters.AddWithValue("@Date", today);
                                        insertCmd.Parameters.AddWithValue("@Status", status);
                                        insertCmd.ExecuteNonQuery();
                                    }
                                }
                            }
                        }
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Attendance submitted successfully!');", true);
                    LoadInterns();
                }
                catch (SqlException ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('SQL Error: {ex.Message}');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
                }
            }
        }
    }
}