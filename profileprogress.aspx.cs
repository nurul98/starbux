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
    public partial class profileprogress : System.Web.UI.Page
    {
        private SqlConnection deleteconnection;
        private SqlCommand deletecommand;

        static string cust_ID, delivery_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                onload();
            }
        }
        private void onload()
        {
            string strSQLconnection = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
            SqlCommand sqlCommandCustomerId = new SqlCommand("SELECT customer_ID AS id FROM Customer WHERE customer_username='" + User.Identity.Name + "'", sqlConnection);
            SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Delivery WHERE customer_username='" + User.Identity.Name + "' ORDER BY delivery_date,delivery_time,item_type", sqlConnection);

            try
            {
                if (sqlConnection.State.Equals(ConnectionState.Closed))
                    sqlConnection.Open();

                var reader = sqlCommandCustomerId.ExecuteReader();
                DataTable table = new DataTable();
                table.Load(reader);
                DataRow tbrow = table.Rows[0];
                cust_ID = tbrow["id"].ToString();

                if (sqlConnection.State.Equals(ConnectionState.Open))
                    sqlConnection.Close();

                if (sqlConnection.State.Equals(ConnectionState.Closed))
                    sqlConnection.Open();

                SqlDataReader reader2 = sqlCommand.ExecuteReader();

                order.DataSource = reader2;
                order.DataBind();

                if (sqlConnection.State.Equals(ConnectionState.Open))
                    sqlConnection.Close();

                if (sqlConnection.State.Equals(ConnectionState.Closed))
                    sqlConnection.Open();

                SqlCommand sqlCommandProfile = new SqlCommand("SELECT customer_ID,customer_firstname,customer_lastname,customer_IC,customer_address,customer_phone,customer_email,customer_gender FROM Customer WHERE (customer_ID = '" + cust_ID + "')", sqlConnection);
                var reader1 = sqlCommandProfile.ExecuteReader();

                DataTable table1 = new DataTable();
                table1.Load(reader1);
                DataRow tbrow1 = table1.Rows[0];

                customer_ID.Text = tbrow1["customer_ID"].ToString();
                first_name.Text = tbrow1["customer_firstname"].ToString();
                last_name.Text = tbrow1["customer_lastname"].ToString();
                IC.Text = tbrow1["customer_IC"].ToString();
                address.Text = tbrow1["customer_address"].ToString();
                phone.Text = tbrow1["customer_phone"].ToString();
                email.Text = tbrow1["customer_email"].ToString();
                gender.Text = tbrow1["customer_gender"].ToString();
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                sqlConnection.Close();
            }
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
                    // If were here then the method has allready been
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
        
        protected void Search_Click(object sender, EventArgs e)
        {
            if (String.Compare(DropDownSearch.Text.ToString(), "Delivery Date") == 0)
            {
                string strSQLconnection = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf.mdf; Trusted_Connection=True;User Instance=True";
                SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
                SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Delivery WHERE customer_username=@customer_username ORDER BY delivery_date,delivery_time,item_type", sqlConnection);
                sqlCommand.Parameters.Clear();
                sqlCommand.Parameters.AddWithValue("@customer_username", User.Identity.Name);
           
                try
                {
                    if (sqlConnection.State.Equals(ConnectionState.Open))
                        sqlConnection.Close();

                    if (sqlConnection.State.Equals(ConnectionState.Closed))
                        sqlConnection.Open();

                    SqlDataReader reader = sqlCommand.ExecuteReader();

                    order.DataSource = reader;
                    order.DataBind();

                    if (sqlConnection.State.Equals(ConnectionState.Open))
                        sqlConnection.Close();

                    if (sqlConnection.State.Equals(ConnectionState.Closed))
                        sqlConnection.Open();
                }
                catch (SqlException ex)
                {
                }
                finally
                {
                    sqlConnection.Close();
                }
            }
            if (String.Compare(DropDownSearch.Text.ToString(), "Delivery Time") == 0)
            {
                string strSQLconnection = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf.mdf; Trusted_Connection=True;User Instance=True";
                SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
                SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Delivery WHERE customer_username=@customer_username ORDER BY delivery_time,delivery_date,item_type", sqlConnection);
                sqlCommand.Parameters.Clear();
                sqlCommand.Parameters.AddWithValue("@customer_username", User.Identity.Name);
                
                try
                {
                    if (sqlConnection.State.Equals(ConnectionState.Open))
                        sqlConnection.Close();

                    if (sqlConnection.State.Equals(ConnectionState.Closed))
                        sqlConnection.Open();

                    SqlDataReader reader = sqlCommand.ExecuteReader();

                    order.DataSource = reader;
                    order.DataBind();

                    if (sqlConnection.State.Equals(ConnectionState.Open))
                        sqlConnection.Close();

                    if (sqlConnection.State.Equals(ConnectionState.Closed))
                        sqlConnection.Open();
                }
                catch (SqlException ex)
                {
                }
                finally
                {
                    sqlConnection.Close();
                }
            }
            if (String.Compare(DropDownSearch.Text.ToString(), "Item Type") == 0)
            {
                string strSQLconnection = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
                SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
                SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Delivery WHERE customer_username=@customer_username ORDER BY item_type,delivery_date,delivery_time", sqlConnection);
                sqlCommand.Parameters.Clear();
                sqlCommand.Parameters.AddWithValue("@customer_username", User.Identity.Name);

                try
                {
                    if (sqlConnection.State.Equals(ConnectionState.Open))
                        sqlConnection.Close();

                    if (sqlConnection.State.Equals(ConnectionState.Closed))
                        sqlConnection.Open();

                    SqlDataReader reader = sqlCommand.ExecuteReader();

                    order.DataSource = reader;
                    order.DataBind();

                    if (sqlConnection.State.Equals(ConnectionState.Open))
                        sqlConnection.Close();

                    if (sqlConnection.State.Equals(ConnectionState.Closed))
                        sqlConnection.Open();
                }
                catch (SqlException ex)
                {
                }
                finally
                {
                    sqlConnection.Close();
                }
            }
        }
    }
}