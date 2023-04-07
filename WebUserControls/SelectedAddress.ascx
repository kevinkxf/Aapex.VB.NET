<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SelectedAddress.ascx.vb"
    Inherits="WebUserControls_SelectedAddress" %>
<table class="new w100 left" cellpadding="5">
    <tr>
        <th>
            <asp:Literal runat="server" ID="lblTitle"></asp:Literal>
        </th>
    </tr>
    <tr>
        <td>
            <asp:Literal runat="server" ID="lblStreet1"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td >
            <asp:Literal runat="server" ID="lblCity"></asp:Literal>
        </td>
    </tr>
    <tr>
        <td>
           <asp:Literal runat="server" ID="lblCountry"></asp:Literal>
        </td>
    </tr>
    <tr runat="server" id="trButton">
        <td colspan="2" class="center">
            <asp:ImageButton runat="server" ID="btnChange" SkinID="Change Address" />
        </td>
    </tr>
    <tr runat="server" id="trLink">
        <td colspan="2">
            <asp:LinkButton runat ="server" ID ="linkChange"></asp:LinkButton>
        </td>
    </tr>
</table>
