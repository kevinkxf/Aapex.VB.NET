<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ChangePasswordForm.ascx.vb"
    Inherits="WebUserControls_ChangePasswordForm" %>

<script type="text/javascript">
    function ValidatePassword(sender, args) {
        args.IsValid = (document.getElementById("<%=txtPassword2.ClientID %>").value == document.getElementById("<%=txtPassword1.ClientID %>").value);
    }
</script>

<asp:Panel ID="pnPasswordForm" DefaultButton="btnSubmit" runat="server">
    <table class="new w100 f14">
        <tr>
            <td colspan="2" class="left">
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="UpdatePassword2"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                New Password:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Please enter your new password." ValidationGroup="UpdatePassword2"
                    ControlToValidate="txtPassword1">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtPassword1" runat="server" TextMode ="Password" ></asp:TextBox>
            </td>
        </tr>
        <tr> 
            <td>
                Re-enter New Password:<asp:CustomValidator ID="validatorPassword2" runat="server" ErrorMessage="Please re-enter your new password.."
                    ValidationGroup="UpdatePassword2" ControlToValidate="txtPassword2" ClientValidationFunction ="ValidatePassword" ValidateEmptyText ="true" >*</asp:CustomValidator>
            </td>
            <td>
                <asp:TextBox ID="txtPassword2" runat="server" TextMode ="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="center border_top">
                <asp:ImageButton ID="btnSubmit" runat="server" SkinID ="Update Address" ValidationGroup="UpdatePassword2" />
            </td>
        </tr>
    </table>
</asp:Panel>
