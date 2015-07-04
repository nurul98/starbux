<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOrder.master" AutoEventWireup="true" CodeBehind="OrderFrap.aspx.cs" Inherits="starbux.OrderFrap" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 28px;
        }
        .style2
        {
            height: 32px;
            width: 127px;
            text-align: justify;
        }
        .style3
        {
            height: 37px;
            width: 669px;
        }
        .style6
        {
            width: 669px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
       <h2>Frappuccino® Blended Beverages</h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I would like to order.......</p>
       <p>
           &nbsp;</p>
   
    <table class="style1">
     <tr>
        <td class="style2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Delivery Date :&nbsp;&nbsp;&nbsp;&nbsp; </td>
       <td class="style6">&nbsp;&nbsp;<asp:TextBox ID="Date" runat="server" Width="107px"></asp:TextBox>
        
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
       Delivery Time :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:DropDownList ID="DropDownTime" runat="server">
               <asp:ListItem>11 am</asp:ListItem>
               <asp:ListItem>12 pm</asp:ListItem>
               <asp:ListItem>1 pm</asp:ListItem>
               <asp:ListItem>2 pm</asp:ListItem>
               <asp:ListItem>3 pm</asp:ListItem>
               <asp:ListItem>4 pm</asp:ListItem>
               <asp:ListItem>5 pm</asp:ListItem>
               <asp:ListItem>6 pm</asp:ListItem>
           </asp:DropDownList>
         </td>
        </tr>
        <tr>
        <td class="style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Quantity :&nbsp;&nbsp;&nbsp;&nbsp; </td>
       <td class="style3">&nbsp;&nbsp;<asp:DropDownList ID="BevQty" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
        </asp:DropDownList></td>
        </tr>
         <tr> 
                <td class="style2">
                    &nbsp;&nbsp;&nbsp; Choose your size :</td>&nbsp;
                <td class="style6">
                    &nbsp;
                    <asp:DropDownList ID="BevSize" runat="server">
                        <asp:ListItem>Tall (RM 13.50)</asp:ListItem>
                        <asp:ListItem>Grande (RM 14.50)</asp:ListItem>
                        <asp:ListItem>Venti (RM 15.50)</asp:ListItem>
                    </asp:DropDownList>
                </td>
        </tr>   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <tr>
                <td class="style2">
&nbsp;&nbsp;&nbsp;&nbsp;Choose your milk :<br />
&nbsp;&nbsp;&nbsp;(No Additional Cost)</td>
                <td class="style6">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:RadioButtonList ID="RadioButtonMilk" 
                        runat="server" Height="36px" RepeatDirection="Horizontal" Width="365px">
                        <asp:ListItem>Full Cream</asp:ListItem>
                        <asp:ListItem>Low Fat</asp:ListItem>
                        <asp:ListItem>Soy Milk</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add your syrup :<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    (RM 1.00)</td>
                <td class="style6">
                    &nbsp;&nbsp;
                    <asp:RadioButtonList ID="RadioButtonSyrup" runat="server" Height="44px" 
                        RepeatDirection="Horizontal" Width="671px">
                        <asp:ListItem>No Syrup</asp:ListItem>
                        <asp:ListItem>Toffee Nut</asp:ListItem>
                        <asp:ListItem>Vanila</asp:ListItem>
                        <asp:ListItem>Caramel</asp:ListItem>
                        <asp:ListItem>Hazelnut</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;&nbsp;&nbsp;&nbsp; Add your topping :<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    (RM 1.00)</td>
                <td class="style6">
                    <asp:RadioButtonList ID="RadioButtonTopping" runat="server" Height="51px" 
                        RepeatDirection="Horizontal" Width="744px">
                        <asp:ListItem>No Topping</asp:ListItem>
                        <asp:ListItem>Chocolate Drizzle</asp:ListItem>
                        <asp:ListItem>Caramel Drizzle</asp:ListItem>
                        <asp:ListItem>Toffee Nut Sprinkle</asp:ListItem>
                        <asp:ListItem>Crandberry Sprinkle</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;&nbsp;&nbsp; Choose your drink :</td>
                <td class="style6">
           <asp:RadioButtonList ID="RadioButtonDrink" 
           runat="server" Height="44px" 
            RepeatDirection="Horizontal" Width="745px" DataSourceID="SqlDataSource1" 
           DataTextField="beverage_name" DataValueField="beverage_name">
      
        </asp:RadioButtonList>
       
                </td>
            </tr>
              </table>
       
            
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
       <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

               
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:ImageButton ID="ToffeeNutFrap" runat="server" Height="114px" 
        ImageUrl="~/images/tfn.jpg" Width="116px" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 
                &nbsp;

        <asp:ImageButton ID="JavaChip" runat="server" Height="114px" 
        ImageUrl="~/images/fcmf.jpg" Width="116px" /> &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="GreenTeaCream" runat="server" Height="114px" 
        ImageUrl="~/images/gtcrm.jpg" Width="116px" /> &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;

        <asp:ImageButton ID="ChocolateCreamChip" runat="server" Height="114px" 
        ImageUrl="~/images/mocrm.jpg" Width="116px" /> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;

         <asp:ImageButton ID="StrawberryCream" runat="server" Height="114px" 
        ImageUrl="~/images/sberrycrm.jpg" Width="116px" /> &nbsp; &nbsp; &nbsp; &nbsp; 

    </p>
    &nbsp&nbsp
                  
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:Table_Connection %>" 
           SelectCommand="SELECT [beverage_name] FROM [Beverage]"></asp:SqlDataSource>
       
    <p>
        &nbsp;</p>
    <p>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; 
        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Image 
            ID="Image1" runat="server" 
            Height="68px" ImageUrl="~/images/hot.gif" Width="68px" />
        &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="Top1" runat="server" Height="114px" 
        ImageUrl="~/images/sberrycrm.jpg" Width="116px" /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

     

    </p>
       <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
       <asp:Label ID="Top" runat="server" Text="Top Item"></asp:Label>
       <br />
            
    &nbsp;&nbsp;&nbsp;&nbsp;
 
        <asp:GridView ID="gridfrap" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" CellSpacing="10" ForeColor="#333333" GridLines="None" 
            Width="846px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="delivery_ID" HeaderText="Delivery ID" 
                    SortExpression="frap_ID" />
                <asp:BoundField DataField="item_name" HeaderText="Name" />
                <asp:BoundField DataField="item_description" HeaderText="Description" />
                <asp:BoundField DataField="item_quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="price" HeaderText="Total Price" />
                <asp:BoundField DataField="delivery_status" HeaderText="Status" />
                <asp:TemplateField HeaderText="Delete">
                   <ItemTemplate>
                      <asp:ImageButton ID="btnDelete" runat="server" 
                         ImageUrl="~/images/delete-icon.png" onclick="btnDelete_Click"/>
                   </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
<asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Date" Format="dd-MMM-yyyy">
    </asp:CalendarExtender>

    <asp:Button ID="btnShowPopup2" runat="server" style="display:none" />
<asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="btnShowPopup2" PopupControlID="pnlpopup2" BackgroundCssClass="modalBackground"
CancelControlID="canceldelete">
</asp:ModalPopupExtender>
<asp:Panel ID="pnlpopup2" runat="server" BackColor="White" Height="269px" Width="400px" BorderColor="Brown" BorderStyle="Ridge" style="display:none">
<table width="100%" style="border:Solid 3px #0000A0; width:100%; height:100%" cellpadding="0" cellspacing="0">
<tr style="background-color:#0000A0">
<td colspan="2" style=" height:10%; color:Black; font-weight:bold; font-size:larger" align="center">Delete Order</td>
</tr>
<tr>
<td align="center">
<h4>Are you sure you want to delete? </h4>
</td>
</tr>
<tr>
<td align="right">
<h4>Item Name: </h4>
</td>
<td>
&nbsp; &nbsp; &nbsp;
    <asp:Label ID="DeleteItem2" runat="server" Enabled="True"></asp:Label>
</td>
</tr>
<tr>
<td align="right">
<h4>Quantity: </h4>
</td>
<td >
    &nbsp; &nbsp; &nbsp;
    <asp:Label ID="DeleteQuantity2" runat="server" Enabled="True"></asp:Label>
</td>
</tr>
<tr>
<td align="right" style=" width:45%">
<h4>Total Price:</h4> 
</td>
<td>
&nbsp; &nbsp; &nbsp;
  <asp:Label ID="DeletePrice2" runat="server" Enabled="True"></asp:Label>
</td>
</tr>

<tr>
<td align="center">
<asp:Button ID="confirmdelete" runat="server" Text="OK" CssClass="myButton" onclick="confirmdelete_Click" />
<asp:Button ID="canceldelete" runat="server" Text="Cancel" CssClass="myButton" />
</td>
</tr>
</table>
   
</asp:Panel>    
   
   
    
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton 
            ID="AddOrder" runat="server" onclick="AddOrder_Click">+ Add Order</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="OrderNow" runat="server" onclick="OrderNow_Click" >Order Now!</asp:LinkButton>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
</asp:Content>
