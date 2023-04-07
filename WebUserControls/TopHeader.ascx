<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TopHeader.ascx.vb" Inherits="WebUserControls_TopHeader" %>
<%@ Register Src="~/WebUserControls/LoginStatus.ascx" TagPrefix="wuc" TagName="LoginStatus" %>

<script type="text/javascript">
    $(document).ready(function() { $("#<%=txtSearchDrug.ClientID %>").autocomplete(drugdata).focus(function(e) { if (this.value == 'Search drugs here') { this.value = ''; }; $(this).addClass("active"); }).blur(function(e) { if (this.value == '') { this.value = 'Search drugs here'; } $(this).removeClass("active"); }) })
</script>

<table style="width: 100%" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width: 170px">
            <a id="A1" runat="server" href="~/">
                <asp:Image SkinID="TopLogo" runat="server" ID="imgLogo" /></a>
        </td>
        <td>
            <asp:Panel runat="server" ID="panelTopBarSearch" DefaultButton="btnHeaderSearch">
                <table class="topsearchbar SearchBarForm">
                    <tr>
                        <td colspan="2" class="right">
                            <wuc:LoginStatus ID="LoginStatus1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" CssClass="text" ID="txtSearchDrug" EnableViewState ="false" >Search drugs here</asp:TextBox>
                        </td>
                        <td>
                            <asp:ImageButton ID="btnHeaderSearch" runat="server" SkinID="Header_Search_Button" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>
