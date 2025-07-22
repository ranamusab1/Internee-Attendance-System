using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PIA
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                    lblUsername.Text = "User: " + Session["Username"].ToString();

                if (Session["Department"] != null)
                    lblDepartment.Text = "Department: " + Session["Department"].ToString();
            }
        }
    }
}