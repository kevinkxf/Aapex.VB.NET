<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" Title="AAPEX Home Page" %>

<%@ Register Src="~/WebUserControls/CreditCardLogos.ascx" TagPrefix="wuc" TagName="CCLogo" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderInMasterPage" runat="server"
    ID="Content">
    <h3>
        Welcome to
        <%=Common.WebSetting.Setting.CompanyName%></h3>
    <p>
        <%=Common.WebSetting.Setting.CompanyName%>
        is a leading international supplier of popular Orthopedic, Cosmetic, and Birth Control
        products. We specialize in delivering high quality products at highly competitive
        prices to customers worldwide. Our clients include Orthopedic Surgeons, Cosmetic
        Surgeons, Sports-Medicine Providers, Dermatologists, Gynecologists, Hospitals, Wholesalers,
        and Medical Clinics. All of our products are manufactured in FDA approved facilities
        and are sourced directly from the original manufacturers. We also fully insure all
        of our shipments against loss or damage to ensure you receive the best possible
        service.
    </p>
    <p>
        For over 5 years,
        <%=Common.WebSetting.Setting.CompanyName%>
        has been helping healthcare professionals, medical clinics, and wholesalers worldwide
        reduce their costs by supplying them with high quality medical supplies at highly
        affordable prices. We stand by the quality of all of our products and always guarantee
        the lowest possible prices. Our world-class customer support center is staffed by
        well-trained highly knowledgeable Account Managers and licensed pharmacists who
        are ready to answer your questions and assist you with the ordering process. To
        ensure you always get the lowest possible price, we also offer a price beat policy
        and will beat all competitor prices.
    </p>
    <p>
        We invite you to contact us today to begin saving on a wide range of popular Orthopedic,
        Cosmetic, and Birth Control products. As an established distributor of medical supplies,
        we also have access to a very wide range of medical products and supplies that may
        not be listed on this website. If you cannot find a product on our website, please
        feel free to contact us and will see if we can source this product for you.</p>
    <div class="thumbicon">
        <asp:HyperLink runat="server" ID="link1" NavigateUrl="~/Orthopedic.html">
            <asp:Image runat="server" ID="image1" SkinID="Orthopedic_Icon" /></asp:HyperLink>
        <asp:HyperLink runat="server" ID="link3" NavigateUrl="~/Cosmetic.html">
            <asp:Image runat="server" ID="image3" SkinID="Cosmetic_Icon" /></asp:HyperLink>
        <asp:HyperLink runat="server" ID="link4" NavigateUrl="~/Birthcontrol.html">
            <asp:Image runat="server" ID="image4" SkinID="BirthControl_Icon" /></asp:HyperLink>
    </div>
    
</asp:Content>
