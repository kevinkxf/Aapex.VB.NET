Imports QSLib.Entities

Partial Class CheckOrder
    Inherits System.Web.UI.Page

#Region "Event Handlers"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strID As String = Request.QueryString("id")
        Dim intID As Integer
        Dim intPatientID As Integer = Session("PatientID")

        'Show order Detail
        If Integer.TryParse(strID, intID) Then

            Dim oOrders As Orders.WebOrderCollection = Orders.WebOrderController.GetOrderInfoByWhere("WHERE o.ID=" & intID)
            If Not oOrders Is Nothing AndAlso oOrders.Count > 0 Then
                Dim oOrder As Orders.WebOrderInfo = oOrders(0)
                If oOrder.PatientInfo.ID = intPatientID Then
                    Me.mvOrder.ActiveViewIndex = 1
                    Me.oOrderDetail.OrderDataSource = oOrders(0)
                    Me.oOrderDetail.OrderDrugDataSource = Orders.WebOrderedDrugController.GetOrderedDrugsByOrderID(intID)
                Else
                    'Not your order.
                    mvOrder.ActiveViewIndex = 2
                End If
                Exit Sub 'Don't show the list view
            End If
        End If

        'By Default, show Patient Order History
        Me.mvOrder.ActiveViewIndex = 0
        Dim oList As Orders.WebOrderCollection = Orders.WebOrderController.GetOrderInfoByWhere("WHERE o.PatientID=" & intPatientID)
        Me.oOrderList.OrderDataSource = oList
    End Sub
#End Region

    
End Class
