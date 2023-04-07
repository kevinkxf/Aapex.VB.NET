<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="HowToOrder.aspx.vb" Inherits="HowToOrder" Title="How To Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        How To Order</h3>
    <p>
        There are two easy and quick ways to place your order:</p>
    <p>
        <span class="blue bold">Option A: Ordering Online</span></p>
    <ol>
        <li>Simply locate the product you want to order using our drug search tool</li>
        <li>Add the item to your shopping cart</li>
        <li>Proceed to the Checkout and complete the forms that follow. If you are a New Customer
            who has never ordered through this site before, you will need to create an account.
            If you are an Existing Customer, you will need to sign-in using your username and
            password.</li>
        <li>Once you've completed the Checkout process, you'll be given an order ID to confirm
            that your order has been placed.</li>
    </ol>
    <p>
        <span class="blue bold">Option B: Ordering by Phone</span></p>
    <p>
        Call us toll-free at
        <%=Common.WebSetting.Setting.TollFreeTel%>
        and one of our Account Managers would be happy to help you place your order.</p>
</asp:Content>
