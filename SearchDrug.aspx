<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false" CodeFile="SearchDrug.aspx.vb" Inherits="SearchDrug" title="Untitled Page" %>
<%@ Register Src ="~/WebUserControls/DrugRecommendation.ascx"TagPrefix ="wuc" TagName ="DrugList" %>
<%@ Register Src ="~/WebUserControls/SearchDrug.ascx" TagPrefix ="wuc" TagName ="SearchDrug" %>
<%@ Register Src ="~/WebUserControls/SearchBar.ascx" TagPrefix ="wuc" TagName ="SearchBar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage" Runat="Server">
    <h3 class="title">
       Find Drug</h3>
    <asp:MultiView ID="mvSearchDrug" runat="server" ActiveViewIndex ="1">
    <asp:View runat ="server" ID="viewResult">
        <p>Did you mean:</p>
        <wuc:DrugList runat ="server" ID ="oDrugs" />
        <p>Or you can search again below.</p>
        <wuc:SearchBar runat ="server" ID ="SearchBar1" />
    </asp:View>
    <asp:View runat ="server" ID="view1">
        <p>No matched result is found. Please try other key word again.</p>
        <wuc:SearchBar runat ="server" ID ="oBar" />
    </asp:View>
    <asp:View runat ="server" ID="viewSendBR">
        <div style="width :700px;margin:0 auto;">
            <h3>A bulk request is already sent to our customer represenatives via Email. You will be contacted within 48 hours.</h3>
            <wuc:SearchBar runat ="server" ID ="oSearchBar2" />
        </div>
    </asp:View>
    <asp:View runat ="server" >
        <p>
            <asp:label runat="server" ID="lblDrugName" CssClass="DrugName"></asp:label>
        </p>
        <wuc:SearchDrug runat ="server" ID ="oSearchDrug" />
    </asp:View>
</asp:MultiView>
</asp:Content>

