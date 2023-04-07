<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AddressForm.ascx.vb"
    Inherits="WebUserControls_AddressForm" %>

<script type="text/javascript">
    function ChangeState(e) {
        var p = document.getElementById("<%=ddlProvince.ClientID %>");
        var s = document.getElementById("<%=ddlState.ClientID %>");
        var os = document.getElementById("<%=txtOtherState.ClientID %>");
        var oc = document.getElementById("<%=txtCountry.ClientID %>");
        if (e.value == "CA") {
            $(p).show();
            $(s).hide();
            $(os).hide();
            $(oc).hide();
        }
        else if (e.value == "US") {
            $(s).show();
            $(p).hide();
            $(os).hide();
            $(oc).hide();
        }
        else if (e.value == "Other") {
            $(s).hide();
            $(p).hide();
            $(os).show();
            $(oc).show();
        }
    }

    function ValidateState(sender, args) {
        var c = document.getElementById("<%=ddlCountry.ClientID %>").value;
        if (c == "US") {
            args.IsValid = (document.getElementById("<%=ddlState.ClientID %>").value != "")
        }
        else if (c == "CA") {
            args.IsValid = (document.getElementById("<%=ddlProvince.ClientID %>").value != "")
        }
        else{
            args.IsValid = (document.getElementById("<%=txtOtherState.ClientID %>").value != "")
        }
    }

    function ValidateCountry(sender, args) {
        var c = document.getElementById("<%=ddlCountry.ClientID %>").value;
        if (c == "Other") {
            args.IsValid = (document.getElementById("<%=txtCountry.ClientID %>").value != "");
        }
        else {
            args.IsValid = true;
        }
    }

    function ValidatePostalCode(sender, args) {
        var c = document.getElementById("<%=ddlCountry.ClientID %>").value;
        if (args.Value == "") {
            sender.errormessage = "Please input your ZIP code."
            args.IsValid = false;
            return;
        }
        else {
            sender.errormessage = "Invalid ZIP/Postal code."
        }
        var re;
        if (c == "US") {
            re = /^\d{5}([\-]\d{4})?$/;
            args.IsValid = re.test(args.Value);
        }
        else if (c == "CA") {
            re = /^[ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]{1}\d{1}[A-Za-z]{1} *\d{1}[A-Za-z]{1}\d{1}$/;
            args.IsValid = re.test(args.Value);
        }
        else {
            args.IsValid = (args.Value != "");
        }
    }

    $(document).ready(function() { ChangeState(document.getElementById("<%=ddlCountry.ClientID %>")); })
</script>

<asp:Panel ID="pnAddressForm" runat="server" DefaultButton="btnSubmit">
    <table class="new w100" cellspacing="0">
        <tr>
            <th colspan="4" class="left">
                <asp:Literal runat="server" ID="lblTitle"></asp:Literal>
            </th>
        </tr>
        <tr>
            <td colspan="4" class="left">
                <asp:ValidationSummary ID="vsAddressForm" ValidationGroup="AddressForm" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 110px">
                Street 1:<asp:RequiredFieldValidator ID="rvStreet1" runat="server" ControlToValidate="txtStreet1"
                    ValidationGroup="AddressForm" ErrorMessage="Please enter your street address.">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtStreet1" Width="120"></asp:TextBox>*
            </td>
            <td style="width: 110px">
                Street 2 (Optional):
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtStreet2" Width="120"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                City:<asp:RequiredFieldValidator ID="rvCity" runat="server" ControlToValidate="txtCity"
                    ValidationGroup="AddressForm" ErrorMessage="Please enter your city.">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtCity" Width="120"></asp:TextBox>*
            </td>
            <td>
                State/Province:<asp:CustomValidator ID="validatorState" runat="server" ClientValidationFunction="ValidateState"
                    ValidationGroup="AddressForm" ErrorMessage="Please select your state.">*</asp:CustomValidator>
            </td>
            <td>
                <asp:DropDownList ID="ddlState" runat="server" DataTextField="name" DataValueField="value"
                    Width="115px">
                    <asp:ListItem Text="Select a state" Value="" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="AL" Text="Alabama" />
                    <asp:ListItem Value="AK" Text="Alaska" />
                    <asp:ListItem Value="AZ" Text="Arizona" />
                    <asp:ListItem Value="AR" Text="Arkansas" />
                    <asp:ListItem Value="CA" Text="California" />
                    <asp:ListItem Value="CO" Text="Colorado" />
                    <asp:ListItem Value="CT" Text="Connecticut" />
                    <asp:ListItem Value="DE" Text="Delaware" />
                    <asp:ListItem Value="DC" Text="District of Columbia" />
                    <asp:ListItem Value="FL" Text="Florida" />
                    <asp:ListItem Value="GA" Text="Georgia" />
                    <asp:ListItem Value="HI" Text="Hawaii" />
                    <asp:ListItem Value="ID" Text="Idaho" />
                    <asp:ListItem Value="IL" Text="Illinois" />
                    <asp:ListItem Value="IN" Text="Indiana" />
                    <asp:ListItem Value="IA" Text="Iowa" />
                    <asp:ListItem Value="KS" Text="Kansas" />
                    <asp:ListItem Value="KY" Text="Kentucky" />
                    <asp:ListItem Value="LA" Text="Louisiana" />
                    <asp:ListItem Value="ME" Text="Maine" />
                    <asp:ListItem Value="MD" Text="Maryland" />
                    <asp:ListItem Value="MA" Text="Massachusetts" />
                    <asp:ListItem Value="MI" Text="Michigan" />
                    <asp:ListItem Value="MN" Text="Minnesota" />
                    <asp:ListItem Value="MS" Text="Mississippi" />
                    <asp:ListItem Value="MO" Text="Missouri" />
                    <asp:ListItem Value="MT" Text="Montana" />
                    <asp:ListItem Value="NE" Text="Nebraska" />
                    <asp:ListItem Value="NV" Text="Nevada" />
                    <asp:ListItem Value="NH" Text="New Hampshire" />
                    <asp:ListItem Value="NJ" Text="New Jersey" />
                    <asp:ListItem Value="NM" Text="New Mexico" />
                    <asp:ListItem Value="NY" Text="New York" />
                    <asp:ListItem Value="NC" Text="North Carolina" />
                    <asp:ListItem Value="ND" Text="North Dakota" />
                    <asp:ListItem Value="OH" Text="Ohio" />
                    <asp:ListItem Value="OK" Text="Oklahoma" />
                    <asp:ListItem Value="OR" Text="Oregon" />
                    <asp:ListItem Value="PA" Text="Pennsylvania" />
                    <asp:ListItem Value="RI" Text="Rhode Island" />
                    <asp:ListItem Value="SC" Text="South Carolina" />
                    <asp:ListItem Value="SD" Text="South Dakota" />
                    <asp:ListItem Value="TN" Text="Tennessee" />
                    <asp:ListItem Value="TX" Text="Texas" />
                    <asp:ListItem Value="UT" Text="Utah" />
                    <asp:ListItem Value="VT" Text="Vermont" />
                    <asp:ListItem Value="VA" Text="Virginia" />
                    <asp:ListItem Value="WA" Text="Washington" />
                    <asp:ListItem Value="WV" Text="West Virginia" />
                    <asp:ListItem Value="WI" Text="Wisconsin" />
                    <asp:ListItem Value="WY" Text="Wyoming" />
                    <asp:ListItem Value="PR" Text="Puerto Rico" />
                    <asp:ListItem Value="VI" Text="U.S. Virgin Islands" />
                    <asp:ListItem Value="MP" Text="Northern Mariana Is." />
                    <asp:ListItem Value="GU" Text="Guam" />
                    <asp:ListItem Value="AS" Text="American Samoa" />
                    <asp:ListItem Value="PW" Text="Palau" />
                    <asp:ListItem Value="AA" Text="Armed Forces Americas" />
                    <asp:ListItem Value="AE" Text="Armed Forces Europe" />
                    <asp:ListItem Value="AP" Text="Armed Forces Pacific" />
                </asp:DropDownList>
                <asp:DropDownList runat="server" ID="ddlProvince" Width="115px">
                    <asp:ListItem Text="Select a province" Value="" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="AB" Text="Alberta" />
                    <asp:ListItem Value="BC" Text="British Columbia" />
                    <asp:ListItem Value="MB" Text="Manitoba" />
                    <asp:ListItem Value="NB" Text="New Brunswick" />
                    <asp:ListItem Value="NL" Text="Newfoundland" />
                    <asp:ListItem Value="NS" Text="Nova Scotia" />
                    <asp:ListItem Value="NT" Text="Northwest Territories" />
                    <asp:ListItem Value="NU" Text="Nunavut" />
                    <asp:ListItem Value="ON" Text="Ontario" />
                    <asp:ListItem Value="PE" Text="Prince Edward Island" />
                    <asp:ListItem Value="QC" Text="Quebec" />
                    <asp:ListItem Value="SK" Text="Saskatchewan" />
                    <asp:ListItem Value="YT" Text="Yukon" />
                </asp:DropDownList>
                <asp:TextBox ID="txtOtherState" runat="server" Width="115px"></asp:TextBox>
                *
            </td>
        </tr>
        <tr>
            <td>
                Country:
                <asp:CustomValidator ID="validatorCountry" runat="server" ClientValidationFunction="ValidateCountry"
                    ValidationGroup="AddressForm" ErrorMessage="Please specify your country.">*</asp:CustomValidator>
            </td>
            <td>
                <asp:DropDownList ID="ddlCountry" runat="server" Width="100px" onchange="ChangeState(this)">
                    <asp:ListItem Text="U.S.A" Value="US" />
                    <asp:ListItem Text="Canada" Value="CA" />
                    <asp:ListItem Text="Other Country" Value="Other" />
                </asp:DropDownList>
                <asp:TextBox ID="txtCountry" runat="server" Visible="true" Width="115px"></asp:TextBox>
            </td>
            <td>
                ZIP/Postal Code:
                <asp:CustomValidator ID="validatorPostalCode" runat="server" ClientValidationFunction="ValidatePostalCode"
                    ValidateEmptyText="true" ValidationGroup="AddressForm" ErrorMessage="Invalid ZIP/Postal code."
                    ControlToValidate="txtPostalCode">*</asp:CustomValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtPostalCode" Width="120"></asp:TextBox>*
            </td>
        </tr>
        <tr>
            <td colspan="4" class="border_top center">
                <asp:ImageButton runat="server" ID="btnSubmit" ValidationGroup="AddressForm" SkinID="Add Address"
                    Visible="false" />
                <asp:ImageButton runat="server" ID="btnUpdate" ValidationGroup="AddressForm" SkinID="Update Address"
                    Visible="false" />
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:XmlDataSource ID="xmlStates" runat="server" DataFile="~/Setting/UsStates.xml">
</asp:XmlDataSource>
