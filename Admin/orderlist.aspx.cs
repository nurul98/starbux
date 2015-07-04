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

namespace starbux.Admin
{
    public partial class orderlist : System.Web.UI.Page
    {
        static string strSQLconnection = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
        SqlConnection sqlConnection = new SqlConnection(strSQLconnection);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridNew();
                BindGridSent();
            }
        }
        private void BindGridNew()
        {
            SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Delivery WHERE delivery_status = '" + "New" + "'ORDER BY delivery_date", sqlConnection);

            try
            {
                if (sqlConnection.State.Equals(ConnectionState.Closed))
                    sqlConnection.Open();

                SqlDataReader readernew = sqlCommand.ExecuteReader();

                gdvNew.DataSource = readernew;
                gdvNew.DataBind();
            }

            catch (SqlException ex)
            {
                MessageBox.Show("Unable view new summary! Try again later");
            }
            finally
            {
                sqlConnection.Close();
            }
        }
        private void BindGridSent()
        {
            SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Delivery WHERE delivery_status = '" + "Sent" + "'ORDER BY delivery_date", sqlConnection);

            try
            {
                if (sqlConnection.State.Equals(ConnectionState.Closed))
                    sqlConnection.Open();

                SqlDataReader readersent = sqlCommand.ExecuteReader();

                gdvSent.DataSource = readersent;
                gdvSent.DataBind();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Unable view sent summary! Try again later");
            }
            finally
            {
                sqlConnection.Close();
            }
        }
        
        protected void btnSave_Click(object sender, EventArgs e)
        {
            for (int count = 0; count < gdvNew.Rows.Count; count++)
            {
                try
                {
                    GridViewRow gvrow = gdvNew.Rows[count];

                    string delivery_id = gvrow.Cells[0].Text;

                    DropDownList list = ((DropDownList)gdvNew.Rows[count].FindControl("drpdwnDecision"));

                    SqlCommand sqlUpdate1 = new SqlCommand();
                    sqlUpdate1.Connection = sqlConnection;
                    sqlUpdate1.CommandText = "Update Delivery SET delivery_status=@delivery_status WHERE delivery_ID=@delivery_ID";
                    sqlUpdate1.Parameters.Clear();
                    sqlUpdate1.Parameters.AddWithValue("@delivery_status", list.SelectedItem.ToString());
                    sqlUpdate1.Parameters.AddWithValue("@delivery_ID", delivery_id);

                    sqlConnection.Open();
                    int change = sqlUpdate1.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Unable to commit change! Try again later");
                }
                finally
                {
                    sqlConnection.Close();
                }
            }
            for (int count = 0; count < gdvSent.Rows.Count; count++)
            {
                try
                {
                    GridViewRow gvrow = gdvSent.Rows[count];

                    string delivery_id = gvrow.Cells[0].Text;

                    DropDownList list = ((DropDownList)gdvSent.Rows[count].FindControl("drpdwnDecision"));

                    SqlCommand sqlUpdate1 = new SqlCommand();
                    sqlUpdate1.Connection = sqlConnection;
                    sqlUpdate1.CommandText = "Update Delivery SET delivery_status=@delivery_status WHERE delivery_ID=@delivery_ID";
                    sqlUpdate1.Parameters.Clear();
                    sqlUpdate1.Parameters.AddWithValue("@delivery_status", list.SelectedItem.ToString());
                    sqlUpdate1.Parameters.AddWithValue("@delivery_ID", delivery_id);

                    sqlConnection.Open();
                    int change = sqlUpdate1.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("Unable to commit change! Try again later");
                }
                finally
                {
                    sqlConnection.Close();
                }
            }
          
            MessageBox.Show("Update successful");
            BindGridNew();
            BindGridSent();
        }
        public static void ClearControls(Control Parent)
        {
            if (Parent is TextBox)
            {
                (Parent as TextBox).Text = string.Empty;
            }
            else
            {
                foreach (Control c in Parent.Controls)
                    ClearControls(c);
            }
        }
        public class MessageBox
        {
            private static System.Collections.Hashtable m_executingPages = new System.Collections.Hashtable();
            private MessageBox()
            {
            }
            public static void Show(string sMessage)
            {
                // If this is the first time a page has called this method then
                if (!m_executingPages.Contains(HttpContext.Current.Handler))
                {
                    // Attempt to cast HttpHandler as a Page.
                    Page executingPage = HttpContext.Current.Handler as Page;
                    if (executingPage != null)
                    {
                        // Create a Queue to hold one or more messages.
                        System.Collections.Queue messageQueue = new System.Collections.Queue();
                        // Add our message to the Queue
                        messageQueue.Enqueue(sMessage);
                        // Add our message queue to the hash table. Use our page reference
                        // (IHttpHandler) as the key.
                        m_executingPages.Add(HttpContext.Current.Handler, messageQueue);
                        // Wire up Unload event so that we can inject
                        // some JavaScript for the alerts.
                        executingPage.Unload += new EventHandler(ExecutingPage_Unload);
                    }
                }
                else
                {
                    // If were here then the method has already been
                    // called from the executing Page.
                    // We have allready created a message queue and stored a
                    // reference to it in our hastable.
                    System.Collections.Queue queue = (System.Collections.Queue)m_executingPages[HttpContext.Current.Handler];
                    // Add our message to the Queue
                    queue.Enqueue(sMessage);
                }
            }
            // Our page has finished rendering so lets output the JavaScript to produce the alert's
            private static void ExecutingPage_Unload(object sender, EventArgs e)
            {
                // Get our message queue from the hashtable
                System.Collections.Queue queue = (System.Collections.Queue)m_executingPages[HttpContext.Current.Handler];
                if (queue != null)
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    // How many messages have been registered?
                    int iMsgCount = queue.Count;
                    // Use StringBuilder to build up our client slide JavaScript.
                    sb.Append("<script language='javascript'>");
                    // Loop round registered messages
                    string sMsg;
                    while (iMsgCount-- > 0)
                    {
                        sMsg = (string)queue.Dequeue();
                        sMsg = sMsg.Replace("\n", "\\n");
                        sMsg = sMsg.Replace("\"", "'");
                        sb.Append(@"alert( """ + sMsg + @""" );");
                    }
                    // Close our JS
                    sb.Append(@"</script>");
                    // Were done, so remove our page reference from the hashtable
                    m_executingPages.Remove(HttpContext.Current.Handler);
                    // Write the JavaScript to the end of the response stream.
                    HttpContext.Current.Response.Write(sb.ToString());
                }
            }
        }
       
    }
}