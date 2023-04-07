<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="Cosmetic.aspx.vb" Inherits="Cosmetic" Title="Comsmetic Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Cosmetic Products</h3>
    <table width="400px" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <ul class="arrow">
                    <li>
                        <asp:HyperLink runat="server" ID="link1" NavigateUrl="~/Botox_Detail.html">Botox</asp:HyperLink></li>
                    <li>
                        <asp:HyperLink runat="server" ID="link2" NavigateUrl="~/Dysport_Detail.html">Dysport</asp:HyperLink>
                    </li>
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
                </ul>
            </td>
            <td valign="top">
                <ul class="arrow">
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
            </td>
        </tr>
    </table>
</asp:Content>
