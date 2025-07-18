using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace PIA
{
    public partial class ViewInterns : System.Web.UI.Page
    {
        private string connStr;
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string filter = txtSearch.Text.Trim();
            LoadInterns(filter);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            connStr = ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

            if (Session["Username"] == null || Session["Role"] == null || Session["Role"].ToString() != "DepartmentAdmin")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadInterns();
            }

        }
        private void LoadInterns(string filter = "")
        {
            string connStr = ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT InternID, InternName, CNIC, ContactNumber FROM Interns";

                if (!string.IsNullOrEmpty(filter))
                {
                    query += " WHERE InternName LIKE @Filter OR CNIC LIKE @Filter";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrEmpty(filter))
                {
                    cmd.Parameters.AddWithValue("@Filter", "%" + filter + "%");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                try
                {
                    con.Open();
                    da.Fill(dt);
                    GridViewInterns.DataSource = dt;
                    GridViewInterns.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Database Error: " + ex.Message);
                }
            }
        }

    }
}
