<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="Orthopedic.aspx.vb" Inherits="Orthopedic" Title="Orthopedic Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Orthopedic Products</h3>
    <table width="400px" cellpadding="0" cellspacing="0">
        <tr>
            <td>
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
                </ul>
            </td>
            <td>
                <ul class="arrow">
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
        </tr>
    </table>
</asp:Content>
