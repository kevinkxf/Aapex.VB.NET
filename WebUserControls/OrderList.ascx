<%@ Control Language="VB" AutoEventWireup="false" CodeFile="OrderList.ascx.vb" Inherits="WebUserControls_OrderList" %>
<asp:MultiView runat="server" ID="mvOrderList" ActiveViewIndex="0">
    <asp:View runat="server" ID="viewList">
        <asp:Repeater ID="rpList" runat="server">
            <HeaderTemplate>
                <table class="regular w100" cellpadding ="0" cellspacing ="0">
                    <tr>
                        <th style="width:75px">
                            Order Date
                        </th>
                        <th style="width:150px">
                            Order ID
                        </th>
                        <th style="width:80px">
                            Status
                        </th>
                        <th style="width:80px">
                            Total Price
                        </th>
                        <th>
                            Note
                        </th>
                    </tr>
            </HeaderTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
            <ItemTemplate>
                <tr class="center">
                    <td>
                        <asp:Literal runat="server" ID="lblOrderDate"></asp:Literal>
                    </td>
                    <td>
                        <asp:HyperLink runat="server" ID="hlOrderID"></asp:HyperLink>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="lblStatus"></asp:Literal>
                    </td>
                     <td class="left">
                        <asp:Literal runat="server" ID="lblTotal"></asp:Literal>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="lblNote"></asp:Literal>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </asp:View>
    <asp:View ID="viewEmptyOrderHistory" runat="server">
        <h3>
            You don't have any order.</h3>
    </asp:View>
</asp:MultiView>