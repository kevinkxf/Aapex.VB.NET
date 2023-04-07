<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AddressList.ascx.vb"
    Inherits="WebUserControls_AddressList" %>
<asp:MultiView ID="mvAddressList" runat="server" ActiveViewIndex="0">
    <asp:View runat="server" ID="viewList">
        <asp:Repeater runat="server" ID="rpAddressList">
            <HeaderTemplate>
                <table class="addresslist w100" cellspacing="0" cellpadding="4">
                    <tr >
                        <th class="left">Existing Addresses</td>
                        <th>Actions</td>
                    </tr>
                    <tr >
                        <td colspan ="2" style="padding :0"><hr /></td>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><asp:Literal runat ="server" ID ="lblAddress"></asp:Literal></td>
                    <td class="center"><asp:LinkButton runat ="server" ID ="linkSelect" CommandName ="Use">Select|</asp:LinkButton><asp:LinkButton runat ="server" ID ="linkEdit" CommandName ="Edit">Edit</asp:LinkButton>|<asp:LinkButton runat ="server" ID ="linkDelete" CommandName ="Remove">Delete</asp:LinkButton></td>
                </tr>
            </ItemTemplate>
            
            <FooterTemplate>
                <td>
                </td>
                </tr> </table>
            </FooterTemplate>
        </asp:Repeater>
    </asp:View>
    <asp:View runat="server" ID="viewEmpty">
        <div style="width: 350ox; margin: 0 auto">
            <h3>
                There is no record in your address book.</h3>
        </div>
    </asp:View>
</asp:MultiView>
