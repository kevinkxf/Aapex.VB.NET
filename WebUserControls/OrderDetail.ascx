<%@ Control Language="VB" AutoEventWireup="false" CodeFile="OrderDetail.ascx.vb"
    Inherits="WebUserControls_OrderDetail" %>
<asp:MultiView runat="server" ID="mvOrderList" ActiveViewIndex="0">
    <asp:View runat="server" ID="viewOrderDetail">
        <asp:Repeater runat="server" ID="rpOrderDetail">
            <HeaderTemplate>
                <table class="regular w100 center" cellspacing="0" cellpadding="5">
                    <tr>
                        <th colspan="4" class="border_bottom">
                            Order Detail
                        </th>
                    </tr>
                    <tr>
                        <td class="w25 left">
                            Order ID:
                        </td>
                        <td class="w25 left">
                            <asp:Label runat="server" ID="lblOrderID"> </asp:Label>
                        </td>
                        <td class="w25 left">
                            Name:
                        </td>
                        <td class="w25 left">
                            <asp:Label runat="server" ID="lblName">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            Sex:
                        </td>
                        <td class="left">
                            <asp:Label runat="server" ID="lblSex">
                            </asp:Label>
                        </td>
                        <td class="left">
                            Birth Date:
                        </td>
                        <td class="left">
                            <asp:Label runat="server" ID="lblBirthDate">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="4" class="border_top">
                            Drugs Ordered
                        </th>
                    </tr>
                    <tr>
                        <td colspan="4" style="padding: 0">
                            <table class="inner w100" style="border: none" cellpadding="2" cellspacing="0">
                                <tr>
                                    <th class=" border_top border_bottom">
                                        Name
                                    </th>
                                    <th style="width: 60px" class="border_top border_bottom">
                                        Quantity
                                    </th>
                                    <th class="border_top border_bottom">
                                        Price
                                    </th>
                                    <th class=" border_top border_bottom">
                                        Total
                                    </th>
                                </tr>
            </HeaderTemplate>
            <FooterTemplate>
                <tr>
                    <th colspan="2" class="right border_top ">
                        SubTotal:
                    </th>
                    <th class="right border_top " colspan="2">
                        USD
                        <asp:Label runat="server" ID="lblSubtotal"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <th colspan="2" class="right ">
                        Shipping Fee:
                    </th>
                    <th class="right " colspan="2">
                        USD
                        <asp:Label runat="server" ID="lblShippingFee"></asp:Label>
                    </th>
                </tr>
                <tr runat="server" id="trDiscount" colspan="4">
                    <th class="right" colspan="2">
                        Additional Discount:
                    </th>
                    <th class="right " colspan="2">
                        USD
                        <asp:Label runat="server" ID="lblDiscount"></asp:Label>
                    </th>
                </tr>
                <tr>
                    <th class="right" colspan="2">
                        Total:
                    </th>
                    <th class="right" colspan="2">
                        USD
                        <asp:Label runat="server" ID="lblTotal"></asp:Label>
                    </th>
                </tr>
                </table> </td></tr></table>
            </FooterTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblName"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblQTYOrdered"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblPrice"></asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblTotal"></asp:Label>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </asp:View>
</asp:MultiView>
