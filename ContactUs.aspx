<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="ContactUs.aspx.vb" Inherits="ContactUs" Title="Contact Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        Contact Us</h3>
    <table cellpadding="4">
        <tr>
            <td>
                <table width="100%" cellspacing="5" cellpadding="5" border="0">
                    <tr>
                        <td align="center" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Toll-Free Telephone:</b>
                        </td>
                        <td>
                            <%=Common.WebSetting.Setting.TollFreeTel%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>24-Hr Toll-Free Fax:</b>
                        </td>
                        <td>
                            <%=Common.WebSetting.Setting.TollFreeFax%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>Email</b>
                        </td>
                        <td>
                            <a href='mailto:<%=Common.WebSetting.Setting.ContactEmail %>'>
                                <%=Common.WebSetting.Setting.ContactEmail %></a>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" colspan="2">
                            <strong>Hours of Operation:</strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%=Common.WebSetting.Setting("HoursOfOperations")%>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" colspan="2">
                            <strong>Mailing Address</strong>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%=Common.WebSetting.Setting.WebSiteName%><br />
                            PO Box 35546
                            <br />
                            Bridgeport RPO
                            <br />
                            Richmond, BC
                            <br />
                            Canada V6X 4G6
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
