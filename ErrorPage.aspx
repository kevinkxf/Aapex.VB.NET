<%@ Page Language="VB" MasterPageFile="~/MasterPage_2.master" AutoEventWireup="false" CodeFile="ErrorPage.aspx.vb" Inherits="ErrorPage" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage" Runat="Server">

        lblExceptionURL:<asp:Label ID="lblExceptionURL" runat ="server" ></asp:Label>
        lblExceptionMethodName:<asp:Label ID="lblExceptionMethodName" runat ="server" ></asp:Label>
        lblExceptionMessage:<asp:Label ID="lblExceptionMessage" runat ="server" ></asp:Label>
        lblExceptionTrackMessage:<asp:Label ID="lblExceptionTrackMessage" runat ="server" ></asp:Label>
</asp:Content>

