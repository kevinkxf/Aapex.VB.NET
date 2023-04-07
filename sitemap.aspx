<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false" CodeFile="sitemap.aspx.vb" Inherits="sitemap" title="Site Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage" Runat="Server">
    <asp:TreeView ID="treeSiteMap" runat="server" DataSourceID ="SiteMapDataSource1" NodeWrap="False" ExpandDepth="1" ShowCheckBoxes="None">
    </asp:TreeView>
<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider/>
</asp:Content>

