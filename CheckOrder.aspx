<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false"
    CodeFile="CheckOrder.aspx.vb" Inherits="CheckOrder" Title="Check Order" %>

<%@ Register Src="~/WebUserControls/OrderList.ascx" TagPrefix="wuc" TagName="OrderList" %>
<%@ Register Src="~/WebUserControls/OrderDetail.ascx" TagPrefix="wuc" TagName="OrderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <asp:MultiView runat="server" ID="mvOrder" ActiveViewIndex="0">
        <asp:View runat="server" ID="viewList">
            <h3 class="title">
                Order History</h3>
            <p>
                To view a specific order, please click the Order ID.</p>
            <wuc:OrderList runat="server" ID="oOrderList" />
        </asp:View>
        <asp:View ID="viewDetail1" runat="server">
        <span><span><a id="A1" runat ="server"  href="~/default.html" title="Home Page">Home</a></span><span> > </span><span><a id="A2" runat ="server"  href="~/Myaccount.html" title="Manage your account">My Account</a></span><span> > </span><span>Order Detail</span></span>
            <h3 class="title">
                Order Detail</h3>
            <wuc:OrderDetail runat="server" ID="oOrderDetail" />
        </asp:View>
        <asp:View ID="viewUnauthorizedRequest" runat="server">
         <span><span><a id="A3" runat ="server"  href="~/default.html" title="Home Page">Home</a></span><span> > </span><span><a id="A4" runat ="server"  href="~/Myaccount.html" title="Manage your account">My Account</a></span><span> > </span><span>Order Detail</span></span>   
            <h3 class="title">
                Order Detail</h3>
            <h3>
                You are not authorized to see this order.</h3>
        </asp:View>
    </asp:MultiView>
</asp:Content>
