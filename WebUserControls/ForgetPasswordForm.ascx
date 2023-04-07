<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ForgetPasswordForm.ascx.vb" Inherits="WebUserControls_ForgetPasswordForm" %>
<%@ Register Assembly="MSCaptcha"  Namespace="MSCaptcha" TagPrefix="cc1" %>
<script type ="text/javascript" >
    $(document).ready(function() {
        $('.date-pick').datepicker({
            changeYear: true, changeMonth: true, yearRange: '-50:+50',defaultDate:'-50y', onSelect: function() { }
        });
    })

    function ValidateUserName(sender, args) {
        var u = document.getElementById("<%=tbxUsername.ClientID %>").value;
        var e = document.getElementById("<%=tbxEmail.ClientID %>").value;
        var d = document.getElementById("<%=tbxDOB.ClientID %>").value;
        if (u == "" && e == "" && d == "") {
            args.IsValid = false;
            sender.errormessage="Please enter your username or your email and birth date."
        }
        else {
            args.IsValid = true;
        }
    }

    function ValidateEmail(sender, args) {
        var u = document.getElementById("<%=tbxUsername.ClientID %>").value;
        var e = document.getElementById("<%=tbxEmail.ClientID %>").value;
        var d = document.getElementById("<%=tbxDOB.ClientID %>").value;
        if (u == "" && (e != "" || d != "")) {
            if (e != "" && d == "") {
                args.IsValid = false;
                sender.errormessage = "Please enter your birth date."
            }
            else if (e == "" && d != "") {
                args.IsValid = false;
                sender.errormessage = "Please enter your email."
            }
            else {
                var re = /([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                var r1 = re.test(e);
                var rb = /(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)?[0-9]{2}$/;
                var r2 = rb.test(d);
                if (!r1 && r2) {
                    args.IsValid = false;
                    sender.errormessage = "Invalid email."
                }
                else if (r1 && !r2) {
                    args.IsValid = false;
                    sender.errormessage = "Invalid birth date."
                }
                else {
                    args.IsValid = true;
                }
            }
        }
        else {
            args.IsValid = true;
        }
    }
    function ValidateCode(sender, args) {
        args.IsValid=(args.Value!="");
        sender.errormessage="Please input the verification code.";
    }
</script>
<asp:Panel ID="Panel1" runat="server" DefaultButton ="btnRetrievePassword">
            <table class="new w100">
                <tr><th colspan ="3">To retrieve your password, please complete option 1 OR option 2, enter the 'Verification Code'
            and click 'Submit' to retrieve your password.</th></tr>
                <tr>
                    <td colspan ="3">
                        <asp:ValidationSummary ID="_vsSummary" runat="server" ValidationGroup ="ForgetPassword"/>
                    </td>
                </tr>
                <tr>
                    <td >Option1:<asp:CustomValidator ID="_validatorOption1" runat="server" ErrorMessage="Please Enter Your User Name" ValidateEmptyText ="true" ValidationGroup ="ForgetPassword" ClientValidationFunction ="ValidateUserName">*</asp:CustomValidator></td>
                    <td>Enter User Name</td>
                    <td><asp:TextBox ID="tbxUsername" runat="server"></asp:TextBox></td>
                </tr>
                <tr><td colspan ="3"><hr /></td></tr>
                <tr>
                    <td rowspan ="2">Option2:<asp:CustomValidator ID="_validatorOption2" runat="server" ErrorMessage="Please Enter Your Email and DOB" ValidateEmptyText ="true" ValidationGroup ="ForgetPassword" ClientValidationFunction ="ValidateEmail">*</asp:CustomValidator></td>
                    <td>Enter Email</td>
                    <td><asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Enter Birth Date</td>
                    <td><asp:TextBox ID="tbxDOB" runat="server" class="date-pick"></asp:TextBox></td>
                </tr>
                <tr><td colspan ="3"><hr /></td></tr>
                <tr>
                    <td>
                        Verification Code:<asp:CustomValidator ID="validationCode" runat="server" ValidationGroup ="ForgetPassword"
                            ErrorMessage="Incorrect verification code." ControlToValidate ="tbxCaptcha" ValidateEmptyText ="true"  ClientValidationFunction ="ValidateCode">*</asp:CustomValidator>
                    </td>
                    <td>
                        <cc1:CaptchaControl BackColor ="#EAF7FF" ID="ccCode" runat="server" CaptchaBackgroundNoise="High"  CaptchaLength="6" CaptchaHeight="50" CaptchaWidth="200" CaptchaLineNoise="Medium" CaptchaMinTimeout="3" CaptchaMaxTimeout="240" CustomValidatorErrorMessage ="Wrong verification Code." ValidationGroup ="ForgetPassword"/>
                    </td>
                    <td><asp:TextBox ID="tbxCaptcha" runat="server"></asp:TextBox></td>
                </tr>
                <tr><th colspan="3"><asp:ImageButton ID="btnRetrievePassword" runat ="server" SkinID ="Btn_Submit" ValidationGroup ="ForgetPassword"/></th></tr>
            </table>
        </asp:Panel>

