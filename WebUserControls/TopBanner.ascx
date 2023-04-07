<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TopBanner.ascx.vb" Inherits="WebUserControls_TopBanner" %>
<asp:MultiView runat="server" ID="mvBanner" ActiveViewIndex ="0">
    <asp:View runat ="server" >
        <div class="TopBanner">
            <a id="A1" href="~/howtoorder.html" runat="server">
                <asp:Image runat="server" SkinID="placeOrder" /></a> <a id="A2" runat="server"
                    href="~/contactus.html">
                    <asp:Image ID="Image1" runat="server" SkinID="talkToUs" /></a>
        </div>
    </asp:View>
    <asp:View runat ="server" >
        <div class="OrthopedicBanner">
        </div> 
    </asp:View>
    <asp:View ID="View1" runat ="server" >
        <div class="OncologyBanner">
        </div> 
    </asp:View>
    <asp:View ID="View2" runat ="server" >
        <div class="CosmeticBanner">
        </div> 
    </asp:View>
    <asp:View ID="View3" runat ="server" >
        <div class="BirthControlBanner">
        </div> 
    </asp:View>
</asp:MultiView>