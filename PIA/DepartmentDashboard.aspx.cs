using System;
using System.Web.UI;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PIA
{
    public partial class DepartmentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Role"] == null || Session["Role"].ToString() != "DepartmentAdmin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            lblUsername.Text = "User: " + Session["Username"].ToString();
            lblDepartment.Text = "Department: " + Session["Department"].ToString();
     
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}