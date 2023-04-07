<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SpecialDrugSearch.ascx.vb"
    Inherits="WebUserControls_SpecialDrugSearch" %>
<%@ Register Assembly="Microsoft.Web.GeneratedImage" Namespace="Microsoft.Web" TagPrefix="cc1" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register Src="~/WebUserControls/CreditCardLogos.ascx" TagPrefix="wuc" TagName="CCLogo" %>
<script type="text/javascript" >
    InitTooltip();
</script>
<table style="width: 100%">
    <tr runat="server" id="trErrorMessage" visible="false">
        <td class="center error">
            <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: middle">
            <cc1:GeneratedImage ID="oGeneratedImage" runat="server" ImageHandlerUrl="~/DrugImage.ashx">
                <Parameters>
                    <cc1:ImageParameter Name="DrugName" Value="0" />
                </Parameters>
            </cc1:GeneratedImage>
        </td>
        <td style="vertical-align: middle; width: 900px">
            <asp:HyperLink runat="server" ID="oLink" NavigateUrl="~/ProductCert.html">
                <asp:Image ID="Image1" runat="server" SkinID="LowPrice_Guarantee" /></asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <wuc:CCLogo runat="server" ID="oLogo" ShowProductGuaranteeButton="true" ShowMcAfeeSeal ="false" ShowGeoTrust ="false"  />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:DropDownList runat="server" ID="ddlVolume" Width="490" AutoPostBack="true">
            </asp:DropDownList>
            <asp:ImageButton runat="server" ID="btnAddtoCart" SkinID="Add_To_Cart" Style="margin: -5px 2px;" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Image runat="server" ID="btnPriceBeat" SkinID="ImgPrice_Beat" onclick="ShowPriceBeatForm()"  class="pbImage"
                Style="cursor: pointer" />
            &nbsp
            <asp:Image runat="server" ID="btnVulumeDiscount" SkinID="ImgVolume_Discount" onclick="ShowBulkRequestForm()"
                Style="cursor: pointer" />
            &nbsp <a runat="server" href="~/contactus.html">
                <asp:Image runat="server" ID="btnTalkToUs" SkinID="ImgTalk_To_Us" /></a>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Panel ID="pnPriceBeat" runat="server" DefaultButton="btnButton">
                <table class="pricebeat f14" id="tbPB" >
                    <tr>
                        <th colspan="3" class="center">
                            Price Beat
                        </th>
                    </tr>
                    <tr>
                        <td colspan="3" class="darkblue bold">
                            Please complete the following form and click "Buy with New Price" to submit your
                            price beat request for:
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="darkblue bold">
                            Name:<asp:Label ID="lblNamePB" runat="server"></asp:Label>
                            Strength:
                            <asp:Label ID="lblStrengthPB" runat="server"></asp:Label>
                            QTY:
                            <asp:Label ID="lblQuantityPB" runat="server"></asp:Label>
                            Type:
                            <asp:Label ID="lblTypePB" runat="server"></asp:Label>
                            Price:
                            <asp:Label ID="lblPricePB" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="left" colspan="3">
                            &nbsp;<asp:ValidationSummary ID="vsPriceBeat" ValidationGroup="PriceBeat" runat="server"
                                BackColor="#EAF7FF" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="bold">
                            Enter Competitor's Price (Eg. 99.99) and Click 'Calculate New Price'
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50px;" class="bold">
                        </td>
                        <td class="left">
                            $<asp:TextBox runat="server" ID="txtPriceBeat" Width="100px"></asp:TextBox><asp:RequiredFieldValidator
                                runat="server" ID="RequiredFieldValidator1" ValidationGroup="PriceBeat" ControlToValidate="txtPriceBeat"
                                ErrorMessage="Please enter the competitor's price.">*</asp:RequiredFieldValidator><asp:RangeValidator
                                    ID="rangPriceMatch" runat="server" ErrorMessage="Invalid competitor's price"
                                    Type="Double" ControlToValidate="txtPriceBeat" MinimumValue="0.01" MaximumValue="99999"
                                    ValidationGroup="PriceBeat">*</asp:RangeValidator><div class="pricebeat">
                                    </div>
                        </td>
                        <td>
                            <asp:Image ID="imgNewPrice" runat="server" SkinID="calculate_New_Price" onclick="sp(this)" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="bold">
                            Enter Website Address (URL) of Price Beat Location (Eg. www.domain.com)
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                        </td>
                        <td colspan="2" class="left">
                            <asp:TextBox runat="server" ID="txtUrl" Width="300px"></asp:TextBox><asp:RequiredFieldValidator
                                runat="server" ID="rvUrl" ValidationGroup="PriceBeat" ControlToValidate="txtUrl"
                                ErrorMessage="Please enter the competitor's website address (eg. www.domain.com)">*</asp:RequiredFieldValidator><asp:HiddenField
                                    ID="hfPricePB" runat="server" Value="" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="center">
                            <asp:ImageButton runat="server" ID="btnButton" ValidationGroup="PriceBeat" SkinID="Btn_Buy_With_New_Price" />
                        </td>
                        <td>
                            <asp:Image ID="imgClosePB" runat="server" SkinID="Close_PB" onclick="HidePriceBeatForm()" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Panel ID="pnBulkRequest" runat="server" DefaultButton="btnSubmitBR">
                <table class="volume left f14" id="tbBR">
                    <tr>
                        <th colspan="4" class="center">
                            Volume Discount
                        </th>
                    </tr>
                    <tr>
                        <td colspan="4" class="darkgreen bold">
                            For information on bulk quantities and to have a member of our Business Development
                            Team contact you, please complete in full the form below. A representative will
                            contact you within 2 business days.
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="darkgreen bold">
                            Bulk purchase request for:
                            <asp:Label runat="server" ID="lblNameBR"></asp:Label>
                            Strength:
                            <asp:Label runat="server" ID="lblStrengthBR"></asp:Label>
                            QTY:
                            <asp:Label runat="server" ID="lblQuantityBR"></asp:Label>
                            Type:
                            <asp:Label runat="server" ID="lblTypeBR"></asp:Label>
                            Price:
                            <asp:Label runat="server" ID="lblPriceBR"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            &nbsp;<asp:ValidationSummary ID="vsBulkRequest" ValidationGroup="BulkRequest" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            First Name:<asp:RequiredFieldValidator ID="rvFirstName" runat="server" ControlToValidate="txtFirstName"
                                ValidationGroup="BulkRequest" ErrorMessage="Please Enter Your First Name">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        </td>
                        <td class="bold">
                            Last Name:<asp:RequiredFieldValidator ID="rvLastName" runat="server" ControlToValidate="txtLastName"
                                ValidationGroup="BulkRequest" ErrorMessage="Please Enter Your Last Name">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            Company Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                        </td>
                        <td class="bold">
                            Telephone:<asp:RequiredFieldValidator ID="rvPhone" runat="server" ControlToValidate="txtTelephone"
                                ValidationGroup="BulkRequest" ErrorMessage="Please Enter Your Phone Number">*</asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTelephone" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
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
                    <tr>
                        <td class="bold">
                            Comments:<asp:RequiredFieldValidator ID="rvComments" runat="server" ControlToValidate="txtComments"
                                ValidationGroup="BulkRequest" ErrorMessage="Please Enter Your Comments">*</asp:RequiredFieldValidator>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="120" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            Verification Code:<asp:RequiredFieldValidator ID="rvCode" runat="server" ControlToValidate="txtCaptcha"
                                ValidationGroup="BulkRequest" ErrorMessage="Please Input The Verification Coder">*</asp:RequiredFieldValidator><asp:CustomValidator
                                    ID="validatorCaptcha" runat="server" EnableClientScript="false" ControlToValidate="txtCaptcha"
                                    ValidationGroup="BulkRequest" ErrorMessage="Incorrect Verification Code" OnServerValidate="validatorCaptcha_ServerValidate">*</asp:CustomValidator>
                        </td>
                        <td>
                            <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="none" CaptchaLength="6"
                                BackColor="#e1f9c5" CustomValidatorErrorMessage="Incorrect Verification Code"
                                ValidationGroup="BulkRequest" CaptchaHeight="60" CaptchaWidth="240" CaptchaLineNoise="High"
                                CaptchaMinTimeout="5" CaptchaMaxTimeout="300" CacheStrategy="HttpRuntime" />
                        </td>
                        <td colspan="2">
                            <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="center">
                            <asp:ImageButton runat="server" ID="btnSubmitBR" SkinID="Btn_Submit_Green" ValidationGroup="BulkRequest" />
                        </td>
                        <td colspan="2">
                            <asp:Image runat="server" ID="imgCloseBR" SkinID="close_BR" onclick="HideBulkRequestForm()" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>
<span style="font-weight: bold">Manufacturer:</span>
<p><asp:Literal ID="lblVendor" runat="server"></asp:Literal></p>
<span style="font-weight: bold">Production Description:</span>
<asp:Literal ID="lblDescription" runat="server"></asp:Literal>
<div id="d1">
<p>If you find a better price
                    advertised on a competitor web site,
                    <%=Common.WebSetting.Setting("WebSiteName")%>
                    will beat it! Simply click the "Price Beat" button, enter the price details, and
                    we will beat the competing price by 10% of the price difference. It's that simple!</p>
                    <p><i>*
                    <%=Common.WebSetting.Setting("CompanyShortName")%>
                    Price Beat Policy only applies to identical products advertised by certified online
                    pharmacies. Certain restrictions may apply. Please call for additional details.
                    All Price Beat requests must be verifiable on the Internet. In the event that we
                    cannot verify the competing price on the Internet, your request may be denied and
                    you will automatically be charged the price advertised on the
                    <%=Common.WebSetting.Setting("CompanyShortName")%>
                    website.</i></p>
</div>