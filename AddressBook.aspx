<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false"
    CodeFile="AddressBook.aspx.vb" Inherits="AddressBook" Title="Address Book" %>

<%@ Register Src="~/WebUserControls/AddressForm.ascx" TagPrefix="wuc" TagName="AddressForm" %>
<%@ Register Src="~/WebUserControls/AddressList.ascx" TagPrefix="wuc" TagName="AddressList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Address Book</h3>
    <asp:MultiView ID="mvAddressBook" runat="server" ActiveViewIndex="0">
        <asp:View runat="server" ID="viewAddress">
            <wuc:AddressList runat="server" ID="oAddressList" HideSelectButton="true" />
            <wuc:AddressForm runat="server" ID="oAddressForm" Title="Add Address" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
