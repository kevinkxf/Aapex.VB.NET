<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="birthcontrol.aspx.vb" Inherits="birthcontrol" Title="Birth Control Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">Birth Control Products</h3>
    <ul class="arrow">
        <li><asp:HyperLink runat ="server" ID ="link1" NavigateUrl ="~/Mirena_Detail.html">Mirena</asp:HyperLink></li>
        <li><asp:HyperLink runat ="server" ID ="HyperLink1" NavigateUrl ="~/Paragard_Detail.html">Paragard</asp:HyperLink></li>
        <li><asp:HyperLink runat ="server" ID ="HyperLink2" NavigateUrl ="~/Implanon_Detail.html">Implanon</asp:HyperLink></li>
    </ul>
</asp:Content>
