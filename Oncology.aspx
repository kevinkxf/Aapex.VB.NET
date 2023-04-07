<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="Oncology.aspx.vb" Inherits="Oncology" Title="Oncology Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
       Oncology Products</h3>
    <p>
        We carry a wide range of quality oncology products with highly competitive pricing.
        For more information about our products and special bulk pricing, please contact
        us toll-free at
        <%=Common.WebSetting.Setting.TollFreeTel%>.
    </p>
</asp:Content>
