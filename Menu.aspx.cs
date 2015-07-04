using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace starbux
{
    public partial class Order : System.Web.UI.Page
    {
        protected void ondrink_click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OrderFrap.aspx");
        }
        protected void onfood_click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("OrderBakery.aspx");
        }
    }
    
}