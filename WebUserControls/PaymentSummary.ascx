<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PaymentSummary.ascx.vb" Inherits="WebUserControls_PaymentSummary" %>
<table class="new w100 fullheight">
    <tr>
        <th class="left">Payment Information</th>
    </tr>
    <tr>
        <td class="left bold"><asp:Label runat ="server" ID="lblMethod">/</asp:Label></td>
    </tr>
    <tr>
        <td class="left bold"><asp:Label runat ="server" ID="lblName">Name on Credit Card: /</asp:Label></td>
    </tr>
    <tr>
        <td class="left bold"><asp:Label runat ="server" ID="lblNumber">Credit Card Number: /</asp:Label></td>
    </tr>
    <tr>
        <td class="left bold"><asp:Label runat ="server" ID="lblDate">Expiry Date: /</asp:Label></td>
    </tr>
    <tr>
        <td class="left bold"><asp:Label runat ="server" ID="lblCVV2">CVV2: /</asp:Label></td>
    </tr>
    <tr>
        <td colspan ="2"><asp:LinkButton runat ="server" ID ="linkChangePayment">Change payment Information</asp:LinkButton></td> 
    </tr>
    <tr>
        <td colspan ="2" style="height:100%">&nbsp;</td>
    </tr>
</table>
