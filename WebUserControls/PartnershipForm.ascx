<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PartnershipForm.ascx.vb"
    Inherits="WebUserControls_PartnershipForm" %>

<script type="text/javascript">
    function HasNDigits(strInput, intCount) {
        var reg = new RegExp("^[0-9]{" + intCount + "}");
        return reg.test(strInput);
    }

    function validateEmail(sender, args) {
        if (args.Value == "") {
            args.IsValid = false;
            sender.errormessage = "Please input you email.";
        }
        else {
            var re = /([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            args.IsValid = re.test(args.Value);
            sender.errormessage = "Invalid email.";
        }
    }

    function ValidateTelephone(sender, args) {
        args.IsValid = HasNDigits(document.getElementById("<%=txtHomePhone1.ClientID %>").value, 3) & HasNDigits(document.getElementById("<%=txtHomePhone2.ClientID %>").value, 3) & HasNDigits(document.getElementById("<%=txtHomePhone3.ClientID %>").value, 4);
    }

    function ValidateAltPhone(sender, args) {
        var t1 = document.getElementById("<%=txtAltPhone1.ClientID %>").value;
        var t2 = document.getElementById("<%=txtAltPhone2.ClientID %>").value;
        var t3 = document.getElementById("<%=txtAltPhone3.ClientID %>").value;
        args.IsValid = (HasNDigits(t1, 3) & HasNDigits(t2, 3) & HasNDigits(t3, 4)) | (t1.length == 0 && t2.length == 0 && t3.length == 0);
    }
</script>

<table class="new" style="width: 100%">
    <tr>
        <td colspan="4">
            <asp:ValidationSummary runat="server" ID="vsSummary" ValidationGroup="Partnership" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            * indicates required field.
        </td>
    </tr>
    <tr>
        <td>
            Title:
        </td>
        <td colspan="3">
            <asp:DropDownList runat ="server" ID ="ddlTitle">
                <asp:ListItem Text ="--" Value =""></asp:ListItem>
                <asp:ListItem Text ="Mr." Value ="Mr."></asp:ListItem>
                <asp:ListItem Text ="Mrs." Value ="Mrs."></asp:ListItem>
                <asp:ListItem Text ="Ms." Value ="Ms."></asp:ListItem>
                <asp:ListItem Text ="Miss." Value ="Miss."></asp:ListItem>
                <asp:ListItem Text ="Dr." Value ="Dr."></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="width: 90px">
            First Name:<asp:RequiredFieldValidator ID="rvFirstname" runat="server" ErrorMessage="Please input your first name."
                ValidationGroup="Partnership" ControlToValidate="txtFirstname">*</asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtFirstname" Width="130"></asp:TextBox>*
        </td>
        <td style="width: 90px">
            Last Name:<asp:RequiredFieldValidator ID="rvLastName" runat="server" ErrorMessage="Please input your last name."
                ValidationGroup="Partnership" ControlToValidate="txtlastname">*</asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtlastname" Width="130"></asp:TextBox>*
        </td>
    </tr>
    <tr>
        <td>
            Company Name:
        </td>
        <td colspan="3">
            <asp:TextBox runat="server" ID="txtCompanyName" Width="350"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Company Website:
        </td>
        <td colspan="3">
            <asp:TextBox runat="server" ID="txtCompanyWebsite" Width="350"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Primary Telephone:<asp:CustomValidator ID="validatorTelephone" ValidationGroup="Partnership"
                runat="server" ClientValidationFunction="ValidateTelephone" ErrorMessage="Invalid primary telephone.">*</asp:CustomValidator>
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtHomePhone1" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                runat="server" ID="txtHomePhone2" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                    runat="server" ID="txtHomePhone3" MaxLength="4" Width="40"></asp:TextBox>*
        </td>
        <td>
            Secondary Telephone:<asp:CustomValidator ID="validatorAltPhone" ValidationGroup="Partnership"
                runat="server" ClientValidationFunction="ValidateAltPhone" ErrorMessage="Invalid secondary telphone number.">*</asp:CustomValidator>
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtAltPhone1" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                runat="server" ID="txtAltPhone2" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                    runat="server" ID="txtAltPhone3" MaxLength="4" Width="40"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Email:<asp:CustomValidator ID="validatorEmail" runat="server" ErrorMessage="Please input you email."
                ValidationGroup="Partnership" ControlToValidate="txtEmail" ValidateEmptyText="true"
                ClientValidationFunction="validateEmail">*</asp:CustomValidator>
        </td>
        <td colspan="3">
            <asp:TextBox runat="server" ID="txtEmail" Width="350"></asp:TextBox>*
        </td>
    </tr>
    <tr>
        <td>
            Product Description:
        </td>
        <td colspan="3">
            <asp:TextBox runat="server" ID="txtDescription" TextMode="MultiLine" Width="100%"
                Height="100"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Comments:
        </td>
        <td colspan="3">
            <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" Width="100%" Height="100"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="center">
            <asp:ImageButton runat="server" ID="btnSubmit" SkinID="Bulk_Request" ValidationGroup="Partnership" />
        </td>
    </tr>
</table>
