<%@ Control Language="VB" AutoEventWireup="false" CodeFile="McAfeeSeal.ascx.vb" Inherits="WebUserControls_McAfeeSeal" %>
<asp:MultiView runat="server" ActiveViewIndex="0" ID="mvSeal">
    <asp:View runat="server">
        <!--
	<a href="https://www.mcafeesecure.com/RatingVerify?ref=www.canadadrugcenter.com"
            target="_blank">
            <img width="94" height="54" border="0" oncontextmenu="alert('Copying Prohibited by Law - McAfee Secure is a Trademark of McAfee, Inc.'); return false;"
                alt="McAfee Secure sites help keep you safe from identity theft, credit card fraud, spyware, spam, viruses and online scams"
                src="//images.scanalert.com/meter/www.canadadrugcenter.com/13.gif" /></a>-->
    </asp:View>
    <asp:View ID="View1" runat="server">
        <!--
	<a target="_blank" href="https://www.mcafeesecure.com/RatingVerify?ref=www.canadadrugcenter.com">
            <img width="65" height="37" border="0" src="//images.scanalert.com/meter/www.canadadrugcenter.com/63.gif"
                alt="McAfee Secure sites help keep you safe from identity theft, credit card fraud, spyware, spam, viruses and online scams"
                oncontextmenu="alert('Copying Prohibited by Law - McAfee Secure is a Trademark of McAfee, Inc.'); return false;" /></a>-->
    </asp:View>
    <asp:View ID="View2" runat="server">
    </asp:View>
</asp:MultiView>