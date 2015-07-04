<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHome.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="starbux.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="column_box">
    <div class="column1_content">
        <h3>
                    Christmas Promotions are back!</h3>
        <div class="column_text">
            <div class="img_bg">
                <img src="images/img1.jpg" alt="" title="" />
            </div>
            <p>
                The holidays are the perfect time to celebrate the spirit of sharing. Starbucks is a place where stories are shared, where the holiday spirit is brought to life. Each story is a thread in the tapestry of holiday. And every story starts somewhere. In Starbucks, it starts over your favorite holiday cup.</p>
        </div>
        <div class="column_content_bot">
        </div>
    </div>
    <div class="column2_content">
        <h3>
                    Introducing Starbucks Card!</h3>
        <div class="column_text">
            <div class="img_bg">
                <img src="images/img2.jpg" alt="" title="" />
            </div>
            <p>
                        Starbucks Malaysia has introduced Starbucks Card in conjunction with the Christmas promo.The Starbucks Card comes in three design, two Christmas edition 
                        and one of them is standard. Both are translucent.
                        Activation of the each card costs MYR 20.
        </div>
        <div class="column_content_bot">
        </div>
    </div>
    <div class="column3_content">
        <h3>
                    Online Order Now!</h3>
        <div class="column_text">
            <div class="img_bg">
                <asp:ImageButton ID="OnlineOrderNow" runat="server" 
                    ImageUrl="~/images/img3.jpg" PostBackUrl="~/Login.aspx" />
            </div>
            <p>
                        Starbucks plans to continue to rapidly expand its business, grow its specialty sales and other operations, and selectively pursue opportunities to leverage the Starbucks brand through the introduction of new products and the development of new distribution channels.</a></p>
        </div>
        <div class="column_content_bot">
        </div>
    </div>
    <div class="clear">
    </div>
</div>
</asp:Content>
