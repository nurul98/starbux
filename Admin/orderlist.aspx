<%@ Page Title="" Language="C#" MasterPageFile="~/AdminM.master" AutoEventWireup="true" CodeBehind="orderlist.aspx.cs" Inherits="starbux.Admin.orderlist" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h2>New Order</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  
    <asp:GridView ID="gdvNew" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" CellSpacing="10" ForeColor="#333333" GridLines="None" 
        ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="delivery_ID" HeaderText="Delivery ID" />
            <asp:BoundField DataField="customer_username" HeaderText="Customer Name" />
            <asp:BoundField DataField="item_name" HeaderText="Item Name" />
            <asp:BoundField DataField="item_description" HeaderText="Item Description" />
            <asp:BoundField DataField="item_quantity" HeaderText="Item Quantity" />
            <asp:BoundField DataField="delivery_date" HeaderText="Date" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="delivery_time" HeaderText="Time" />
            <asp:BoundField DataField="price" HeaderText="Total Price" />
            <asp:BoundField DataField="bil_no" HeaderText="Bil No" />
            <asp:BoundField DataField="delivery_status" HeaderText="Delivery Status" />
            
            <asp:TemplateField HeaderText="Verify">
                <FooterTemplate>
                    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" 
                        Text="Verify Order" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="drpdwnDecision" runat="server" DataValueField="decision" 
                        Height="18px" Width="99px">
                        <asp:ListItem Value="1">New</asp:ListItem>
                        <asp:ListItem Value="2">Sent</asp:ListItem>
                    </asp:DropDownList>
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
<br />
 <h2>Sent Order</h2>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
<asp:GridView ID="gdvSent" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" CellSpacing="10" ForeColor="#333333" GridLines="None" 
        ShowFooter="True">
        <Columns>
            <asp:BoundField DataField="delivery_ID" HeaderText="Delivery ID" />
            <asp:BoundField DataField="customer_username" HeaderText="Customer Name" />
            <asp:BoundField DataField="item_name" HeaderText="Item Name" />
            <asp:BoundField DataField="item_description" HeaderText="Item Description" />
            <asp:BoundField DataField="item_quantity" HeaderText="Item Quantity" />
            <asp:BoundField DataField="delivery_date" HeaderText="Date" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="delivery_time" HeaderText="Time" />
            <asp:BoundField DataField="price" HeaderText="Total Price" />
            <asp:BoundField DataField="bil_no" HeaderText="Bil No" />
            <asp:BoundField DataField="delivery_status" HeaderText="Delivery Status" />
            
            <asp:TemplateField HeaderText="Verify">
                <FooterTemplate>
                    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" 
                        Text="Verify Order" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="drpdwnDecision" runat="server" DataValueField="decision" 
                        Height="18px" Width="99px">
                        <asp:ListItem Value="1">Sent</asp:ListItem>
                        <asp:ListItem Value="2">New</asp:ListItem>
                    </asp:DropDownList>
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
