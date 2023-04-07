<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false"
    CodeFile="Checkout.aspx.vb" Inherits="Checkout" Title="Check Out" %>

<%@ Register Src="~/WebUserControls/AddressForm.ascx" TagPrefix="wuc" TagName="AddressForm" %>
<%@ Register Src="~/WebUserControls/AddressList.ascx" TagPrefix="wuc" TagName="AddressList" %>
<%@ Register Src="~/WebUserControls/PaymentForm.ascx" TagPrefix="wuc" TagName="PaymentForm" %>
<%@ Register Src="~/WebUserControls/SelectedAddress.ascx" TagPrefix="wuc" TagName="ShowAddress" %>
<%@ Register Src="~/WebUserControls/ShoppingCartSummary.ascx" TagPrefix="wuc" TagName="ShowShoppingCartSummary" %>
<%@ Register Src="~/WebUserControls/PaymentSummary.ascx" TagPrefix="wuc" TagName="ShowPaymentSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Secure Check Out</h3>
    <asp:MultiView ID="mvCheckout" runat="server" ActiveViewIndex="1">
        <asp:View runat="server" ID="viewAddress">
            <wuc:addresslist runat="server" id="oAddressList" />
            <wuc:addressform runat="server" id="oAddressForm" title="Add Address" />
        </asp:View>
        <asp:View runat="server" ID="viewPayment">
            <table class="w100 f12" cellspacing="10">
                <tr>
                    <td valign="top">
                        <wuc:showaddress runat="server" id="oShippingAddress" title="Shipping Address" />
                    </td>
                    <td rowspan="2" valign="top" style="width: 350px">
                        <wuc:paymentform runat="server" id="oPaymentForm" />
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <wuc:showaddress runat="server" id="oBillingAddress" title="Billing Address" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View runat="server" ID="viewSummary">
            <table class="w100 f12 fullheight" cellpadding="8">
                <tr>
                    <td>
                        <wuc:showaddress runat="server" id="oShippingAddressSummary" title="Shipping Address"
                            hidebutton="true" />
                    </td>
                    <td valign="top" rowspan="2" style="width: 300px">
                        <wuc:showpaymentsummary runat="server" id="oPaymentSummary" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <wuc:showaddress runat="server" id="oBillingAddressSummary" title="Billing Address"
                            hidebutton="true" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <wuc:showshoppingcartsummary id="oSummary" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="right" colspan="2">
                        <asp:ImageButton runat="server" ID="btnGoback" SkinID="Go_Back" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton runat="server" ID="btnPurchase" SkinID="Purchase" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View runat="server" ID="viewDone">
            <div style="width: 600px; margin: 0 auto" class="left">
                <p>
                    Thank You! Your order has been successfully submitted for processing.</p>
                <p>
                    Your reference number(s) for your order(s) are:</p>
                <p>
                    Your Order ID is:
                    <asp:HyperLink runat="server" ID="linkOrderID"></asp:HyperLink></p>
                <p>
                    To view your order history and status, click on the Order ID above or visit
                    <asp:HyperLink runat="server" ID="linkMyAccount" NavigateUrl="~/MyAccount.html">My Account</asp:HyperLink>
                    page. If you have any question, please call out Toll-Free at
                    <%=Common.WebSetting.Setting.TollFreeTel%>.
                    <p>
                        <asp:HyperLink runat="server" Text="Return to home" NavigateUrl="~/default.html"></asp:HyperLink></p>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
