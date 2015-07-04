<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOrder.master" AutoEventWireup="true" CodeBehind="profileprogress.aspx.cs" Inherits="starbux.profileprogress" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>My Profile</h1>
    <br />
    <br />
        <table class="style1">
              <tr>
                 <td class="style2">
                    Customer ID:</td>
                <td>
                    <asp:Label ID="customer_ID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    First Name:</td>
                <td>
                    <asp:Label ID="first_name" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Last Name:</td>
                <td>
                    <asp:Label ID="last_name" runat="server"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td class="style2">
                    IC No:</td>
                <td>
                    <asp:Label ID="IC" runat="server"></asp:Label>
                </td> 
            </tr>
            <tr>
                <td class="style2">
                    Address:</td>
                <td>
                    <asp:Label ID="address" runat="server" BorderStyle="None"></asp:Label>
                </td> 
            </tr>
          
            <tr>
                <td class="style2">
                    E-Mail:</td>
                <td>
                    <asp:Label ID="email" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Phone:</td>
                <td>
                    <asp:Label ID="phone" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Age:</td>
                <td>
                    <asp:Label ID="age" runat="server"></asp:Label>
                    &nbsp;yrs</td>
            </tr>
            <tr>
                <td class="style2">
                    Gender:</td>
                <td>
                    <asp:Label ID="gender" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
    <asp:Button ID="update_profile" runat="server" Text="Update Profile" PostBackUrl="~/profileupdate.aspx" />
        <br />
        <br />
   <h1>Your Order</h1><br />  
    <table><tr>  <td>
            <asp:Button ID="Search" runat="server" Text="Sort By : " 
                onclick="Search_Click" />
            </td>
           <td>
            
               &nbsp;&nbsp;<asp:DropDownList ID="DropDownSearch" runat="server">
                   <asp:ListItem>Delivery Date</asp:ListItem>
                   <asp:ListItem>Delivery Time</asp:ListItem>
                   <asp:ListItem>Item Type</asp:ListItem>
               </asp:DropDownList> 
               
           </td></tr></table><br />
      <asp:GridView ID="order" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="10" ForeColor="#333333" GridLines="None">
                   <Columns>
                    <asp:BoundField DataField="delivery_ID" HeaderText="ID" 
                     SortExpression="delivery_ID" />
                     <asp:TemplateField HeaderText="Item Type" SortExpression="item_type">
                        <ItemTemplate>
                            <asp:Label ID="txttype" runat="server" Enabled="False" 
                                Text='<%# Bind("item_type") %>'></asp:Label>
                        </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Item Name" SortExpression="item_name">
                           <ItemTemplate>
                           <asp:Label ID="txtname" runat="server" Text='<%# Bind("item_name") %>' Enabled="False"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Item Description" SortExpression="item_description">
                           <ItemTemplate>
                           <asp:Label ID="txtdescription" runat="server" Text='<%# Bind("item_description") %>' Enabled="False"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Quantity" SortExpression="quantity">
                           <ItemTemplate>
                           <asp:Label ID="txtquantity" runat="server" Text='<%# Bind("item_quantity") %>' Enabled="False"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Delivery Date" SortExpression="delivery_date">
                           <ItemTemplate>
                           <asp:Label ID="deliverydate" runat="server" Text='<%# Bind("delivery_date","{0:d}") %>' Enabled="False"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Delivery Time" SortExpression="delivery_time">
                           <ItemTemplate>
                           <asp:Label ID="deliverytime" runat="server" Text='<%# Bind("delivery_time") %>' Enabled="False"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Status" SortExpression="delivery_status">
                           <ItemTemplate>
                           <asp:Label ID="deliverystatus" runat="server" Text='<%# Bind("delivery_status") %>' Enabled="False"></asp:Label>
                           </ItemTemplate>
                          </asp:TemplateField>
                           <asp:TemplateField HeaderText="Price" SortExpression="price">
                           <ItemTemplate>
                           <asp:Label ID="price" runat="server" Text='<%# Bind("price") %>' Enabled="False"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bil No" SortExpression="bil_no">
                           <ItemTemplate>
                           <asp:Label ID="bil_no" runat="server" Text='<%# Bind("bil_no") %>' Enabled="False"></asp:Label>
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
                   





</asp:Content>
