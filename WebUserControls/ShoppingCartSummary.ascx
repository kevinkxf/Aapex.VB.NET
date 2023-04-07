<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ShoppingCartSummary.ascx.vb"
    Inherits="WebUserControls_ShoppingCartSummary" %>
<asp:Repeater ID="rpShoppingCartSummary" runat="server">
    <HeaderTemplate>
        <table class="regular w100 center" cellpadding="5" cellspacing ="0">
            <tr>
                <th class="border_bottom">
                    Product
                </th>
                <th runat ="server" visible ="false">
                    Strength
                </th>
                <th runat ="server" visible ="false" >
                    Quantity
                </th>
                <th style="width: 60px">
                    Quantity
                </th>
                <th>
                    Price (USD)
                </th>
                <th>
                    Total (USD)
                </th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="border center">
            <td>
                <asp:Literal runat="server" ID="lblName"></asp:Literal>
            </td>
            <td runat ="server" visible ="false">
                <asp:Literal runat="server" ID="lblStrength"></asp:Literal>
            </td>
            <td runat ="server" visible ="false"> 
                <asp:Literal runat="server" ID="lblQuantity"></asp:Literal>
            </td>
            <td>
                <asp:Literal runat="server" ID="lblQTYOrdered"></asp:Literal>
            </td>
            <td>
                <asp:Literal runat="server" ID="lblPrice"></asp:Literal>
            </td>
            <td>
                <asp:Literal runat="server" ID="lblTotal"></asp:Literal>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        <tr>
            <td colspan="3" class="right">
                SubTotal:
            </td>
            <td class="left" colspan="2">
                <asp:Literal runat="server" ID="lblSubtotal"></asp:Literal>&nbsp;USD
            </td>
        </tr>
        <tr>
            <td colspan="3" class="right">
                Shipping Fee:
            </td>
            <td class="left" colspan="2">
                <asp:Literal runat="server" ID="lblShippingFee"></asp:Literal>&nbsp;USD
            </td>
        </tr>
        <tr runat="server" id="trDiscount">
            <td colspan="3" class="right">
                Additional Discount:
            </td>
            <td class="left" colspan="2">
                <asp:Literal runat="server" ID="lblDiscount"></asp:Literal>&nbsp;USD
            </td>
        </tr>
        <tr class="bold">
            <td colspan="3" class="right">
                Total:
            </td>
            <td class="left" colspan="2">
                <asp:Literal runat="server" ID="lblTotal"></asp:Literal>&nbsp;USD
            </td>
        </tr>
        </table>
    </FooterTemplate>
</asp:Repeater>
