using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.ComponentModel;

namespace starbux
{
    public partial class TermsnCondition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strSQLconnection = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
            SqlCommand sqlCommandAdminDesignation = new SqlCommand("SELECT * FROM Admin WHERE username='" + User.Identity.Name + "'", sqlConnection);
           
            sqlConnection.Open();
            var reader = sqlCommandAdminDesignation.ExecuteReader();

            if (reader.Read())
            {
                Response.Redirect("Admin/orderlist.aspx");
            }
            sqlConnection.Close();
        }
    }
}