<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false"
    CodeFile="Partnership.aspx.vb" Inherits="Partnership" Title="Untitled Page" %>

<%@ Register Src="~/WebUserControls/PartnershipForm.ascx" TagPrefix="wuc" TagName="Partnership" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Partnerships</h3>
    <asp:MultiView runat="server" ID="mvPartnership" ActiveViewIndex="0">
        <asp:View runat="server" ID="viewForm">
            <p>
                As a leading international supplier of pharmaceutical products, medical devices,
                and supplies, we always welcome new distribution partnerships with manufacturers
                and wholesalers to expand our product offerings. If you would like to explore distribution
                or partnership opportunities with Aapex Health Supplies, please complete and submit
                the form below.
            </p>
            <wuc:Partnership runat="server" ID="oForm" />
        </asp:View>
        <asp:View runat="server" ID="viewSuccess">
            <p>
                You partnership is submitted.</p>
        </asp:View>
    </asp:MultiView>
    <br />
</asp:Content>
