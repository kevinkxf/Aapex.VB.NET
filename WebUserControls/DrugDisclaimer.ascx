<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DrugDisclaimer.ascx.vb"
    Inherits="WebUserControls_DrugDisclaimer" %>
<asp:MultiView runat="server" ID="mvDrugMessage" ActiveViewIndex="0">
    <asp:View runat="server" ID="viewEmepty">
    </asp:View>
    <asp:View runat="server" ID="viewRestylane">
        <p>
            <!--RESTYLANE injections are used to treat facial wrinkles, folds and lip augmentations.
            RESTYLANE is an injection medication. RESTYLANE is a crystal-clear, biodegradable
            NASHA (Non-Animal Stabilized Hyaluronic Acid) gel, which is injected into the dermis
            in tiny amounts with a very fine needle. The result is instantaneous, producing
            a long-lasting, natural enhancement, gentle and safe to the skin.--></p>
        
    </asp:View>
</asp:MultiView>