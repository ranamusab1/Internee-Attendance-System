using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewInterns : System.Web.UI.Page
{
    string conStr = ConfigurationManager.ConnectionStrings["PIAConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null || Session["Role"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadInterns();
        }
    }

    protected void LoadInterns()
    {
        using (SqlConnection con = new SqlConnection(conStr))
        {
            string department = Session["Department"]?.ToString();
            string role = Session["Role"].ToString();

            string query;

            if (role == "MainAdmin")
            {
                // MainAdmin can view all interns
                query = "SELECT InternID, InternName, CNIC, ContactNumber, Department FROM Interns";
            }
            else
            {
                // DepartmentAdmin sees interns from their department only
                query = "SELECT InternID, InternName, CNIC, ContactNumber, Department FROM Interns WHERE Department = @Department";
            }

            SqlCommand cmd = new SqlCommand(query, con);
            if (role != "MainAdmin")
            {
                cmd.Parameters.AddWithValue("@Department", department);
            }

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            gvInterns.DataSource = dt;
            gvInterns.DataBind();
        }
    }
}
