<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false"
    CodeFile="Term.aspx.vb" Inherits="Term" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <a name="Term"></a>
    <h3 class="title">
        Terms of Use</h3>
    <p>
        The
        <%=Common.WebSetting.Setting.WebSiteName%>
        Internet Site, an online management and administration service, can be accessed
        from all provinces and territories of Canada, as well as from other countries around
        the world. As each of these jurisdictions have laws that may differ, by accessing
        the Internet Site, the user agrees that all matters relating to, access to, or use
        of, the Internet Site, or any other hyperlinked web site, shall be governed by the
        federal laws of Canada applicable therein. The user also agrees and hereby submits
        to the exclusive personal jurisdiction and venue of the courts of Canada and acknowledges
        that the user does so voluntarily and is responsible for complying with his/her
        own local laws. Furthermore, we make no representation that the Content in the Site
        is appropriate or available for use in other locations, and access to them from
        territories where their content is illegal is prohibited. Those who choose to access
        the Site from other locations do so on their own initiative and are responsible
        for compliance with applicable local laws.</p>
    <a name="Disclaimer"></a>
    <h3 class="title">
        Disclaimer</h3>
    <p>
        The
        <%=Common.WebSetting.Setting.WebSiteName%>
        website is intended to increase awareness of health information and does not in
        any way, direct or indirect, express or implied, suggest diagnosis or treatment
        of any kind. The information provided on this website is not a substitute for professional
        medical attention. See your health care professional for medical advice or treatment.
    </p>
    <p>
        <%=Common.WebSetting.Setting.WebSiteName%>
        and its partnered pharmacy disclaims all representations and warranties, including
        for example warranties of merchantability, suitability, and fitness for a particular
        purpose. Moreover,
        <%=Common.WebSetting.Setting.WebSiteName%>
        and its partnered pharmacy do not represent or warrant that the information accessible
        via this website is accurate, complete or current. Price and availability information
        is subject to change without notice. Except as specifically stated on this website,
        neither
        <%=Common.WebSetting.Setting.WebSiteName%>
        nor its partnered pharmacy nor any of its directors, officers, employees, agents,
        contractors, partners or other representatives will be liable for damages resulting
        from or in connection with the use of this website. This is a comprehensive limitation
        of liability that applies to all damages of any kind, including (without limitation)
        compensatory, direct, indirect or consequential damages, loss of data, income or
        profit, loss of or damage to property and claims of third parties.</p>
</asp:Content>
