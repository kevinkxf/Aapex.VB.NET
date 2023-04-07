<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SearchDrug.ascx.vb" Inherits="WebUserControls_SearchDrug" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register Src="~/WebUserControls/SearchBar.ascx" TagPrefix="wuc" TagName="SearchBar" %>
<style type="text/css">
    #tooltip
    {
        position: absolute;
        z-index: 3000;
        border: 1px solid #111;
        background-color: #eee;
        padding: 5px;
        opacity: 0.85;
    }
    #tooltip h3, #tooltip div
    {
        margin: 0;
    }
</style>
<asp:MultiView runat="server" ID="mvSearchDrug" ActiveViewIndex="0">
    <asp:View runat="server" ID="viewResult">

        <script type="text/javascript">
            $(document).ready(function() {
                $("img[alt=Price Beat]").click(
            function() {
                $(this).parent().parent().next().toggle()
            }
        ).tooltip({
            delay: 0,
            showURL: false,
            bodyHandler: function() {
                return $(".hidden_dialog").html();
            }
        });
                $("img[alt=Calculate New Price]").click(
            function() {
                sp(this);
            });
                $("img[alt=Close_PB]").click(
            function() {
                Clear(this);
            });
               
                $("img[alt=Bulk Request]").click(
            function() {
                $(this).parent().parent().next().next().toggle();
            });
                $("img[alt=Close_BR]").click(
            function() {
                $(this).parent().parent().parent().parent().parent().parent().parent().hide()
            });
                //$(".jqmWindow").each(function(i) { $(this).jqm({ modal: false }) });
            });

            function Confirm(e) {
                var t = $(e).parent().parent().parent().parent().parent().parent();
                var pb = t.find("input")[0].value;
                if (validate(pb, t.find("input")[1].value) == true) {
                    var p = t.find("input")[2].value;
                    $(e).parent().find("input:eq(0)").click()
                    return true;
                }
                else
                { alert('Please enter a competitor\'s price (eg. $99.99) and a valid competitor\'s website address (eg. www.aapexhealthsupplies.com'); return false; }

            }

            function Clear(e) {
                var t = $(e).parent().parent().parent().parent().parent().parent();
                t.find("input")[0].value = "";
                t.find("input")[1].value = "";
                t.parent().hide()
            }


            function sp(e) {
                var t = $(e).parent().parent().parent().parent().parent();
                var pb = t.find("input")[0].value;
                if (validate(pb, "www.google.com") == true) {
                    var p = t.find("input")[2].value;
                    var npp = np(parseFloat(p), parseFloat(pb))
                    if (npp > 0) {
                        $(e).parent().prev().find("div").html('<br/><span class="pricebeat">Your New Price is $' + npp + '</span>');
                    }
                    else if (npp <= 0) {
                        $(e).parent().prev().find("div").html("Can not beat this price");
                    }
                }
            }

            function validate(price, url) {
                return /^[+]?\d+(\.\d+)?$/.test(price) & /(http:\/\/|https:\/\/|www\.)(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/.test(url)
            }

            function np(p, pb) {
                return (pb < p) ? ((pb - (p - pb) * 0.1).toFixed(2) > 0 ? ((pb - (p - pb) * 0.1).toFixed(2)) : 0.00) : p.toFixed(2)
            }
        </script>

        <asp:Repeater ID="rpSearchResult" runat="server">
            <HeaderTemplate>
                <table class="regular center" cellspacing="0" cellpadding="5">
                    <tr runat="server" id="trErrorMessage" visible="false">
                        <td colspan="8" class="center error">
                            <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 180px;" class="border_bottom">
                            Name
                        </th>
                        <th style="width: 80px;" class="border_bottom">
                            Strength
                        </th>
                        <th style="width: 80px;" class="border_bottom">
                            Quantity
                        </th>
                        <th style="width: 35px;" class="border_bottom">
                            Type
                        </th>
                        <th style="width: 45px;" class="border_bottom">
                            Price
                        </th>
                        <th style="width: 92px;" class="border_bottom">
                            Buy
                        </th>
                        <th style="width: 92px;" class="border_bottom">
                            Price Beat
                        </th>
                            <th style="width: 92px;" class="border_bottom">
                            Bulk Request
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblName"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblStrength"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblQuantity"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblType"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblPrice"></asp:Label>
                    </td>
                    <td>
                        <asp:ImageButton runat="server" ID="btnAddtoCart" SkinID="Add_To_Cart" />
                    </td>
                    <td>
                        <asp:Image runat="server" ID="imgPriceBeat" SkinID="price_beat" />
                    </td>
                    <td>
                        <asp:Image runat="server" ID="imgBulkRequest" SkinID="bulk_request" />
                    </td>
                </tr>
                <tr style="display: none;">
                    <td colspan="10" style="padding :0px 0px">
                        <asp:Panel ID="pnPriceBeat" runat="server" DefaultButton="btnButton">
                            <table style="width: 100%;" class="regular" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th colspan="3">
                                        Please complete the following form and click "Buy with New Price" to submit your
                                        price beat request for:
                                    </th>
                                </tr>
                                <tr>
                                    <th colspan="3" class="border_bottom">
                                        <b>Name:</b><asp:Label ID="lblNamePB" runat="server"></asp:Label>
                                        <b>Strength:</b>
                                        <asp:Label ID="lblStrengthPB" runat="server"></asp:Label>
                                        <b>QTY:</b>
                                        <asp:Label ID="lblQuantityPB" runat="server"></asp:Label>
                                        <b>Type:</b>
                                        <asp:Label ID="lblTypePB" runat="server"></asp:Label>
                                        <b>Price:</b>
                                        <asp:Label ID="lblPricePB" runat="server"></asp:Label>
                                    </th>
                                </tr>
                                <tr >
                                    <td colspan ="3" class="left">
                                        <asp:ValidationSummary ID="vsPriceBeat"  runat="server" />
                                    </td>
                                    
                                </tr>
                                <tr >
                                    <td style="width: 150px;" class="bold">
                                        Enter Competitor's Price
                                        <br />
                                        (Eg. 99.99) and
                                        <br />
                                        Click 'Calculate New Price'
                                    </td>
                                    <td class="left">
                                        $<asp:TextBox runat="server" ID="tbxPriceBeat" Width="100px"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rvPriceBeat" ControlToValidate ="tbxPriceBeat" runat="server" ErrorMessage="Please enter the competitor's price">*</asp:RequiredFieldValidator><asp:RangeValidator
                                                ID="rangePriceBeat" ControlToValidate="tbxPriceBeat" runat="server" Type ="Double" MinimumValue ="0.01" MaximumValue ="999999" ErrorMessage="Invalid competitor's price">*</asp:RangeValidator>
                                        <div class="pricebeat">
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Image ID="imgNewPrice" runat="server" SkinID="calculate_New_Price" />
                                </tr>
                                <tr>
                                    <td class="bold">
                                        Enter Website Address (URL) of
                                        <br />
                                        Price Beat Location
                                        <br />
                                        (Eg. www.domain.com)
                                    </td>
                                    <td colspan="2" class="left">
                                        <asp:TextBox runat="server" ID="tbxUrl" Width="300px"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rvUrl" ControlToValidate ="tbxUrl"  runat="server" ErrorMessage="Please enter the competitor's website address (eg. www.domain.com)">*</asp:RequiredFieldValidator>
                                        <asp:HiddenField
                                            ID="hfPricePB" runat="server" Value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="border_top">
                                        <asp:ImageButton runat="server" ID="btnButton" SkinID ="Btn_Buy_With_New_Price" />
                                    </td>
                                    <td class="border_top">
                                        <asp:Image ID="imgClosePB" runat="server" SkinID="Close_PB" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr style="display: none;">
                    <td colspan="10" style="padding :0px 0px">
                        <asp:Panel ID="pnBulkRequest" runat="server" DefaultButton="btnSubmitBR">
                            <table class="regular left" cellspacing="0" cellpadding="0">
                                <tr>
                                    <th colspan="4">
                                        For information on bulk quantities and to have a member of our Business Development
                                        Team contact you, please complete in full the form below. A representative will
                                        contact you within 2 business days.
                                    </th>
                                </tr>
                                <tr>
                                    <th colspan="4" class="border_bottom">
                                        Bulk purchase request for:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblNameBR"></asp:Label>
                                        Strength:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblStrengthBR"></asp:Label>
                                        QTY:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblQuantityBR"></asp:Label>
                                        Type:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblTypeBR"></asp:Label>
                                        Price:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblPriceBR"></asp:Label>
                                    </th>
                                </tr>
                                <tr >
                                    <td colspan="4">
                                        <asp:ValidationSummary ID="vsBulkRequest" ValidationGroup='<%#Eval("ID") %>' runat="server" />
                                    </td>
                                </tr>
                                <tr >
                                    <td class="bold">
                                        First Name:<asp:RequiredFieldValidator ID="rvFirstName" runat="server" ControlToValidate="txtFirstName"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Enter Your First Name">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="bold">
                                        Last Name:<asp:RequiredFieldValidator ID="rvLastName" runat="server" ControlToValidate="txtLastName"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Enter Your Last Name">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="bold">
                                        Company Name:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="bold">
                                        Telephone:<asp:RequiredFieldValidator ID="rvPhone" runat="server" ControlToValidate="txtTelephone"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Enter Your Phone Number">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTelephone" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="bold">
                                        Email:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="bold">
                                        Quantity:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtQuantityBR" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="bold">
                                        Comments:<asp:RequiredFieldValidator ID="rvComments" runat="server" ControlToValidate="txtComments"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Enter Your Comments">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="120" Width="400"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bold">
                                        Verification Code:<asp:RequiredFieldValidator ID="rvCode" runat="server" ControlToValidate="txtCaptcha"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Input The Verification Coder">*</asp:RequiredFieldValidator><asp:CustomValidator
                                                ID="validatorCaptcha" runat="server" EnableClientScript="false" ControlToValidate="txtCaptcha"
                                                ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Incorrect Verification Code"
                                                OnServerValidate="validatorCaptcha_ServerValidate">*</asp:CustomValidator>
                                    </td>
                                    <td>
                                        <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="none" CaptchaLength="6"
                                            CustomValidatorErrorMessage="Incorrect Verification Code" ValidationGroup='<%#Eval("ID") %>'
                                            CaptchaHeight="60" CaptchaWidth="240" CaptchaLineNoise="High" CaptchaMinTimeout="5"
                                            CaptchaMaxTimeout="300" CacheStrategy="HttpRuntime" />
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td colspan="2" class="center border_top">
                                        <asp:ImageButton runat="server" ID="btnSubmitBR" SkinID="Bulk_Request" ValidationGroup='<%#Eval("ID") %>' />
                                    </td>
                                    <td colspan="2" class="border_top">
                                        <asp:Image runat="server" ID="imgCloseBR" SkinID="close_PB" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblName"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblStrength"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblQuantity"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblType"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblPrice"></asp:Label>
                    </td>
                    <td>
                        <asp:ImageButton runat="server" ID="btnAddtoCart" SkinID="Add_To_Cart" />
                    </td>
                    <td>
                        <asp:Image runat="server" ID="imgPriceBeat" SkinID="price_beat" />
                    </td>
                    <td>
                        <asp:Image runat="server" ID="imgBulkRequest" SkinID="bulk_request" />
                    </td>
                </tr>
                <tr style="display: none;">
                    <td colspan="10" style="padding :0px 0px">
                        <asp:Panel ID="pnPriceBeat" runat="server" DefaultButton="btnButton">
                            <table style="width: 100%;" class="regular" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th colspan="3">
                                        Please complete the following form and click "Buy with New Price" to submit your
                                        price beat request for:
                                    </th>
                                </tr>
                                <tr>
                                    <th colspan="3" class="border_bottom">
                                        <b>Name:</b><asp:Label ID="lblNamePB" runat="server"></asp:Label>
                                        <b>Strength:</b>
                                        <asp:Label ID="lblStrengthPB" runat="server"></asp:Label>
                                        <b>QTY:</b>
                                        <asp:Label ID="lblQuantityPB" runat="server"></asp:Label>
                                        <b>Type:</b>
                                        <asp:Label ID="lblTypePB" runat="server"></asp:Label>
                                        <b>Price:</b>
                                        <asp:Label ID="lblPricePB" runat="server"></asp:Label>
                                    </th>
                                </tr>
                                <tr >
                                    <td colspan ="3" class="left">
                                        <asp:ValidationSummary ID="vsPriceBeat"  runat="server" />
                                    </td>
                                    
                                </tr>
                                <tr >
                                    <td style="width: 150px;" class="bold">
                                        Enter Competitor's Price
                                        <br />
                                        (Eg. 99.99) and
                                        <br />
                                        Click 'Calculate New Price'
                                    </td>
                                    <td class="left">
                                        $<asp:TextBox runat="server" ID="tbxPriceBeat" Width="100px"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rvPriceBeat" ControlToValidate ="tbxPriceBeat" runat="server" ErrorMessage="Please enter the competitor's price">*</asp:RequiredFieldValidator><asp:RangeValidator
                                                ID="rangePriceBeat" ControlToValidate="tbxPriceBeat" runat="server" Type ="Double" MinimumValue ="0.01" MaximumValue ="999999" ErrorMessage="Invalid competitor's price">*</asp:RangeValidator>
                                        <div class="pricebeat">
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Image ID="imgNewPrice" runat="server" SkinID="calculate_New_Price" />
                                </tr>
                                <tr>
                                    <td class="bold">
                                        Enter Website Address (URL) of
                                        <br />
                                        Price Beat Location
                                        <br />
                                        (Eg. www.domain.com)
                                    </td>
                                    <td colspan="2" class="left">
                                        <asp:TextBox runat="server" ID="tbxUrl" Width="300px"></asp:TextBox><asp:RequiredFieldValidator
                                            ID="rvUrl" ControlToValidate ="tbxUrl"  runat="server" ErrorMessage="Please enter the competitor's website address (eg. www.domain.com)">*</asp:RequiredFieldValidator>
                                        <asp:HiddenField
                                            ID="hfPricePB" runat="server" Value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="border_top">
                                        <asp:ImageButton runat="server" ID="btnButton" SkinID ="Btn_Buy_With_New_Price" />
                                    </td>
                                    <td class="border_top">
                                        <asp:Image ID="imgClosePB" runat="server" SkinID="Close_PB" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr style="display: none;">
                    <td colspan="10" style="padding :0px 0px">
                        <asp:Panel ID="pnBulkRequest" runat="server" DefaultButton="btnSubmitBR">
                            <table class="regular left" cellspacing="0" cellpadding="0">
                                <tr>
                                    <th colspan="4">
                                        For information on bulk quantities and to have a member of our Business Development
                                        Team contact you, please complete in full the form below. A representative will
                                        contact you within 2 business days.
                                    </th>
                                </tr>
                                <tr>
                                    <th colspan="4" class="border_bottom">
                                        Bulk purchase request for:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblNameBR"></asp:Label>
                                        Strength:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblStrengthBR"></asp:Label>
                                        QTY:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblQuantityBR"></asp:Label>
                                        Type:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblTypeBR"></asp:Label>
                                        Price:
                                        <asp:Label Font-Bold="true" runat="server" ID="lblPriceBR"></asp:Label>
                                    </th>
                                </tr>
                                <tr >
                                    <td colspan="4">
                                        <asp:ValidationSummary ID="vsBulkRequest" ValidationGroup='<%#Eval("ID") %>' runat="server" />
                                    </td>
                                </tr>
                                <tr >
                                    <td class="bold">
                                        First Name:<asp:RequiredFieldValidator ID="rvFirstName" runat="server" ControlToValidate="txtFirstName"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Enter Your First Name">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="bold">
                                        Last Name:<asp:RequiredFieldValidator ID="rvLastName" runat="server" ControlToValidate="txtLastName"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Enter Your Last Name">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="bold">
                                        Company Name:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="bold">
                                        Telephone:<asp:RequiredFieldValidator ID="rvPhone" runat="server" ControlToValidate="txtTelephone"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Enter Your Phone Number">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTelephone" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="bold">
                                        Email:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="bold">
                                        Quantity:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtQuantityBR" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td class="bold">
                                        Comments:<asp:RequiredFieldValidator ID="rvComments" runat="server" ControlToValidate="txtComments"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Enter Your Comments">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="120" Width="400"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bold">
                                        Verification Code:<asp:RequiredFieldValidator ID="rvCode" runat="server" ControlToValidate="txtCaptcha"
                                            ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Please Input The Verification Coder">*</asp:RequiredFieldValidator><asp:CustomValidator
                                                ID="validatorCaptcha" runat="server" EnableClientScript="false" ControlToValidate="txtCaptcha"
                                                ValidationGroup='<%#Eval("ID") %>' ErrorMessage="Incorrect Verification Code"
                                                OnServerValidate="validatorCaptcha_ServerValidate">*</asp:CustomValidator>
                                    </td>
                                    <td>
                                        <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="none" CaptchaLength="6"
                                            CustomValidatorErrorMessage="Incorrect Verification Code" ValidationGroup='<%#Eval("ID") %>'
                                            CaptchaHeight="60" CaptchaWidth="240" CaptchaLineNoise="High" CaptchaMinTimeout="5"
                                            CaptchaMaxTimeout="240" CacheStrategy="HttpRuntime" />
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr >
                                    <td colspan="2" class="center border_top">
                                        <asp:ImageButton runat="server" ID="btnSubmitBR" SkinID="Bulk_Request" ValidationGroup='<%#Eval("ID") %>' />
                                    </td>
                                    <td colspan="2" class="border_top">
                                        <asp:Image runat="server" ID="imgCloseBR" SkinID="close_PB" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <div class="hidden_dialog" style="display: none; width: 250px;" title="Price beating The Competion">
            <p>
                <font color="black" size="2" face="Verdana,Arial,Helvetica">If you find a better price
                    advertised on a competitor web site,
                    <%=Common.WebSetting.Setting("WebSiteName")%>
                    will beat it! Simply click the "Price Beat" button, enter the price details, and
                    we will beat the competing price by 10% of the price difference. It's that simple!</font>
            </p>
            <p>
                <font color="black" size="1" face="Verdana,Arial,Helvetica"><i>*
                    <%=Common.WebSetting.Setting("CompanyShortName")%>
                    Price Beat Policy only applies to identical products advertised by certified online
                    pharmacies. Certain restrictions may apply. Please call for additional details.
                    All Price Beat requests must be verifiable on the Internet. In the event that we
                    cannot verify the competing price on the Internet, your request may be denied and
                    you will automatically be charged the price advertised on the
                    <%=Common.WebSetting.Setting("CompanyShortName")%>
                    website.</i></font>
            </p>
        </div>
    </asp:View>
    <asp:View runat="server" ID="viewEmpty">
        <div style="width: 400px; margin: 0 auto;">
            <p>
                Please use the search bar below to find your drugs</p>
            <wuc:SearchBar runat="server" ID="oSearchBar3" />
        </div>
    </asp:View>
</asp:MultiView>
