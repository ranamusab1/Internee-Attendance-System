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
                query += " WHERE CNIC LIKE @CNIC";
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
                string query = "DELETE FROM Interns WHERE InternID = @InternID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@InternID", internId);
                con.Open();
                cmd.ExecuteNonQuery();
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
