Imports QSLib.Entities
Partial Class WebUserControls_OrderList
    Inherits System.Web.UI.UserControl
    Private oOrderList As Orders.WebOrderCollection

#Region "Event Handlers"
    Public Property OrderDataSource() As Orders.WebOrderCollection
        Get
            Return Me.oOrderList
        End Get
        Set(ByVal value As Orders.WebOrderCollection)
            Me.oOrderList = value
        End Set
    End Property

    Protected Sub rpList_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpList.ItemDataBound
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            Try
                Dim oOrder As Orders.WebOrderInfo = CType(e.Item.DataItem, Orders.WebOrderInfo)
                CType(e.Item.FindControl("hlOrderID"), HyperLink).Text = "AAPEX-" & oOrder.ID.ToString.PadLeft(6, "0")
                CType(e.Item.FindControl("hlOrderID"), HyperLink).NavigateUrl = "~/Order_" & oOrder.ID & "_Detail.html"
                CType(e.Item.FindControl("lblStatus"), Literal).Text = oOrder.Status
                CType(e.Item.FindControl("lblNote"), Literal).Text = oOrder.SpecialOrderingInstructions
                Dim oDrugs As Orders.WebOrderedDrugCollection = Orders.WebOrderedDrugController.GetOrderedDrugsByOrderID(oOrder.ID)
                Dim fTotal As Decimal = oOrder.AdditionalCharges + oOrder.ShippingCharges - oOrder.ApplicableDiscounts
                For Each oDrug As Orders.WebOrderedDrugInfo In oDrugs
                    fTotal += (oDrug.Price * oDrug.Qty)
                Next
                CType(e.Item.FindControl("lblTotal"), Literal).Text = String.Format("{0:c}", Math.Round(fTotal, 2, MidpointRounding.AwayFromZero))
                CType(e.Item.FindControl("lblorderDate"), Literal).Text = String.Format("{0:d}", oOrder.CreatedWhen)
            Catch ex As Exception
                e.Item.Visible = False
            End Try
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oOrderList Is Nothing AndAlso Me.oOrderList.Count > 0 Then
            Me.rpList.DataSource = Me.oOrderList
            Me.rpList.DataBind()
        Else
            mvOrderList.ActiveViewIndex = 1
        End If
    End Sub
#End Region
    
    
End Class
