<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false"
    CodeFile="ForgetPassword.aspx.vb" Inherits="ForgetPassword" Title="Untitled Page" %>

<%@ Register Src="~/WebUserControls/ForgetPasswordForm.ascx" TagPrefix="wuc" TagName="ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View0" runat="server">
            <wuc:ForgetPassword runat="server" ID="oForm" />
        </asp:View>
        <asp:View ID="View1" runat="server">
            <h4>
                Your Username/Password is already sent to your email box.</h4>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <h4>
                We can not find any Username/Password based on the information you entered.</h4>
        </asp:View>
    </asp:MultiView>
</asp:Content>
