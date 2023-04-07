<%@ Control Language="VB" AutoEventWireup="false" CodeFile="SearchBar.ascx.vb" Inherits="WebUserControls_SearchBar" %>

<script type="text/javascript">
    $(document).ready(function() {
        $("#<%=txtSearchDrug.ClientID %>").autocomplete(drugdata).focus(function(e) { if (this.value == 'Search drugs here') { this.value = ''; }; $(this).addClass("active"); }).blur(function(e) { if (this.value == '') { this.value = 'Search drugs here'; } $(this).removeClass("active"); });
    })
</script>

<asp:Panel ID="pnSearchBar" runat="server" DefaultButton="btnSearchBar">
    <table style="width:100%" class="SearchBarForm">
        <tr>
            <td>
                <asp:TextBox runat="server" CssClass="text" ID="txtSearchDrug" Width="300" EnableViewState="false">Search drugs here</asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="btnSearchBar" runat="server" SkinID="Header_Search_Button" />
            </td>
        </tr>
    </table>
</asp:Panel>
