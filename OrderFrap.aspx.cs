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
    public partial class OrderFrap : System.Web.UI.Page
    {
        private SqlConnection updateconnection2, updateconnection2a, updateconnection3, deleteconnection, updateconnection2b;
        private SqlCommand updatecommand2, updatecommand2a, updatecommand3, deletecommand, updatecommand2b;

        static string customerid, deliveryID;
        double current_quantity, current_price, current_quantity2, current_price2, calculatequantity, calculateprice;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                onload();
            }
        }
        public string GetConnectionString()
        {
            //sets the connection string from your web config file "Table_Connection" is the name of your Connection String
            return System.Configuration.ConfigurationManager.ConnectionStrings["Table_Connection"].ConnectionString;
        }
        public int Count_Row()
        {
            Random rand = new Random();
            System.Data.SqlClient.SqlConnection conn3 = new System.Data.SqlClient.SqlConnection(GetConnectionString());
            string sql = "SELECT COUNT(*) FROM Delivery AS no";
            conn3.Open();
            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sql, conn3);
            return (Convert.ToInt32(cmd.ExecuteScalar())) + 1 + rand.Next(1, 100);
        }
        private void onload()
        {
            topitem();

            string strSQLconnection = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
            SqlCommand sqlCommandCustomerId = new SqlCommand("SELECT customer_ID AS id FROM Customer WHERE customer_username='" + User.Identity.Name + "'", sqlConnection);
            SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Delivery WHERE customer_username=@customer_username AND item_type=@item_type AND delivery_status=@delivery_status", sqlConnection);
            sqlCommand.Parameters.Clear();
            sqlCommand.Parameters.AddWithValue("@customer_username", User.Identity.Name);
            sqlCommand.Parameters.AddWithValue("@item_type", "Frap");
            sqlCommand.Parameters.AddWithValue("@delivery_status", "New");

            try
            {
                if (sqlConnection.State.Equals(ConnectionState.Closed))
                    sqlConnection.Open();

                SqlDataReader reader = sqlCommandCustomerId.ExecuteReader();
                //DataTable table = new DataTable();
                //table.Load(reader);
                //DataRow tbrow = table.Rows[0];
                reader.Read();
                customerid = reader["id"].ToString();

                if (sqlConnection.State.Equals(ConnectionState.Open))
                    sqlConnection.Close();

                if (sqlConnection.State.Equals(ConnectionState.Closed))
                    sqlConnection.Open();

                SqlDataReader reader3 = sqlCommand.ExecuteReader();

                gridfrap.DataSource = reader3;
                gridfrap.DataBind();

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
        protected void AddOrder_Click(object sender, EventArgs e)
        {
            double quantity = Convert.ToDouble(BevQty.Text);

            double price, total_price, syrup_price, topping_price;

            if (String.Compare(BevSize.SelectedItem.ToString(), "Tall (RM 13.50)") == 0)
            {
                price = 13.5;
            }
            else if (String.Compare(BevSize.SelectedItem.ToString(), "Grande (RM 14.50)") == 0)
            {
                price = 14.5;
            }
            else if (String.Compare(BevSize.SelectedItem.ToString(), "Venti (RM 15.50)") == 0)
            {
                price = 15.5;
            }
            else
            {
                price = 0.0;
            }
            if (String.Compare(RadioButtonSyrup.SelectedItem.ToString(), "Toffee Nut") == 0)
            {
                syrup_price = 1.0;
            }
            else if (String.Compare(RadioButtonSyrup.SelectedItem.ToString(), "Vanila") == 0)
            {
                syrup_price = 1.0;
            }
            else if (String.Compare(RadioButtonSyrup.SelectedItem.ToString(), "Caramel") == 0)
            {
                syrup_price = 1.0;
            }
            else if (String.Compare(RadioButtonSyrup.SelectedItem.ToString(), "Hazelnut") == 0)
            {
                syrup_price = 1.0;
            }
            else
            {
                syrup_price = 0.0;
            }
            if (String.Compare(RadioButtonTopping.SelectedItem.ToString(), "Chocolate Drizzle") == 0)
            {
                topping_price = 1.0;
            }
            else if (String.Compare(RadioButtonTopping.SelectedItem.ToString(), "Caramel Drizzle") == 0)
            {
                topping_price = 1.0;
            }
            else if (String.Compare(RadioButtonTopping.SelectedItem.ToString(), "Toffee Nut Sprinkle") == 0)
            {
                topping_price = 1.0;
            }
            else if (String.Compare(RadioButtonTopping.SelectedItem.ToString(), "Crandberry Sprinkle") == 0)
            {
                topping_price = 1.0;
            }
            else
            {
                topping_price = 0.0;
            }
            total_price = (price * quantity) + syrup_price + topping_price;

            updateconnection2 = new SqlConnection();
            updateconnection2.ConnectionString = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            updatecommand2 = new SqlCommand();
            updatecommand2.Connection = updateconnection2;

            updatecommand2.CommandText = "INSERT INTO Delivery (delivery_ID,customer_username,customer_ID,item_type,item_name,item_description,item_quantity,delivery_date,delivery_time,delivery_status,price) VALUES "

                        + " (@delivery_ID,@customer_username,@customer_ID,@item_type,@item_name,@item_description,@item_quantity,@delivery_date,@delivery_time,@delivery_status,@price)";

            updatecommand2.Parameters.Clear();

            updatecommand2.Parameters.AddWithValue("@delivery_ID", "SD" + Count_Row());
            updatecommand2.Parameters.AddWithValue("@customer_username", User.Identity.Name);
            updatecommand2.Parameters.AddWithValue("@customer_ID", customerid);
            updatecommand2.Parameters.AddWithValue("@item_type", "Frap");
            updatecommand2.Parameters.AddWithValue("@item_name", RadioButtonDrink.Text);
            updatecommand2.Parameters.AddWithValue("@item_description", BevSize.Text + " " + RadioButtonMilk.Text + " " + RadioButtonSyrup.Text + " " + RadioButtonTopping.Text);
            updatecommand2.Parameters.AddWithValue("@item_quantity", quantity);
            updatecommand2.Parameters.AddWithValue("@delivery_date", Date.Text);
            updatecommand2.Parameters.AddWithValue("@delivery_time", DropDownTime.Text);
            updatecommand2.Parameters.AddWithValue("@delivery_status", "New");
            updatecommand2.Parameters.AddWithValue("@price", total_price);

            string strSQLconnection2 = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            SqlConnection sqlConnection2 = new SqlConnection(strSQLconnection2);
            SqlCommand sqlquantity = new SqlCommand("SELECT * FROM Beverage WHERE beverage_name=@beverage_name", sqlConnection2);
            sqlquantity.Parameters.Clear();

            sqlquantity.Parameters.AddWithValue("@beverage_name", RadioButtonDrink.Text);

            if (sqlConnection2.State.Equals(ConnectionState.Open))
                sqlConnection2.Close();

            if (sqlConnection2.State.Equals(ConnectionState.Closed))
                sqlConnection2.Open();

            SqlDataReader reader2 = sqlquantity.ExecuteReader();

            if (reader2.Read())
            {
                string quan = reader2["sold_quantity"].ToString();
                string pri = reader2["sold_price"].ToString();
                current_quantity = Convert.ToDouble(quan);
                current_price = Convert.ToDouble(pri);
            }
            else
            {
                current_quantity = 0.0;
                current_price = 0.0;
            }
            double latestquantity = current_quantity + quantity;
            double latestprice = current_price + total_price;

            updateconnection2a = new SqlConnection();
            updateconnection2a.ConnectionString = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            updatecommand2a = new SqlCommand();
            updatecommand2a.Connection = updateconnection2a;

            updatecommand2a.CommandText = "UPDATE Beverage SET sold_quantity=@sold_quantity,sold_price=@sold_price WHERE beverage_name=@beverage_name";

            updatecommand2a.Parameters.Clear();

            updatecommand2a.Parameters.AddWithValue("@sold_quantity", latestquantity);
            updatecommand2a.Parameters.AddWithValue("@sold_price", latestprice);
            updatecommand2a.Parameters.AddWithValue("@beverage_name", RadioButtonDrink.Text);

            DateTime datepick = Convert.ToDateTime(Date.Text);

            try
            {
                if (DateTime.Now.AddDays(-1) > datepick || datepick > DateTime.Now.AddMonths(1))
                {
                    throw new ArgumentOutOfRangeException();
                }
                else
                {
                    try
                    {
                        updateconnection2.Open();
                        updateconnection2a.Open();
                        int change = updatecommand2.ExecuteNonQuery();
                        if (change > 0)
                        {
                            MessageBox.Show("Order process succesful! ");
                        }
                        else
                            MessageBox.Show("Cannot make order, try again later!");

                        int change2 = updatecommand2a.ExecuteNonQuery();
                        if (change2 > 0)
                        {
                            MessageBox.Show("Sales calculation succesful! ");
                            onload();
                        }
                        else
                            MessageBox.Show("Calculation process failed, try again later!");
                    }
                    catch (SqlException ex)
                    {
                        MessageBox.Show("Order process error occured. Order failed.");
                    }
                    finally
                    {
                        updateconnection2.Close();
                        updateconnection2a.Close();
                    }
                }
            }
            catch (ArgumentOutOfRangeException ex)
            {
                MessageBox.Show("Booking date cannot be less than today or more than one month from today, Please Re-enter date");
            }
            finally
            {

            }
            onload();
        }
        public int Generate_Bil()
        {
            Random rand = new Random();

            return rand.Next();
        }
        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btndetails = sender as ImageButton;
            GridViewRow gvrow = (GridViewRow)btndetails.NamingContainer;
            deliveryID = gvrow.Cells[0].Text;
            string Itemname = gvrow.Cells[1].Text;
            DeleteItem2.Text = Itemname;
            string Quantity = gvrow.Cells[3].Text;
            DeleteQuantity2.Text = Quantity;
            string Priceitem = gvrow.Cells[4].Text;
            DeletePrice2.Text = Priceitem;

            this.ModalPopupExtender2.Show();
        }
        protected void confirmdelete_Click(object sender, EventArgs e)
        {
            deleteconnection = new SqlConnection();
            deleteconnection.ConnectionString = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            deletecommand = new SqlCommand();
            deletecommand.Connection = deleteconnection;
            deletecommand.CommandText = "DELETE FROM Delivery WHERE delivery_ID=@delivery_ID ";

            deletecommand.Parameters.Clear();
            deletecommand.Parameters.AddWithValue("@delivery_ID", deliveryID);

            string strSQLconnection2c = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            SqlConnection sqlConnection2c = new SqlConnection(strSQLconnection2c);
            SqlCommand sqlquantity2 = new SqlCommand("SELECT * FROM Beverage WHERE beverage_name=@beverage_name", sqlConnection2c);
            sqlquantity2.Parameters.Clear();

            sqlquantity2.Parameters.AddWithValue("@beverage_name", DeleteItem2.Text);

            if (sqlConnection2c.State.Equals(ConnectionState.Open))
                sqlConnection2c.Close();

            if (sqlConnection2c.State.Equals(ConnectionState.Closed))
                sqlConnection2c.Open();

            SqlDataReader reader2c = sqlquantity2.ExecuteReader();

            if (reader2c.Read())
            {
                string quan2 = reader2c["sold_quantity"].ToString();
                string pri2 = reader2c["sold_price"].ToString();
                current_quantity2 = Convert.ToDouble(quan2);
                current_price2 = Convert.ToDouble(pri2);
            }
            else
            {
                current_quantity2 = 0.0;
                current_price2 = 0.0;
            }

            calculatequantity = Convert.ToInt32(DeleteQuantity2.Text);
            calculateprice = Convert.ToDouble(DeletePrice2.Text);

            double latestquantity2 = current_quantity2 - calculatequantity;
            double latestprice2 = current_price2 - calculateprice;

            updateconnection2b = new SqlConnection();
            updateconnection2b.ConnectionString = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            updatecommand2b = new SqlCommand();
            updatecommand2b.Connection = updateconnection2b;

            updatecommand2b.CommandText = "UPDATE Beverage SET sold_quantity=@sold_quantity,sold_price=@sold_price WHERE beverage_name=@beverage_name";

            updatecommand2b.Parameters.Clear();

            updatecommand2b.Parameters.AddWithValue("@sold_quantity", latestquantity2);
            updatecommand2b.Parameters.AddWithValue("@sold_price", latestprice2);
            updatecommand2b.Parameters.AddWithValue("@beverage_name", DeleteItem2.Text);

            try
            {
                deleteconnection.Open();
                updateconnection2b.Open();
                int change = deletecommand.ExecuteNonQuery();
                int change2 = updatecommand2b.ExecuteNonQuery();
                if (change > 0)
                {
                    MessageBox.Show("Delivery Change Succesfully made!");
                    onload();
                }
                else
                    MessageBox.Show("Cannot execute delete from delivery try again later!");
                if (change2 > 0)
                {
                    MessageBox.Show("Calculation Succesfully made!");
                    onload();
                }
                else
                    MessageBox.Show("Cannot execute calculation try again later!");
            }
            catch (SqlException ex)
            {
                MessageBox.Show("An error occured. Update failed.");
            }
            finally
            {
                deleteconnection.Close();
                updateconnection2b.Close();
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

        protected void OrderNow_Click(object sender, EventArgs e)
        {
            updateconnection3 = new SqlConnection();
            updateconnection3.ConnectionString = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            updatecommand3 = new SqlCommand();
            updatecommand3.Connection = updateconnection3;

            updatecommand3.CommandText = "UPDATE Delivery SET bil_no=@bil_no WHERE delivery_status=@delivery_status";

            updatecommand3.Parameters.Clear();
            updatecommand3.Parameters.AddWithValue("@bil_no", Convert.ToString(Generate_Bil()));
            updatecommand3.Parameters.AddWithValue("@delivery_status", "New");

            try
            {
                updateconnection3.Open();
                int change = updatecommand3.ExecuteNonQuery();
                if (change > 0)
                {
                    MessageBox.Show("Bill successfully generated!");
                    Response.Redirect("Bill_No.aspx");
                }
                else
                    MessageBox.Show("Cannot execute bil no try again later!");
            }
            catch (SqlException ex)
            {
                MessageBox.Show("An error occured. Update failed.");
            }
            finally
            {
                updateconnection3.Close();
            }
        }
        protected void topitem()
        {
            string strSQLconnection = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
            SqlConnection sqlConnection = new SqlConnection(strSQLconnection);

            SqlCommand sqlCommand = new SqlCommand("SELECT MAX(sold_quantity) AS chose FROM Beverage ", sqlConnection);
            sqlConnection.Open();
            SqlDataReader reader2 = sqlCommand.ExecuteReader();

            if (reader2.Read())
            {
                string strSQLconnection2 = @"Data Source=(LocalDb)\v11.0;AttachDbFilename=|DataDirectory|\Sbux_On9.mdf; Trusted_Connection=True;User Instance=True";
                SqlConnection sqlConnection2 = new SqlConnection(strSQLconnection2);

                string quant = reader2["chose"].ToString();
                double quantit = Convert.ToInt32(quant);

                SqlCommand sqlCommand2 = new SqlCommand("SELECT * FROM Beverage WHERE sold_quantity=@sold_quantity ", sqlConnection2);
                sqlCommand2.Parameters.Clear();
                sqlCommand2.Parameters.AddWithValue("@sold_quantity", quantit);

                sqlConnection2.Open();
                SqlDataReader reader2a = sqlCommand2.ExecuteReader();
                reader2a.Read();

                Top.Text = reader2a["beverage_name"].ToString();
                string getitem = reader2a["beverage_name"].ToString();

                if (String.Compare(getitem.ToString(), "Toffee Nut") == 0)
                {
                    Top1.ImageUrl = "images/tfn.jpg";
                }
                if (String.Compare(getitem.ToString(), "Java Chip") == 0)
                {
                    Top1.ImageUrl = "images/fcmf.jpg";
                }
                if (String.Compare(getitem.ToString(), "Green Tea Cream") == 0)
                {
                    Top1.ImageUrl = "images/gtcrm.jpg";
                }
                if (String.Compare(getitem.ToString(), "Chocolate Cream Chip") == 0)
                {
                    Top1.ImageUrl = "images/mocrm.jpg";
                }
                if (String.Compare(getitem.ToString(), "Strawberry Cream") == 0)
                {
                    Top1.ImageUrl = "images/sberrycrm.jpg";
                }
            }
            else
            {
                MessageBox.Show("failed top");
            }
                sqlConnection.Close();
            }
        }
    
}