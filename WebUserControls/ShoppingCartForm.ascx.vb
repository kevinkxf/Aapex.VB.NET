Imports QSLib.Entities
Imports QSLib.Providers.LogProvider

Partial Class WebUserControls_ShoppingCartForm
    Inherits System.Web.UI.UserControl

    Public Event OnDeleteItemClicked(ByVal intDrugID As Integer)
    Public Event OnUpdateShoppingCartClicked(ByVal intDrugID As Integer, ByVal intQTYOrdered As Integer)
    Public Event OnEmptyShoppingCartClicked()
    Public Event OnCheckOutClicked()

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

#Region "Event Handlers"

    Protected Sub btnCheckOut_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCheckOut.Click
        If Page.IsValid Then
            'Update Shopping Cart First
            For Each item As RepeaterItem In Me.rpShoppingCart.Items
                Dim strNow As String = CType(item.FindControl("txtQTYOrdered"), TextBox).Text
                Dim strPrevious As String = CType(item.FindControl("hfQTYOrdered"), HiddenField).Value
                Dim intNow As Integer
                Dim intPrevious As Integer
                Dim intID As Integer
                If Integer.TryParse(CType(item.FindControl("txtQTYOrdered"), TextBox).Text, intNow) _
                            AndAlso Integer.TryParse(CType(item.FindControl("hfQTYOrdered"), HiddenField).Value, intPrevious) _
                            AndAlso Integer.TryParse(CType(item.FindControl("hfDrugID"), HiddenField).Value, intID) _
                            AndAlso intPrevious <> intNow Then
                    RaiseEvent OnUpdateShoppingCartClicked(intID, intNow)
                End If
            Next
            'Then Checkout
            RaiseEvent OnCheckOutClicked()
        End If
    End Sub

    Protected Sub btnEmptyCart_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnEmptyCart.Click
        RaiseEvent OnEmptyShoppingCartClicked()
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnUpdate.Click
        If Page.IsValid Then
            For Each item As RepeaterItem In Me.rpShoppingCart.Items
                Dim strNow As String = CType(item.FindControl("txtQTYOrdered"), TextBox).Text
                Dim strPrevious As String = CType(item.FindControl("hfQTYOrdered"), HiddenField).Value
                Dim intNow As Integer
                Dim intPrevious As Integer
                Dim intID As Integer
                If Integer.TryParse(CType(item.FindControl("txtQTYOrdered"), TextBox).Text, intNow) _
                            AndAlso Integer.TryParse(CType(item.FindControl("hfQTYOrdered"), HiddenField).Value, intPrevious) _
                            AndAlso Integer.TryParse(CType(item.FindControl("hfDrugID"), HiddenField).Value, intID) _
                            AndAlso intPrevious <> intNow Then
                    RaiseEvent OnUpdateShoppingCartClicked(intID, intNow)
                End If
            Next
        End If
    End Sub

    Protected Sub rpShoppingCart_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpShoppingCart.ItemCommand
        If e.CommandName = "RemoveItem" Then
            Dim intDrugID As Integer
            If Integer.TryParse(e.CommandArgument, intDrugID) Then
                RaiseEvent OnDeleteItemClicked(intDrugID)
            End If
        End If
    End Sub


    Protected Sub rpShoppingCart_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpShoppingCart.ItemDataBound
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Try
                Dim oItem As Orders.ShoppingCartItemInfo = e.Item.DataItem
                Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, oItem.DrugID)
                CType(e.Item.FindControl("lblName"), Literal).Text = String.Format("{0} {1} {2}", oDrug.Name, oDrug.Quantity, oDrug.Strength)
                'CType(e.Item.FindControl("lblStrength"), Literal).Text = oDrug.Strength
                'CType(e.Item.FindControl("lblQuantity"), Literal).Text = oDrug.Quantity
                CType(e.Item.FindControl("txtQTYOrdered"), TextBox).Text = oItem.QTYOrdered
                CType(e.Item.FindControl("hfQTYOrdered"), HiddenField).Value = oItem.QTYOrdered
                CType(e.Item.FindControl("hfDrugID"), HiddenField).Value = oItem.DrugID
                Dim fPrice As Decimal = Common.Utilies.GetPriceMatchedPrice(oDrug.Price, oItem.PriceBeat, oItem.URL)
                Dim fPriceTotal As Decimal = fPrice * oItem.QTYOrdered
                CType(e.Item.FindControl("lblPrice"), Literal).Text = String.Format("{0:c}", fPrice)
                CType(e.Item.FindControl("lblTotal"), Literal).Text = String.Format("{0:c}", fPriceTotal)
                Dim oButton As ImageButton = CType(e.Item.FindControl("btnDelete"), ImageButton)
                oButton.CommandArgument = oItem.DrugID
                oButton.CommandName = "RemoveItem"
                Dim oV As RangeValidator = e.Item.FindControl("rangeQTY")
                oV.MinimumValue = IIf(oDrug.MinimumQuantity < 1, 1, oDrug.MinimumQuantity)
                oV.MaximumValue = Integer.MaxValue
                oV.ErrorMessage = String.Format("The minimum quantity of {0} you can order is {1}", oDrug.Name, oV.MinimumValue)
                Me.fTotal += fPriceTotal
            Catch ex As Exception
                e.Item.Visible = False
                LoggerManager.LogError("ShoppingCartForm.ascx||" & ex.Message)
            End Try
        ElseIf e.Item.ItemType = ListItemType.Footer Then
            Try
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
            Catch ex As Exception

            End Try
        End If

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oItems Is Nothing AndAlso Me.oItems.Count > 0 Then
            Me.rpShoppingCart.DataSource = Me.oItems
            Me.fTotal = 0
            Me.fDiscount = 0
            Me.rpShoppingCart.DataBind()
        End If
    End Sub
#End Region

    
End Class
