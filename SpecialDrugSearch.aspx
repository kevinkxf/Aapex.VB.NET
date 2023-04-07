<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false" CodeFile="SpecialDrugSearch.aspx.vb" Inherits="SpecialDrugSearch" title="Untitled Page" %>
<%@ Register Src ="~/WebUserControls/SpecialDrugSearch.ascx" TagPrefix ="wuc" TagName ="SpecialDrugSearch" %>
<%@ Register Src ="~/WebUserControls/DrugMessage.ascx" TagPrefix="wuc" TagName ="DrugMessage" %>
<%@ Register Src ="~/WebUserControls/DrugDisclaimer.ascx" TagPrefix="wuc" TagName ="DrugDisclaimer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage" Runat="Server">
    <asp:MultiView runat ="server" ID ="mvSpecialSearch" ActiveViewIndex ="0">
        <asp:View runat ="server" ID ="viewResult">
            <img src="App_Themes/default/images/add.jpg" style ="vertical-align:text-bottom;" />
            <asp:Label runat="server" ID="lblName" class="drugname"></asp:Label>
            <wuc:SpecialDrugSearch runat ="server" ID ="oSpecialDrugSearch" />
            <wuc:DrugDisclaimer runat ="server" ID ="oDisclaimer" />
            <wuc:DrugMessage runat ="server" ID ="oDrugMessage" />
        </td>
        </asp:View>
        <asp:View runat ="server" ID ="viewEmail">
            <div style="width:300px; margin :0 auto">
                <h3>
                    Your bulk request is already sent to our customer represenatives via Email. You will be contacted within 48 hours.
                </h3>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

