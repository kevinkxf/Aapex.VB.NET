<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="AboutUs.aspx.vb" Inherits="AboutUs" Title="About Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        About Us</h3>
    <p>
        <%=Common.WebSetting.Setting.CompanyName%>
        is a leading international supplier of popular Orthopedic, Cosmetic, and Birth Control
        products. We specialize in delivering high quality products at highly competitive
        prices to customers worlwide. Headed by a team of Pharmacists with over 50 years
        of combined experience in the pharmaceutical industry, our mission is to help our
        clients save money by supplying them with high quality medical supplies at highly
        competitive prices. Due to our purchasing power and strong supplier relationships,
        we are able to pass on significant savings directly to our clients. Our clients
        include Orthopedic Surgeons, Cosmetic Surgeons, Sports-Medicine Providers, Dermatologists,
        Gynecologists, Hospitals, Wholesalers, and Medical Clinics.
    </p>
    <p>
        At
        <%=Common.WebSetting.Setting.CompanyName%>, we believe in building strong long-lasting
        relationships with all our clients. To this end, we offer a world-class customer
        support center that is staffed by well-trained highly knowledgeable Account Managers
        to help answer all of your questions and to assist you with all your medical supply
        needs. With facilities located in North America and Europe, we are confident we
        can meet all your medical supply needs anywhere in the world. We guarantee you will
        receive exceptional service, high quality products, and the lowest prices possible.
        Our Price Beat Policy is added reassurance that you will always have the lowest
        prices on all your orders. Moreove, we will be competitor prices so that you
        don't have to shop anywhere else.
    </p>
    <p>
        We invite you to call us today at
        <%=Common.WebSetting.Setting.TollFreeTel%>
        to begin saving on a wide range of popular Orthopedic, Cosmetic, and Birth Control
        products. As an established distributor of medical supplies, we also have access
        to a very wide range of medical products and supplies that may not be listed on
        this website. If you cannot find a product on our website, please feel free to contact
        us and will see if we can source this product for you.
    </p>
</asp:Content>
