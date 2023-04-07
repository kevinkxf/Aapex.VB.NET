<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LoginStatus.ascx.vb" Inherits="WebUserControls_LoginStatus" %>
<asp:MultiView runat ="server" ID ="mvLoginStatus" ActiveViewIndex ="0">
    <asp:View runat ="server" ID ="viewAnonymous">
        <asp:HyperLink runat ="server" NavigateUrl ="~/Signin.html" ID ="hlLogin">Login</asp:HyperLink>
    </asp:View>
    <asp:View runat ="server" ID ="viewAuthenticated">
        <asp:HyperLink ID="lblUsername" runat ="server" NavigateUrl ="~/myaccount.html">Welcome </asp:HyperLink> </asp:Label>&nbsp;|&nbsp;<asp:HyperLink ID="hlLogout" runat ="server" NavigateUrl ="~/Signout.html">Logout</asp:HyperLink>
    </asp:View>
</asp:MultiView>
