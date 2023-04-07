<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DrugMessage.ascx.vb"
    Inherits="WebUserControls_DrugMessage" %>
    <br />
    <br />
<div class="drugmessage">
    <asp:MultiView runat="server" ID="mvDrugMessage" ActiveViewIndex="0">
        <asp:View runat="server" ID="viewEmepty">
        </asp:View>
        <asp:View runat="server" ID="viewBotox">
            <p>
                <%=Common.WebSetting.Setting.CompanyName%>
                (AHS) sells only genuine Botox and Juvederm from Europe which is manufactured by
                Allergan, Inc. This offer does not originate from and is not authorized by Allergan,
                Inc., the distributor of Botox and Juvederm products. Botox and Juvederm are the
                registered trademarks of Allergan, Inc. and AHS is not in any way affiliated with
                Allergan, Inc.
            </p>
        </asp:View>
        <asp:View runat="server" ID="viewDysport">
            <p>
                <%=Common.WebSetting.Setting.CompanyName%>
                (AHS) sell only genuine Dysport products from Europe that are manufactured by Ipsen
                Ltd. of Paris, France. These products do not originate from Medicis Pharmaceutical
                Corp. or Medicis Aesthetics Corp. and are not authorized by Medicis Pharmaceutical
                Corp. or Medicis Aesthetics Corp., the United States and Canadian distributor of
                Dysport products.
            </p>
        </asp:View>
        <asp:View runat="server" ID="view1">
            <p>
                All Injections must be injected by a practitioner who has medical and specialist
                training. The practitioner must be medically qualified.
            </p>
            <p>
                <%=Common.WebSetting.Setting.CompanyName%>
                (AHS) sell only genuine Restylane and Perlane products from Europe that are manufactured
                by Q-Med AB of Uppsala, Sweden. These products do not originate from Medicis Aesthetics
                Corp. and are not authorized by Medicis Aesthetics Corp., the United States and
                Canadian distributor of Restylane and Perlane products.
            </p>
        </asp:View>
    </asp:MultiView>
</div>
