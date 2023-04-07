<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false" CodeFile="Registration.aspx.vb" Inherits="Registration" title="Registration" %>
<%@ Register Src ="~/WebUserControls/UserProfileForm.ascx" TagPrefix ="wuc" TagName ="UserForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage" Runat="Server">
    <asp:multiview runat="server" ID="mvRegistration" ActiveViewIndex="0">
        <asp:view  runat="server" ID="view0">
            <h3 class="title">Create New Account</h3>
            <wuc:UserForm runat ="server" ID="oUserForm" Title="Registration" />
        </asp:view>
        <asp:view  runat="server" ID="view1">
            Good!
        </asp:view>
    </asp:multiview>
</asp:Content>

