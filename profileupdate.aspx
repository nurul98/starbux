<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOrder.Master" AutoEventWireup="true" CodeBehind="profileupdate.aspx.cs" Inherits="starbux.profileupdate" %>
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
                    <asp:TextBox ID="customer_ID" runat="server" Width="114px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    First Name:</td>
                <td>
                    <asp:TextBox ID="first_name" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Last Name:</td>
                <td>
                    <asp:TextBox ID="last_name" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td class="style2">
                    IC No:</td>
                <td>
                    <asp:TextBox ID="IC" runat="server" Width="200px"></asp:TextBox>
                </td> 
            </tr>
            <tr>
                <td class="style2">
                    Address:</td>
                <td>
                    <asp:TextBox ID="address" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="199px"></asp:TextBox>
                </td> 
            </tr>
          
            <tr>
                <td class="style2">
                    E-Mail:</td>
                <td>
                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Phone:</td>
                <td>
                    <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                </td>
            </tr>
          
            <tr>
                <td class="style2">
                    Gender:</td>
                <td>
                    <asp:DropDownList ID="gender" runat="server">
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
          <br />
&nbsp;<asp:Button ID="update" runat="server" Text="Update" onclick="update_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    &nbsp;<asp:ChangePassword ID="ChangePassword1" runat="server">
    </asp:ChangePassword>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
</asp:Content>
