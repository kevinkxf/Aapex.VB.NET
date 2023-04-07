Imports QSLib.Entities
Imports QSLib.Providers.LogProvider
Partial Class WebUserControls_OrderDetail
    Inherits System.Web.UI.UserControl

    Private oOrder As Orders.WebOrderInfo
    Private oOrderDrugs As Orders.WebOrderedDrugCollection
    Private fTotal As Decimal
    Private fDiscount As Decimal
    Private fShippingFee As Decimal

    Public Property OrderDataSource() As Orders.WebOrderInfo
        Get
            Return Me.oOrder
        End Get
        Set(ByVal value As Orders.WebOrderInfo)
            Me.oOrder = value
        End Set
    End Property

    Public Property OrderDrugDataSource() As Orders.WebOrderedDrugCollection
        Get
            Return Me.oOrderDrugs
        End Get
        Set(ByVal value As Orders.WebOrderedDrugCollection)
            Me.oOrderDrugs = value
        End Set
    End Property

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oOrderDrugs Is Nothing AndAlso Not Me.oOrder Is Nothing AndAlso Me.oOrderDrugs.Count > 0 Then
            Me.fShippingFee = Me.oOrder.ShippingCharges
            Me.fDiscount = Me.oOrder.ApplicableDiscounts
            Me.fTotal = 0
            Me.rpOrderDetail.DataSource = Me.oOrderDrugs
            Me.rpOrderDetail.DataBind()
        End If
    End Sub

    Protected Sub rpOrderDetail_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpOrderDetail.ItemDataBound
        If e.Item.ItemType = ListItemType.Header Then
            Try
                CType(e.Item.FindControl("lblName"), Label).Text = Me.oOrder.PatientInfo.FirstName & " " & Me.oOrder.PatientInfo.LastName
                CType(e.Item.FindControl("lblSex"), Label).Text = IIf(Me.oOrder.PatientInfo.Sex = "F", "Female", "Male")
                CType(e.Item.FindControl("lblBirthDate"), Label).Text = String.Format("{0:d}", Me.oOrder.PatientInfo.BirthDate)
                CType(e.Item.FindControl("lblOrderID"), Label).Text = "AAPEX- " & Me.OrderDataSource.ID.ToString.PadLeft(6, "0")
            Catch ex As Exception

            End Try
        ElseIf e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Try
                Dim oDrug As Orders.WebOrderedDrugInfo = CType(e.Item.DataItem, Orders.WebOrderedDrugInfo)
                CType(e.Item.FindControl("lblName"), Label).Text = String.Format("{0} {1} {2}", oDrug.Name, oDrug.Quantity, oDrug.Strength)
                'CType(e.Item.FindControl("lblStrength"), Label).Text = oDrug.Strength
                'CType(e.Item.FindControl("lblQuantity"), Label).Text = oDrug.Quantity
                CType(e.Item.FindControl("lblQTYOrdered"), Label).Text = oDrug.Qty
                Dim fPrice As Decimal
                Dim fPriceTotal As Decimal
                fPrice = oDrug.Price
                fPriceTotal = fPrice * oDrug.Qty
                CType(e.Item.FindControl("lblPrice"), Label).Text = String.Format("{0:c}", fPrice)
                CType(e.Item.FindControl("lblTotal"), Label).Text = String.Format("{0:c}", fPriceTotal)
                Me.fTotal += fPriceTotal
            Catch ex As Exception
                e.Item.Visible = False
                LoggerManager.LogError("OrderDetail.ascx||" & ex.Message)
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

            End Try
        End If
    End Sub
End Class
