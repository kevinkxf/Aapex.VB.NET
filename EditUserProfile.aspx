<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false"
    CodeFile="EditUserProfile.aspx.vb" Inherits="EditUserProfile" Title="Update User Profile" %>

<%@ Register Src="~/WebUserControls/EditUserProfile.ascx" TagPrefix="wuc" TagName="EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">Edit User Profile</h3>
    <div class="center error" runat="server" id="divMessage" visible="false" style="height:30px">
        <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
    </div>
    <wuc:EditProfile runat="server" ID="oEditForm" Title="Edit Profile" />
</asp:Content>
