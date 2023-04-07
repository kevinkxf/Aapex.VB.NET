<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false"
    CodeFile="ShoppingCart.aspx.vb" Inherits="ShoppingCart" Title="Shopping Cart" %>

<%@ Register Src="~/WebUserControls/ShoppingCartForm.ascx" TagPrefix="wuc" TagName="ShoppingCartForm" %>
<%@ Register Src="~/WebUserControls/SearchBar.ascx" TagPrefix="wuc" TagName="SearchBar" %>
<%@ Register Src="~/WebUserControls/McAfeeSeal.ascx" TagPrefix="wuc" TagName="Seal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Shopping Cart</h3>
    <asp:MultiView runat="server" ID="mvShoppingCart">
        <asp:View runat="server" ID="viewShoppingCart">
            <asp:Label runat ="server" ID ="lblError" EnableViewState ="false" ></asp:Label>
            <wuc:ShoppingCartForm runat="server" ID="oShoppingCart" />
            <div class="sealincart"><asp:Image runat ="server" SkinID ="GeoTrust_Logo" /><wuc:Seal ID="Seal1" runat ="server" ActiveViewIndex ="1" /></div>
        </asp:View>
        <asp:View runat="server" ID="viewEmpty">
            <h4>
                Your shopping cart is currently empty.
            </h4>
            <h4>
                Search for your products below or call us toll-free at
                <%=Common.WebSetting.Setting.TollFreeTel%>
                for product inquiries with one of our Account Managers.</h4>
            <div style="width: 400px; margin: 0 auto;">
                <wuc:SearchBar runat="server" ID="oSearchBar" />
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
