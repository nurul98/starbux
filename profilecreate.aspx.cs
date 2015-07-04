﻿using System;
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
    public partial class profilecreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string GetConnectionString()
        {
            //sets the connection string from your web config file "Table_Connection" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["Table_Connection"].ConnectionString;
        }
        private void ExecuteInsert(string ID, string IC, string firstname, string lastname, string username, string email, string address, string phone, string gender)
        {
            System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(GetConnectionString());

            string sql = "INSERT INTO Customer (customer_ID, customer_IC,customer_firstname, customer_lastname, customer_username, customer_email, customer_address, customer_phone, customer_gender) VALUES "

                        + " (@customer_ID,@customer_IC,@customer_firstname,@customer_lastname,@customer_username,@customer_email,@customer_address,@customer_phone,@customer_gender)";
            try
            {
                conn.Open();
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sql, conn);
                System.Data.SqlClient.SqlParameter[] param = new System.Data.SqlClient.SqlParameter[9];

                param[0] = new System.Data.SqlClient.SqlParameter("@customer_ID", System.Data.SqlDbType.Char, 10);
                param[1] = new System.Data.SqlClient.SqlParameter("@customer_IC", System.Data.SqlDbType.Decimal);
                param[2] = new System.Data.SqlClient.SqlParameter("@customer_firstname", System.Data.SqlDbType.VarChar, 50);
                param[3] = new System.Data.SqlClient.SqlParameter("@customer_lastname", System.Data.SqlDbType.VarChar, 50);
                param[4] = new System.Data.SqlClient.SqlParameter("@customer_username", System.Data.SqlDbType.VarChar, 15);
                param[5] = new System.Data.SqlClient.SqlParameter("@customer_email", System.Data.SqlDbType.VarChar, 35);
                param[6] = new System.Data.SqlClient.SqlParameter("@customer_address", System.Data.SqlDbType.VarChar, 70);
                param[7] = new System.Data.SqlClient.SqlParameter("@customer_phone", System.Data.SqlDbType.Char, 10);
                param[8] = new System.Data.SqlClient.SqlParameter("@customer_gender", System.Data.SqlDbType.Char, 10);

                param[0].Value = ID;
                param[1].Value = IC;
                param[2].Value = firstname;
                param[3].Value = lastname;
                param[4].Value = username;
                param[5].Value = email;
                param[6].Value = address;
                param[7].Value = phone;
                param[8].Value = gender;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Error to create profile!";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                conn.Close();
            }
        }
        public int Count_Row()
        {
            Random rand = new Random();
            System.Data.SqlClient.SqlConnection conn3 = new System.Data.SqlClient.SqlConnection(GetConnectionString());
            string sql = "SELECT COUNT(*) FROM Customer AS no";
            conn3.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sql, conn3);
            return Convert.ToInt32(cmd.ExecuteScalar()) + (rand.Next(1, 100));
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
            private MessageBox() { }
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
        protected void Submit_Clear_Click(object sender, EventArgs e)
        {
            Response.Redirect("profilecreate.aspx");
        }
        protected void Submit_Register_Click(object sender, EventArgs e)
        {
            //call the method to execute insert to the database
            ExecuteInsert("SC" + Count_Row(), TxtIC1.Text + TxtIC2.Text + TxtIC3.Text, TxtFirstName.Text, TxtLastName.Text, User.Identity.Name, TxtEmail.Text, TxtAddress.Text, DropDownListPhone.Text + TxtPhone.Text, Gender.Text);

            MessageBox.Show("Customer record was successfully added!");

            ClearControls(Page);
            Response.Redirect("TermsnCondition.aspx");
        }
    }
}
