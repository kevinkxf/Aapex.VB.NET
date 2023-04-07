<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="true"
    CodeFile="SignIn.aspx.vb" Inherits="SignIn" Title="Sign In" %>

<%@ Register Src="~/WebUserControls/SigninForm.ascx" TagPrefix="wuc" TagName="Signin" %>
<%@ Register Src="~/WebUserControls/McAfeeSeal.ascx" TagPrefix="wuc" TagName="Seal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <table cellspacing="0" style="width: 100%" cellpadding="10">
        <tr>
            <td style="width: 50%; vertical-align :top " >
                <wuc:Signin runat="server" ID="oSignin" />
            </td>
            <td style="vertical-align :top ">
                <table class="new f14" style="width: 100%;" cellspacing="0">
                    <tr>
                        <th>
                            New Customer
                        </th>
                    </tr>
                    <tr>
                        <td style="padding: 9.5px 15px;">
                            If you are a new customer, please click "Create Account" to create a new account.
                        </td>
                    </tr>
                    <tr>
                        <td class="border_top center">
                            <a href="Registration.html">
                                <asp:Image runat="server" ID="btnCreate" SkinID="Create_New_Account" /></a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table cellpadding="10">
            <tr>
                <td>
                    <wuc:Seal runat ="server" />
                    <br />
                    <asp:Image runat ="server" SkinID ="GeoTrust_Logo" />
                </td>
                <td>
                    <strong>This website uses 128-bit SSL (Secure Socket Layer) encryption to guarantee
                        the security of your online order.</strong> 128-bit SSL encryption gives you
                    the highest level of protection possible whenever you place an online order with
                    <%=Common.WebSetting.Setting.WebSiteName%>. SSL security is provided by GeoTrust, an industry leader in
                    online security and trust services.
                </td>
            </tr>
    </table>
</asp:Content>
