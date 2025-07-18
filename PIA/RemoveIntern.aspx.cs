using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class RemoveIntern : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null)
            Response.Redirect("Login.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string cnic = txtCNIC.Text.Trim();
        string connStr = ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT InternID, InternName, CNIC FROM Interns WHERE CNIC = @CNIC";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CNIC", cnic);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblDetails.Text = $"Intern ID: {reader["InternID"]} <br/>Name: {reader["InternName"]} <br/>CNIC: {reader["CNIC"]}";
                btnRemove.Visible = true;
                Session["DeleteCNIC"] = cnic;
            }
            else
            {
                lblDetails.Text = "Intern not found.";
                btnRemove.Visible = false;
            }

            reader.Close();
        }
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        string cnic = Session["DeleteCNIC"]?.ToString();
        if (string.IsNullOrEmpty(cnic))
        {
            lblMsg.Text = "No intern selected to remove.";
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "DELETE FROM Interns WHERE CNIC = @CNIC";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@CNIC", cnic);

            con.Open();
            int rowsAffected = cmd.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                lblMsg.Text = "Intern removed successfully.";
                lblDetails.Text = "";
                btnRemove.Visible = false;
            }
            else
            {
                lblMsg.Text = "Failed to remove intern.";
            }
        }
    }
}
