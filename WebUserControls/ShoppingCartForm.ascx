<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ShoppingCartForm.ascx.vb"
    Inherits="WebUserControls_ShoppingCartForm" %>
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnUpdate">
    <asp:Repeater ID="rpShoppingCart" runat="server">
        <HeaderTemplate>
            <asp:ValidationSummary ID="vsShoppingCart" ValidationGroup="ShoppingCart" runat="server" />
            <table class="regular" style="width: 100%" cellspacing="0" cellpadding="5">
                <tr>
                    <th>
                        Product
                    </th>
                    <th runat="server" visible="false">
                        Strength
                    </th>
                    <th runat="server" visible="false">
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
                    <th style="width: 40px">
                        &nbsp;
                    </th>
                </tr>
        </HeaderTemplate>
        <FooterTemplate>
            <tr>
                <td colspan="3" class="right border_top">
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
            <tr>
                <td colspan="3" class="right bold">
                    Total:
                </td>
                <td class="left bold" colspan="2">
                    <asp:Literal runat="server" ID="lblTotal"></asp:Literal>&nbsp;USD
                </td>
            </tr>
            </table>
        </FooterTemplate>
        <ItemTemplate>
            <tr class="border center">
                <td>
                    <asp:HiddenField runat="server" ID="hfDrugID" />
                    <asp:Literal runat="server" ID="lblName"></asp:Literal>
                </td>
                <td runat="server" visible="false">
                    <asp:Literal runat="server" ID="lblStrength"></asp:Literal>
                </td>
                <td runat="server" visible="false">
                    <asp:Literal runat="server" ID="lblQuantity"></asp:Literal>
                </td>
                <td>
                    <asp:HiddenField runat="server" ID="hfQTYOrdered" />
                    <asp:TextBox runat="server" ID="txtQTYOrdered" Width="40" CssClass="center"></asp:TextBox>
                    <asp:RangeValidator ID="rangeQTY" runat="server" ControlToValidate="txtQTYOrdered"
                        ErrorMessage="" ValidationGroup="ShoppingCart" Type="Integer" >*</asp:RangeValidator>
                </td>
                <td>
                    <asp:Literal runat="server" ID="lblPrice"></asp:Literal>
                </td>
                <td>
                    <asp:Literal runat="server" ID="lblTotal"></asp:Literal>
                </td>
                <td class="center">
                    <asp:ImageButton runat="server" ID="btnDelete" SkinID="Delete_Item" />
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <table cellpadding="10" cellspacing="0" class="center w100">
        <tr>
            <td style="width: 33%">
                <asp:ImageButton runat="server" ID="btnUpdate" SkinID="Update Cart"
                    ValidationGroup="ShoppingCart" />
            </td>
            <td style="width: 33%">
                <asp:ImageButton runat="server" ID="btnEmptyCart" SkinID="Empty Cart" />
            </td>
            <td>
                <asp:ImageButton runat="server" ID="btnCheckOut" SkinID="Check Out"
                    ValidationGroup="ShoppingCart" />
            </td>
        </tr>
    </table>
</asp:Panel>
`