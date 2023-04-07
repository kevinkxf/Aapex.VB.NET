<%@ Control Language="VB" AutoEventWireup="false" CodeFile="EditUserProfile.ascx.vb"
    Inherits="WebUserControls_EditUserProfile" %>

<script type="text/javascript">
    function ChangeState(e) {
        var p = document.getElementById("<%=ddlProvince.ClientID %>");
        var s = document.getElementById("<%=ddlShippingState.ClientID %>");
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

    $(document).ready(function() {
        $(document.getElementById("<%=txtBirthDate.ClientID %>")).datepicker({
            changeYear: true, changeMonth: true, yearRange: '-50:+50', defaultDate: '-50y',onSelect: function() { }
        });
        ChangeState(document.getElementById("<%=ddlCountry.ClientID %>"));
    });

    function HasNDigits(strInput, intCount) {
        var reg = new RegExp("^[0-9]{" + intCount + "}");
        return reg.test(strInput);
    }

    function ValidateSex(sender, args) {
        args.IsValid = !(document.getElementById("<%=ddlSex.ClientID %>").value == "");
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

    function ValidateFax(sender, args) {
        var inputs = $(sender).parent().next().find("input");
        var t1 = document.getElementById("<%=txtFax1.ClientID %>").value;
        var t2 = document.getElementById("<%=txtFax2.ClientID %>").value;
        var t3 = document.getElementById("<%=txtFax3.ClientID %>").value;
        args.IsValid = (HasNDigits(t1, 3) & HasNDigits(t2, 3) & HasNDigits(t3, 4)) | (t1.length == 0 && t2.length == 0 && t3.length == 0);
    }

    function ValidateLicenseState(sender, args) {
        args.IsValid = document.getElementById("<%=ddlLicenseState.ClientID %>").value != "";
    }

    function ValidateShippingState(sender, args) {
        var c = document.getElementById("<%=ddlCountry.ClientID %>").value;
        if (c == "US") {
            args.IsValid = document.getElementById("<%=ddlShippingState.ClientID %>").value != "";
        }
        else if (c == "CA") {
            args.IsValid = document.getElementById("<%=ddlProvince.ClientID %>").value != "";
        }
        else {
            args.IsValid = document.getElementById("<%=txtOtherState.ClientID %>").value != "";
        }

    }

    function ValidateShippingCountry(sender, args) {
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
</script>

<asp:Panel ID="pnUserForm" runat="server" DefaultButton="btnSubmit">
    <table class="new f14" style="width: 100%" cellspacing="0">
        <tr>
            <td colspan="4">
                <asp:ValidationSummary ID="vsUserProfileForm" runat="server" ValidationGroup="UserProfileForm" />
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                First Name:
                <asp:RequiredFieldValidator ID="rvFirstName" ValidationGroup="UserProfileForm" runat="server"
                    ControlToValidate="txtFirstName" ErrorMessage="Please Input Your First Name">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtFirstName" Width="120"></asp:TextBox>*
            </td>
            <td style="width: 100px">
                Last Name:<asp:RequiredFieldValidator ID="rvLastName" ValidationGroup="UserProfileForm"
                    runat="server" ControlToValidate="txtLastName" ErrorMessage="Please Input Your Last Name">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtLastName" Width="120"></asp:TextBox>*
            </td>
        </tr>
        <tr>
            <td>
                Birth Date:
                <asp:RequiredFieldValidator ID="rvBirthDate" ValidationGroup="UserProfileForm" runat="server"
                    ControlToValidate="txtBirthDate" ErrorMessage="Please Input Your First Name">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rangeBirthDate" runat="server" ControlToValidate="txtBirthDate"
                    ValidationGroup="UserProfileForm" ErrorMessage="Invalid birth date." Type="Date"
                    MinimumValue="1/1/1900" MaximumValue="1/1/2099">*</asp:RangeValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtBirthDate" Width="120"></asp:TextBox>*
            </td>
            <td>
                Sex:<asp:CustomValidator ID="validatorSex" ValidationGroup="UserProfileForm" runat="server"
                    ClientValidationFunction="ValidateSex" ErrorMessage="Please select your gender.">*</asp:CustomValidator>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlSex" Width="120">
                    <asp:ListItem Selected="True" Value=""></asp:ListItem>
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Clinic Name:
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtClinicName" Width="120"></asp:TextBox>
            </td>
            <td>
                Telephone:<asp:CustomValidator ID="validatorTelephone" ValidationGroup="UserProfileForm"
                    runat="server" ClientValidationFunction="ValidateTelephone" ErrorMessage="Invalid Telephone Number.">*</asp:CustomValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtHomePhone1" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                    runat="server" ID="txtHomePhone2" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                        runat="server" ID="txtHomePhone3" MaxLength="4" Width="40"></asp:TextBox>*
            </td>
        </tr>
        <tr>
            <td>
                Secondary Telphone:<asp:CustomValidator ID="validatorAltPhone" ValidationGroup="UserProfileForm"
                    runat="server" ClientValidationFunction="ValidateAltPhone" ErrorMessage="Invalid Secondary Phone Number.">*</asp:CustomValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtAltPhone1" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                    runat="server" ID="txtAltPhone2" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                        runat="server" ID="txtAltPhone3" MaxLength="4" Width="40"></asp:TextBox>
            </td>
            <td>
                Fax:<asp:CustomValidator ID="validatorFax" runat="server" ValidationGroup="UserProfileForm"
                    ClientValidationFunction="ValidateFax" ErrorMessage="Invalid Fax Number.">*</asp:CustomValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtFax1" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                    runat="server" ID="txtFax2" MaxLength="3" Width="30"></asp:TextBox>-<asp:TextBox
                        runat="server" ID="txtFax3" MaxLength="4" Width="40"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email:<asp:RequiredFieldValidator ID="rvEmail" runat="server" ValidationGroup="UserProfileForm"
                    ErrorMessage="Please Input Your Email." ControlToValidate="txtEmail">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="reEmail" runat="server" ErrorMessage="Invalid Email Address." ControlToValidate="txtEmail"
                        ValidationExpression="[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?">*</asp:RegularExpressionValidator>
            </td>
            <td colspan="3" class="left">
                <asp:TextBox runat="server" ID="txtEmail" Width="240"></asp:TextBox>*
            </td>
        </tr>
        <tr>
            <td>
                License Number:<asp:RequiredFieldValidator ID="rvLicenseNumber" runat="server" ValidationGroup="UserProfileForm"
                    ErrorMessage="Please Input Your License Number." ControlToValidate="txtLicenseNo">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtLicenseNo" Width="120"></asp:TextBox>*
            </td>
            <td>
                State of License:<asp:CustomValidator ID="validatorLicenseState" ValidationGroup="UserProfileForm"
                    runat="server" ErrorMessage="Please Select Your License State" ClientValidationFunction="ValidateLicenseState">*</asp:CustomValidator>
            </td>
            <td>
                <asp:DropDownList ID="ddlLicenseState" runat="server" Width="120">
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
                *
            </td>
        </tr>
        <tr>
            <th colspan="4" class="center">
                Address
            </th>
        </tr>
        <tr>
            <td>
                Street 1:<asp:RequiredFieldValidator ID="rvShippingStreet" ValidationGroup="UserProfileForm"
                    runat="server" ErrorMessage="Please Input Street Address" ControlToValidate="txtAddress">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtAddress" Width="120"></asp:TextBox>*
            </td>
            <td>
                Street 2:
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtAddressOther" Width="120"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                City:<asp:RequiredFieldValidator ID="rvCity" runat="server" ValidationGroup="UserProfileForm"
                    ErrorMessage="Please Input City For Shipping" ControlToValidate="txtCity">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtCity" Width="120"></asp:TextBox>*
            </td>
            <td>
                State:<asp:CustomValidator ID="validatorShippingState" runat="server" ValidationGroup="UserProfileForm"
                    ErrorMessage="Please Select Your Shipping State" ClientValidationFunction="ValidateShippingState">*</asp:CustomValidator>
            </td>
            <td>
                <asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="name" DataValueField="value"
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
                Country:<asp:CustomValidator ID="validatorCountry" runat="server" ClientValidationFunction="ValidateShippingCountry"
                    ValidationGroup="UserProfileForm" ErrorMessage="Please specify your country.">*</asp:CustomValidator>
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
                Zip:<asp:CustomValidator ID="validatorPostalCode" runat="server" ClientValidationFunction="ValidatePostalCode"
                    ValidateEmptyText="true" ValidationGroup="UserProfileForm" ErrorMessage="Invalid ZIP/Postal code."
                    ControlToValidate="txtPostalCode">*</asp:CustomValidator>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtPostalCode" Width="120"></asp:TextBox>*
            </td>
        </tr>
        <tr>
            <td colspan="4" class="center border_top">
                <asp:ImageButton runat="server" ID="btnSubmit" ValidationGroup="EditUserProfileForm"
                    SkinID="Update Address" />
            </td>
        </tr>
    </table>
</asp:Panel>
<asp:XmlDataSource ID="xmlStates" runat="server" DataFile="~/Setting/UsStates.xml">
</asp:XmlDataSource>
