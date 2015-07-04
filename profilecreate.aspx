<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHome.master" AutoEventWireup="true" CodeBehind="profilecreate.aspx.cs" Inherits="starbux.profilecreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Registration Form</h1><br />
        <table class="style1">
            <tr>
                <td class="style2">
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="TxtFirstName" runat="server" CssClass="style2" Width="390px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFirstName" runat="server" 
                        ControlToValidate="TxtFirstName" CssClass="ErrorMessage" ErrorMessage="*" 
                        ForeColor="Red">Please enter your first name</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Last Name:</td>
                <td>
                    <asp:TextBox ID="TxtLastName" runat="server" CssClass="style2" Width="390px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" 
                        ControlToValidate="TxtLastName" CssClass="ErrorMessage" ErrorMessage="*" 
                        ForeColor="Red">Please enter your last name</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    IC No:</td>
                <td>
                    <asp:TextBox ID="TxtIC1" runat="server" CssClass="style2" Width="124px"></asp:TextBox>
                    &nbsp; -&nbsp;&nbsp;
                    <asp:TextBox ID="TxtIC2" runat="server" Width="29px"></asp:TextBox>
                    &nbsp; -&nbsp;
                    <asp:TextBox ID="TxtIC3" runat="server" Width="76px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RangeIC4" runat="server" 
                        ControlToValidate="TxtIC1" ErrorMessage="Please enter valid IC" ForeColor="Red" 
                        ValidationExpression="^[0-9]{6}$"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RangeIC5" runat="server" 
                        ControlToValidate="TxtIC2" ErrorMessage="Please enter valid IC" ForeColor="Red" 
                        ValidationExpression="^[0-9]{2}$"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RangeIC6" runat="server" 
                        ControlToValidate="TxtIC3" ErrorMessage="Please enter valid IC" ForeColor="Red" 
                        ValidationExpression="^[0-9]{4}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Address:
                </td>
                <td>
                    <asp:TextBox ID="TxtAddress" runat="server" CssClass="style2" Height="86px" 
                        TextMode="MultiLine" Width="390px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredAddress" runat="server" 
                        ControlToValidate="TxtAddress" CssClass="ErrorMessage" ErrorMessage="*" 
                        ForeColor="Red">Please enter your address</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    E-mail:
                </td>
                <td>
                    <asp:TextBox ID="TxtEmail" runat="server" CssClass="style2" Width="170px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularEmail0" runat="server" 
                        ControlToValidate="TxtEmail" ErrorMessage="Please enter a valid e-mail" 
                        ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Phone:</td>
                <td>
                    <asp:DropDownList ID="DropDownListPhone" runat="server">
                        <asp:ListItem>010</asp:ListItem>
                        <asp:ListItem>011</asp:ListItem>
                        <asp:ListItem>012</asp:ListItem>
                        <asp:ListItem>013</asp:ListItem>
                        <asp:ListItem>014</asp:ListItem>
                        <asp:ListItem>015</asp:ListItem>
                        <asp:ListItem>016</asp:ListItem>
                        <asp:ListItem>017</asp:ListItem>
                        <asp:ListItem>018</asp:ListItem>
                        <asp:ListItem>019</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="TxtPhone" runat="server" CssClass="style2" Width="123px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionPhone" runat="server" 
                        ControlToValidate="TxtPhone" ErrorMessage="Please enter valid phone number" 
                        ForeColor="Red" ValidationExpression="^[0-9]{7}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Gender:</td>
                <td>
                    <asp:RadioButtonList ID="Gender" runat="server">
                        <asp:ListItem ID="option1" runat="server" value="Male" />
                        <asp:ListItem ID="option2" runat="server" Value="Female" />
                    </asp:RadioButtonList>
                </td>
            </tr>
    </table>
        <br />
       
        <asp:Button ID="Submit_Register" runat="server" 
        onclick="Submit_Register_Click" Text="Submit" Width="85px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Submit_Clear" runat="server" onclick="Submit_Clear_Click" 
        Text="Clear" Width="85px" />
       &nbsp&nbsp
        <br />
    <br />
   &nbsp&nbsp
   
     &nbsp&nbsp
     <br />
    
    &nbsp;&nbsp;
    &nbsp;&nbsp;
     <br />
     <br />
</asp:Content>
