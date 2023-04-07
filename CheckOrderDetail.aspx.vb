Imports QSLib.Entities

Partial Class CheckOrderDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strID As String = Request.QueryString("id")
        Dim intID As Integer

        If Integer.TryParse(strID, intID) Then
            Dim oOrders As Orders.WebOrderCollection = Orders.WebOrderController.GetOrderInfoByWhere("WHERE o.ID=" & intID)
            If Not oOrders Is Nothing AndAlso oOrders.Count > 0 Then
                Me.oOrderDetail.OrderDataSource = oOrders(0)
                Me.oOrderDetail.OrderDrugDataSource = Orders.WebOrderedDrugController.GetOrderedDrugsByOrderID(intID)
            End If
        End If
    End Sub
End Class
