<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="Privacypolicy.aspx.vb" Inherits="Privacypolicy" Title="Privacy Policy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Privacy Policy</h3>
    <p>
        All information submitted to
        <%=Common.WebSetting.Setting.WebSiteName%>
        via the Internet, phone, fax or mail is held in the strictest confidence and will
        not be sold, shared or viewed by anyone other than the staff at <%=Common.WebSetting.Setting.CompanyName%>
        and the company's affiliated partners consisting of licensed physicians and pharmacies.
        This information will only be used for the purpose of processing, dispensing and
        delivering your orders.
    </p>
</asp:Content>
