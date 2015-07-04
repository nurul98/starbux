<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Bill_V.aspx.cs" Inherits="starbux.Bill_Viewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <br /> <h1>Bill Viewer</h1>
    <p>&nbsp;</p>
  <asp:GridView ID="gridfrap" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" CellSpacing="10" ForeColor="#333333" GridLines="None" 
            Width="846px" onselectedindexchanged="gridfrap_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="bill_no" HeaderText="Bill No." 
                    SortExpression="bill_no" />
                <asp:BoundField DataField="customer_ID" HeaderText="Customer ID" 
                    SortExpression="customer_ID" />
                <asp:BoundField DataField="delivery_date" HeaderText="Delivery Date" 
                    SortExpression="delivery_date" />
                <asp:BoundField DataField="delivery_time" HeaderText="Delivery Time" 
                    SortExpression="delivery_time" />
                <asp:BoundField DataField="product_ID" HeaderText="Product" 
                    SortExpression="product_ID" />
                    <asp:BoundField DataField=" total_price" HeaderText="Total Price" 
                    SortExpression="total_price" />
                    
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
