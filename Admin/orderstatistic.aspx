<%@ Page Title="" Language="C#" MasterPageFile="~/AdminM.master" AutoEventWireup="true" CodeBehind="orderstatistic.aspx.cs" Inherits="starbux.Admin.orderstatistic" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Sales Statistics for Beverages</h1><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
        <Series>
            <asp:Series Name="Series1" XValueMember="beverage_name" 
                YValueMembers="sold_quantity">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Table_Connection %>" 
        SelectCommand="SELECT [beverage_name], [sold_quantity] FROM [Beverage]">
    </asp:SqlDataSource>
    <br /><br />
     <h1>Sales Statistics for Food</h1><br />
<br />
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
        <Series>
            <asp:Series Name="Series1" XValueMember="bakery_name" 
                YValueMembers="sold_quantity">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Table_Connection %>" 
        SelectCommand="SELECT [bakery_name], [sold_quantity] FROM [Bakery]">
    </asp:SqlDataSource>
</asp:Content>
