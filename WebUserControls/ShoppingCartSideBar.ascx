<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ShoppingCartSideBar.ascx.vb"
    Inherits="WebUserControls_ShoppingCartSideBar" %>
<div class="SideBarShoppingCart">
    <b class="rtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4">
    </b></b><a runat="server" href="~/shoppingcart.html">
        <asp:Image ID="Image1" runat="server" SkinID="Side_Header" /></a>
    <asp:MultiView runat="server" ID="mvSideBar">
        <asp:View runat="server" ID="viewCart">
            <asp:Repeater runat="server" ID="rpShoppingCart">
                <HeaderTemplate>
                    <table class="sideshoppingcart f11" width="140px" cellspacing="0" style="margin-top: 8px;margin-bottom:8px;
                        overflow: scroll">
                        <tr>
                            <th width="64px">
                                Name
                            </th>
                            <th width="30px">
                                QTY Ordered
                            </th>
                            <th width="40px">
                                Price
                            </th>
                        </tr>
                </HeaderTemplate>
                <FooterTemplate>
                    <tr>
                        <th class="right">
                            SubTotal:
                        </th>
                        <th colspan="2" class="right">
                            <asp:Label runat="server" ID="lblSubtotal"></asp:Label>&nbsp;USD
                        </th>
                    </tr>
                    <tr>
                        <th class="right">
                            Shipping Fee:
                        </th>
                        <th colspan="2" class="right">
                            <asp:Label runat="server" ID="lblShippingFee"></asp:Label>&nbsp;USD
                        </th>
                    </tr>
                    <tr runat="server" id="trDiscount">
                        <th class="right">
                            Additional Discount:
                        </th>
                        <th colspan="2" class="right">
                            <asp:Label runat="server" ID="lblDiscount"></asp:Label>&nbsp;USD
                        </th>
                    </tr>
                    <tr>
                        <th class="right">
                            Total:
                        </th>
                        <th colspan="2" class="right">
                            <asp:Label runat="server" ID="lblTotal"></asp:Label>&nbsp;USD
                        </th>
                    </tr>
                    </table>
                    <a runat ="server" href ="~/Checkout.html"><asp:Image runat ="server" ID ="imgCheckout" SkinID ="Side_Check_Out" /></a><a runat ="server" href="~/ShoppingCart.html"><asp:Image runat ="server" ID ="imgEditCart" SkinID ="Side_Edit_Cart"/></a>
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
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </asp:View>
        <asp:View runat="server" ID="viewEmpty">
            <table class="sideshoppingcart f11" width="100%" cellspacing="0" style="margin-top: 8px;margin-bottom:18px;">
                <tr>
                    <td>
                        There are 0 item in your shopping cart.
                    </td>
                    
                </tr>
                <tr>
                <td>
                        <a id="A1" runat ="server" href ="~/SearchDrug.html">Start Shopping</a>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <b class="rtop" style ="margin-top :4px"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1">
    </b></b>
</div>
