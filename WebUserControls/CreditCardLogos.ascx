<%@ Control Language="VB" AutoEventWireup="false" CodeFile="CreditCardLogos.ascx.vb"
    Inherits="WebUserControls_CreditCardLogos" %>
<%@ Register Src="~/WebUserControls/McAfeeSeal.ascx" TagPrefix="wuc" TagName="Seal" %>
<table style="vertical-align: middle; width: 100%">
    <tr style="vertical-align: middle;">
        <td style="vertical-align: middle; width: 370px">
            <wuc:Seal runat="server" ID ="oSeal" ActiveViewIndex="1" />
            <asp:Image runat="server" ID="image4" SkinID="GeoTrust_Logo"  />
            <asp:Image runat="server" ID="image5" SkinID="Visa_Banner" />
            <asp:Image runat="server" ID="image6" SkinID="Master_Banner" />
            <asp:Image runat="server" ID="image7" SkinID="Amex_Banner" />
            <asp:Image runat="server" ID="image8" SkinID="Discover_Banner" />
            <asp:HyperLink runat="server" ID="linkCert" NavigateUrl="~/ProductCert.html">
                <asp:Image runat="server" ID="image1" SkinID="Product_Guarantee" /></asp:HyperLink>
        </td>
        <td runat="server" id="tdStock">
            <span class="instock">In Stock Today</span>
        </td>
    </tr>
</table>
