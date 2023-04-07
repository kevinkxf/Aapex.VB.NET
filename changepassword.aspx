<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="changepassword.aspx.vb" Inherits="changepassword" Title="Change Password" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<%@ Register Src ="~/WebUserControls/ChangePasswordForm.ascx" TagPrefix="wuc" TagName="ChangePasswordForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Change Password</h3>
    <asp:MultiView runat="server" ID="mvUpdatePassword" ActiveViewIndex="0">
        <asp:View runat ="server" ID ="viewForm">
            <wuc:ChangePasswordForm runat ="server" ID ="oPasswordForm" />
        </asp:View>
        <asp:View runat ="server" ID ="view1">
            <h3>Your password is changed.</h3>
        </asp:View> 
    </asp:MultiView>
</asp:Content>
