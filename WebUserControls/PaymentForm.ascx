<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PaymentForm.ascx.vb"
    Inherits="WebUserControls_PaymentForm" %>

<script type="text/javascript">
    function ValidateMethod(sender, args) {
        args.IsValid = document.getElementById("<%=ddlPaymentMethod.ClientID %>").value != "";
    }

    function ValidateName(sender, args) {
        var method = document.getElementById("<%=ddlPaymentMethod.ClientID %>").value;
        if (method == "" || method == "MO" || method == "WIRE") {
            args.IsValid = true;
        }
        else {
            args.IsValid = (document.getElementById("<%=txtName.ClientID %>").value.length != 0);
        }
    }

    function ValidateLength(sender, args) {
        args.IsValid = true;
        var method = document.getElementById("<%=ddlPaymentMethod.ClientID %>").value;
        var value = getDigitsOnly(document.getElementById("<%=txtCard.ClientID %>").value);
        if (method == "WIRE" || method == "MO" || method == "") {
            return;
        }
        else {
            args.IsValid = value.length>0;
        }
    }

    function ValidateCard(sender, args) {
        args.IsValid = true;
        var method = document.getElementById("<%=ddlPaymentMethod.ClientID %>").value;
        var value = getDigitsOnly(document.getElementById("<%=txtCard.ClientID %>").value);
        if (value.length == 0) {
            return;
        }
        if (method == "WIRE" || method == "MO" || method == "") {
            return;
        }
        if (method == "VISA") {
            var reg =/^4[0-9]{12}(?:[0-9]{3})?$/
            if (!reg.test(value)) {
                args.IsValid = false;
                return;
            }
        }
        if (method == "MC") {
            var reg = /^5[1-5][0-9]{14}$/
            if (!reg.test(value)) {
                args.IsValid = false;
                return;
            }
        }
        if (method == "AMEX") {
            var reg = /^3[47][0-9]{13}$/
            if (!reg.test(value)) {
                args.IsValid = false;
                return;
            }
        }
        if (method == "DISCOVER") {
            var reg = /^6(?:011|5[0-9]{2})[0-9]{12}$/
            if (!reg.test(value)) {
                args.IsValid = false;
                return;
            }
        }
        args.IsValid = luhn_check(value);
    }

    function ValidateExpiryDate(sender, args) {
        var method = document.getElementById("<%=ddlPaymentMethod.ClientID %>").value;
        if (method == "WIRE" || method == "MO" || method == "") {
            args.IsValid = true;
        }
        else {
            args.IsValid = document.getElementById("<%=ddlMonth.ClientID %>").value != "" & document.getElementById("<%=ddlYear.ClientID %>").value != "";
        }
    }

    function ValidateCVV2(sender, args) {
        var value = document.getElementById("<%=txtCVV2.ClientID %>").value;
        var method = document.getElementById("<%=ddlPaymentMethod.ClientID %>").value;
        if (method == "VISA" || method == "MC") {
            args.IsValid = value.length > 0 & HasNDigits(value, 3)
        }
        else {
            args.IsValid = true;
        }
    }
    
    function SwitchPaymentView(strValue) {
        var method = strValue;
        if (method == "VISA" || method == "MC") {
            $(document.getElementById("<%=trCVV2.ClientID %>")).show();
            $(document.getElementById("<%=trDate.ClientID %>")).show();
            $(document.getElementById("<%=trName.ClientID %>")).show();
            $(document.getElementById("<%=trCard.ClientID %>")).show();
        }
        if (method == "AMEX" || method == "DISCOVER") {
            $(document.getElementById("<%=trCVV2.ClientID %>")).hide();
            $(document.getElementById("<%=trDate.ClientID %>")).show();
            $(document.getElementById("<%=trName.ClientID %>")).show();
            $(document.getElementById("<%=trCard.ClientID %>")).show();
            document.getElementById("<%=txtCVV2.ClientID %>").value = "";
        }
        if (method == "MO" || method == "WIRE" ||  method =="") {
            $(document.getElementById("<%=trCVV2.ClientID %>")).hide();
            $(document.getElementById("<%=trDate.ClientID %>")).hide();
            $(document.getElementById("<%=trName.ClientID %>")).hide();
            $(document.getElementById("<%=trCard.ClientID %>")).hide();
            document.getElementById("<%=txtCVV2.ClientID %>").value = "";
            document.getElementById("<%=txtCard.ClientID %>").value = "";
            document.getElementById("<%=txtName.ClientID %>").value = "";
            document.getElementById("<%=ddlMonth.ClientID %>").value = "";
            document.getElementById("<%=ddlYear.ClientID %>").value = "";
        }
    }
    $("document").ready(function() { SwitchPaymentView(document.getElementById("<%=ddlPaymentMethod.ClientID %>").value); })
</script>

<asp:Panel ID="pnPaymentForm" runat="server"
    DefaultButton="btnSubmit">
    <table class="new w100">
        <tr>
            <th colspan="2" class="left">
                Payment Information
            </th>
        </tr>
        <tr>
            <td colspan="2" class="left">
                <asp:ValidationSummary ID="vsPaymentForm" ValidationGroup="PaymentForm" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="left" style="width:100px">
                Payment Method:<asp:CustomValidator ID="validatorMethod" runat="server" ErrorMessage="Please select your payment method"
                    ValidationGroup="PaymentForm" ClientValidationFunction="ValidateMethod">*</asp:CustomValidator>
            </td>
            <td class="left">
                <asp:DropDownList runat="server" ID="ddlPaymentMethod" Width="180" onchange="SwitchPaymentView(this.value)">
                    <asp:ListItem Text="Select a payment method." Value="" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Visa" Value="VISA"></asp:ListItem>
                    <asp:ListItem Text="Master Card" Value="MC"></asp:ListItem>
                    <asp:ListItem Text="American Express" Value="AMEX"></asp:ListItem>
                    <asp:ListItem Text="Discover" Value="DISCOVER"></asp:ListItem>
                    <asp:ListItem Text="Money Order" Value="MO"></asp:ListItem>
                    <asp:ListItem Text="Wire Transfer" Value="WIRE"></asp:ListItem>
                </asp:DropDownList>*
            </td>
        </tr>
        <tr runat ="server" id ="trName">
            <td class="left">
                Name on Credit Card:<asp:CustomValidator ID="validatorName" runat="server"
                    ClientValidationFunction="ValidateName" ErrorMessage="Please enter your name on card"
                    ValidationGroup="PaymentForm">*</asp:CustomValidator>
            </td>
            <td class="left">
                <asp:TextBox runat="server" ID="txtName" Width="170"></asp:TextBox>*
            </td>
        </tr>
        <tr runat ="server" id ="trCard">
            <td class="left">
                Credit Card Number:<asp:CustomValidator ID="validatorCardLength" runat="server" ErrorMessage="Please enter your card number"
                    ClientValidationFunction="ValidateLength" ValidationGroup="PaymentForm">*</asp:CustomValidator>
                <asp:CustomValidator ID="validatorCard" runat="server" ErrorMessage="Invalid card number."
                    ValidationGroup="PaymentForm" ClientValidationFunction="ValidateCard">*</asp:CustomValidator>
            </td>
            <td class="left">
                <asp:TextBox runat="server" ID="txtCard" Width="170"></asp:TextBox>*
            </td>
        </tr>
        <tr runat ="server" id ="trDate">
            <td class="left">
                Expiry Date:<asp:CustomValidator ID="validatorExpiryDate" runat="server" ErrorMessage="Please select your expiry date."
                    ValidationGroup="PaymentForm" ClientValidationFunction="ValidateExpiryDate">*</asp:CustomValidator>
            </td>
            <td class="left">
                <asp:DropDownList runat="server" ID="ddlMonth" Width="80">
                    <asp:ListItem Selected="True" Text="Month" Value=""></asp:ListItem>
                    <asp:ListItem Text="Jan" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Feb" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Mar" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Apr" Value="4"></asp:ListItem>
                    <asp:ListItem Text="May" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Jun" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Jul" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Aug" Value="8"></asp:ListItem>
                    <asp:ListItem Text="Sep" Value="9"></asp:ListItem>
                    <asp:ListItem Text="Oct" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Nov" Value="11"></asp:ListItem>
                    <asp:ListItem Text="Dec" Value="12"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList runat="server" ID="ddlYear" Width="80">
                </asp:DropDownList>*
            </td>
        </tr>
        <tr runat ="server" id ="trCVV2">
            <td class="left">
                CVV2 (Visa/Mastercard only):
                <asp:CustomValidator ID="validatorCVV2" runat="server" ErrorMessage="Invalid CVV2."
                    ValidationGroup="PaymentForm" ClientValidationFunction="ValidateCVV2">*</asp:CustomValidator>
            </td>
            <td class="left">
                <asp:TextBox runat="server" ID="txtCVV2" Width="80" MaxLength="3"></asp:TextBox>*
            </td>
        </tr>
        <tr>
            <td colspan="2" class="center">
                <asp:ImageButton runat="server" ID="btnSubmit" ValidationGroup="PaymentForm" SkinID ="Btn_Submit" />
            </td>
        </tr>
    </table>
</asp:Panel>
