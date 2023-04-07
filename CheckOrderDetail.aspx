<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false" CodeFile="CheckOrderDetail.aspx.vb" Inherits="CheckOrderDetail" title="Untitled Page" %>
<%@ Register Src ="~/WebUserControls/OrderDetail.ascx" TagPrefix ="wuc" TagName ="OrderDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage" Runat="Server">
    <wuc:OrderDetail runat ="server" ID ="oOrderDetail" />
</asp:Content>

