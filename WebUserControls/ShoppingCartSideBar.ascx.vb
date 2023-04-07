Imports QSLib.Entities
Partial Class WebUserControls_ShoppingCartSideBar
    Inherits System.Web.UI.UserControl

    Private fTotal As Decimal
    Private fDiscount As Decimal
    Private fShippingFee As Decimal = Common.WebSetting.Setting.DefaultShippingFee

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        fTotal = 0
        fDiscount = 0
        Dim oItems As Orders.ShoppingCartItemCollection = Orders.ShoppingCartItemController.GetShoppingCartByPatientID(GetShoppingCartID(), Common.WebSetting.Setting.AffiliateID)
        If oItems.Count = 0 Then
            Me.mvSideBar.ActiveViewIndex = 1
        Else
            Me.mvSideBar.ActiveViewIndex = 0
            Me.rpShoppingCart.DataSource = oItems
            Me.rpShoppingCart.DataBind()
        End If
        
    End Sub

    Private Function GetShoppingCartID() As Integer
        Dim intID As Integer = 0
        If My.User.IsAuthenticated Then
            Try
                intID = Session("PatientID")
            Catch ex As Exception

            End Try

        Else
            Try
                intID = Integer.Parse(Request.Cookies("ShoppingCartID").Value)
            Catch ex As Exception

            End Try
        End If
        Return intID
    End Function

    Protected Sub rpShoppingCart_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpShoppingCart.ItemDataBound
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Try
                Dim oItem As Orders.ShoppingCartItemInfo = CType(e.Item.DataItem, Orders.ShoppingCartItemInfo)
                Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, oItem.DrugID)
                CType(e.Item.FindControl("lblName"), Label).Text = oDrug.Name
                CType(e.Item.FindControl("lblQTYOrdered"), Label).Text = oItem.QTYOrdered
                Dim fprice As Decimal = Common.Utilies.GetPriceMatchedPrice(oDrug.Price, oItem.PriceBeat, oItem.URL)
                Dim fPriceTotal As Decimal = fprice * oItem.QTYOrdered
                CType(e.Item.FindControl("lblPrice"), Label).Text = String.Format("{0:c}", fPriceTotal)
                Me.fTotal += fPriceTotal
            Catch ex As Exception
                e.Item.Visible = False
            End Try
        ElseIf e.Item.ItemType = ListItemType.Footer Then
            Try
                CType(e.Item.FindControl("lblSubtotal"), Label).Text = String.Format("{0:c}", Me.fTotal)
                CType(e.Item.FindControl("lblShippingFee"), Label).Text = String.Format("{0:c}", Me.fShippingFee)

                'Check Discount
                If fDiscount = 0 Then
                    CType(e.Item.FindControl("trDiscount"), HtmlTableRow).Visible = False
                Else
                    CType(e.Item.FindControl("trDiscount"), HtmlTableRow).Visible = True
                    CType(e.Item.FindControl("lblDiscount"), Label).Text = String.Format("{0:c}", Me.fDiscount)
                End If
                CType(e.Item.FindControl("lblTotal"), Label).Text = String.Format("{0:c}", Me.fTotal + Me.fShippingFee - Me.fDiscount)
            Catch ex As Exception
                e.Item.Visible = False
            End Try
        End If
    End Sub
End Class
