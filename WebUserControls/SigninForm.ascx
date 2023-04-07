<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SigninForm.ascx.vb" Inherits="WebUserControls_SigninForm" %>
<asp:Panel ID="pnLogin" runat="server" DefaultButton="btnLogin">
    <table class="new f14" style="width: 100%" cellspacing="0">
        <tr>
            <th colspan="2" class="border_bottom">
                Sign In<asp:CustomValidator
                    ID="validatorLogin" runat="server" ErrorMessage="Invalid Username/Password" EnableClientScript="false"
                    ValidationGroup="Login">&nbsp</asp:CustomValidator>
            </th>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="vsLogin" runat="server" ValidationGroup="Login" />
            </td>
        </tr>
        <tr>
            <td>
                Username:<asp:RequiredFieldValidator ID="rvUsername" runat="server" ErrorMessage="Please Input Your Username"
                    ValidationGroup="Login" ControlToValidate="txtUsername">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password:<asp:RequiredFieldValidator ID="rvPassword" runat="server" ErrorMessage="Please Input Your Password"
                    ValidationGroup="Login" ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="center">
                <asp:ImageButton runat="server" ID="btnLogin" SkinID="Sign_In" ValidationGroup="Login" />
            </td>
            <td>
                <a href="ForgetPAssword.html">Forget password</a>
            </td>
        </tr>
    </table>
</asp:Panel>
