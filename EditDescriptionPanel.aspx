<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false" CodeFile="EditDescriptionPanel.aspx.vb" Inherits="EditDescriptionPanel" title="Edit Drug Description" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage" Runat="Server">
<asp:Panel runat ="server" ID="pnEditPanel" DefaultButton ="btnSubmit">
    <table class="regular w100 f14">
        <tr>
            <th style="widows :150px">Drug Name</th>
            <td><asp:TextBox runat ="server" ID ="txtSKUID"></asp:TextBox></td>
        </tr>
        <tr>
            <th>Choose File: </th>
            <td><asp:FileUpload ID="oUploadFile" runat="server" /></td>
        </tr>
        <tr>
            <th>File Name</th>
            <td><asp:TextBox runat ="server" ID ="txtFileName"></asp:TextBox></td>
        </tr>
        <tr>
            <th>Vendor</th>
            <td><asp:TextBox runat ="server" ID ="txtVendor"></asp:TextBox></td>
        </tr>
        <tr>
            <th>Description:</th>
            <td><FCK:FCKeditor runat ="server" ID ="oEditor" BasePath="~/fckeditor/" ToolbarSet ="Default" Height ="600"></FCK:FCKeditor></td>
        </tr>       
        <tr><th colspan ="2"><asp:Button ID="btnSubmit" runat="server"
        Text="Submit" /></th></tr>
    </table>
</asp:Panel>
</asp:Content>

