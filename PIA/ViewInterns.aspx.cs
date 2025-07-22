using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PIA
{
    public partial class ViewInterns : System.Web.UI.Page
    {
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
            if (Session["Department"] == null)
                return;

            string department = Session["Department"].ToString();
            string connStr = ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT InternID, InternName, CNIC, ContactNumber, Department FROM Interns WHERE Department = @Department";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Department", department);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvInterns.DataSource = dt;
                gvInterns.DataBind();
            }
        }
    }
}
