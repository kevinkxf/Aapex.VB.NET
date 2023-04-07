<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="MyAccount.aspx.vb" Inherits="MyAccount" Title="My Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class ="title">My Account</h3>
    <p>You can check your order history and update your <%=Common.WebSetting.Setting.CompanyName%> account information from the options below.</p>
    <table class="center w100">
        <tr>
            <td>
                <a href="changepassword.html">
                    <asp:Image runat="server" ID="imgChangePassword" SkinID="Change_Password" /></a>
            </td>
            <td>
                <a href="edituserprofile.html">
                    <asp:Image runat="server" ID="Image5" SkinID="Update_Profile" /></a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="checkorder.html">
                    <asp:Image runat="server" ID="Image10" SkinID="Check_Order_History" /></a>
            </td>
            <td>
                <a href="addressbook.html">
                    <asp:Image runat="server" ID="Image15" SkinID="Address_Book" /></a>
            </td>
        </tr>
    </table>
</asp:Content>
