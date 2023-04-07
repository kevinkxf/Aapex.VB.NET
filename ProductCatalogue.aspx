<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="ProductCatalogue.aspx.vb" Inherits="ProductCatelogue" Title="Product Catelog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <table width="400px" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" class="w50">
                <h3 class="title">Orthopedic Products</h3>
                <ul class="arrow">
                    <li>
                        <asp:HyperLink runat="server" ID="Synvisc" NavigateUrl="~/Synvisc_Detail.html">Synvisc</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Hyalgan" NavigateUrl="~/Hyalgan_Detail.html">Hyalgan</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Orthovisc" NavigateUrl="~/Orthovisc_Detail.html">Orthovisc</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Supartz" NavigateUrl="~/Supartz_Detail.html">Supartz</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Euflexxa" NavigateUrl="~/Euflexxa_Detail.html">Euflexxa</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Durolane" NavigateUrl="~/Durolane_Detail.html">Durolane</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Suplasyn" NavigateUrl="~/Suplasyn_Detail.html">Suplasyn</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Neovisc" NavigateUrl="~/Neovisc_Detail.html">Neovisc</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Ostenil" NavigateUrl="~/Ostenil_Detail.html">Ostenil</asp:HyperLink></li>
                    
                </ul>
            </td>
            <td class="w50">
                <h3 class="title">
                    Cosmetic Products</h3>
                <ul class="arrow">
                    <li>
                        <asp:HyperLink runat="server" ID="link1" NavigateUrl="~/Botox_Detail.html">Botox</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="link2" NavigateUrl="~/Dysport_Detail.html">Dysport</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Reloxin" NavigateUrl="~/Reloxin_Detail.html">Reloxin</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="link3" NavigateUrl="~/Restylane_Detail.html">Restylane</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Perlane" NavigateUrl="~/Perlane_Detail.html">Perlane</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Juvederm" NavigateUrl="~/Juvederm_Detail.html">Juvederm</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Radiesse" NavigateUrl="~/Radiesse_Detail.html">Radiesse</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Sculptra" NavigateUrl="~/Sculptra_Detail.html">Sculptra</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Surgiderm" NavigateUrl="~/Surgiderm_Detail.html">Surgiderm</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Anthelios" NavigateUrl="~/Anthelios_Detail.html">Anthelios</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Emla" NavigateUrl="~/Emla_Detail.html">Emla</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Lustra" NavigateUrl="~/Lustra_Detail.html">Lustra</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Ombrelle" NavigateUrl="~/Ombrelle_Detail.html">Ombrelle</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="StriVectin" NavigateUrl="~/StriVectin_Detail.html">StriVectin</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Kinerase" NavigateUrl="~/Kinerase_Detail.html">Kinerase</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="Hylexin" NavigateUrl="~/Hylexin_Detail.html">Hylexin</asp:HyperLink></li>
                </ul>
                <h3 class="title">
                    Birth Control Products</h3>
                <ul class="arrow">
                    <li>
                        <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl="~/Mirena_Detail.html">Mirena</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="HyperLink2" NavigateUrl="~/Paragard_Detail.html">Paragard</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="HyperLink3" NavigateUrl="~/Implanon_Detail.html">Implanon</asp:HyperLink></li>
                </ul>
            </td>
        </tr>
    </table>
</asp:Content>
