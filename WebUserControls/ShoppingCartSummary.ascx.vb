Imports QSLib.Entities
Imports QSLib.Providers.LogProvider

Partial Class WebUserControls_ShoppingCartSummary
    Inherits System.Web.UI.UserControl

    Private oItems As Orders.ShoppingCartItemCollection
    Private fTotal As Decimal
    Private fDiscount As Decimal
    Private fShippingFee As Decimal = Common.WebSetting.Setting.DefaultShippingFee

#Region "Properties"
    Public Property ShoppingCartItemDataSource() As Orders.ShoppingCartItemCollection
        Get
            Return Me.oItems
        End Get
        Set(ByVal value As Orders.ShoppingCartItemCollection)
            Me.oItems = value
        End Set
    End Property
#End Region

#Region "Events Handlers"
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oItems Is Nothing AndAlso Me.oItems.Count > 0 Then
            Me.rpShoppingCartSummary.DataSource = Me.oItems
            Me.rpShoppingCartSummary.DataBind()
        End If
    End Sub

    Protected Sub rpShoppingCartSummary_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpShoppingCartSummary.ItemDataBound
        Try
            If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
                Dim oItem As Orders.ShoppingCartItemInfo = e.Item.DataItem
                Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, oItem.DrugID)
                CType(e.Item.FindControl("lblName"), Literal).Text = String.Format("{0} {1} {2}", oDrug.Name, oDrug.Quantity, oDrug.Strength)
                'CType(e.Item.FindControl("lblStrength"), Literal).Text = oDrug.Strength
                'CType(e.Item.FindControl("lblQuantity"), Literal).Text = oDrug.Quantity
                CType(e.Item.FindControl("lblQTYOrdered"), Literal).Text = oItem.QTYOrdered
                Dim fPrice As Decimal = Common.Utilies.GetPriceMatchedPrice(oDrug.Price, oItem.PriceBeat, oItem.URL)
                Dim fPriceTotal As Decimal = fPrice * oItem.QTYOrdered
                CType(e.Item.FindControl("lblPrice"), Literal).Text = String.Format("{0:c}", fPrice)
                CType(e.Item.FindControl("lblTotal"), Literal).Text = String.Format("{0:c}", fPriceTotal)
                Me.fTotal += fPriceTotal
            ElseIf e.Item.ItemType = ListItemType.Footer Then
                CType(e.Item.FindControl("lblSubtotal"), Literal).Text = String.Format("{0:c}", Me.fTotal)
                CType(e.Item.FindControl("lblShippingFee"), Literal).Text = String.Format("{0:c}", Me.fShippingFee)

                'Check Discount
                If fDiscount = 0 Then
                    CType(e.Item.FindControl("trDiscount"), HtmlTableRow).Visible = False
                Else
                    CType(e.Item.FindControl("trDiscount"), HtmlTableRow).Visible = True
                    CType(e.Item.FindControl("lblDiscount"), Literal).Text = String.Format("{0:c}", Me.fDiscount)
                End If
                CType(e.Item.FindControl("lblTotal"), Literal).Text = String.Format("{0:c}", Me.fTotal + Me.fShippingFee - Me.fDiscount)
            End If
        Catch ex As Exception
            e.Item.Visible = False
            LoggerManager.LogError("ShoppingCartSummaryl.ascx||" & ex.Message)
        End Try
    End Sub
#End Region


End Class
