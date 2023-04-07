Imports QSLib.Entities
Partial Class ShoppingCart
    Inherits System.Web.UI.Page
#Region "Event Handlers"

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'If Not Page.IsPostBack Then     'Remove by Jerry On Jun 25th,2010 to refresh page 
            BindData()
        'End If
    End Sub

    Protected Sub oShoppingCart_OnCheckOutClicked() Handles oShoppingCart.OnCheckOutClicked
        Response.Redirect("~/Checkout.html", True)
    End Sub

    Protected Sub oShoppingCart_OnDeleteItemClicked(ByVal intDrugID As Integer) Handles oShoppingCart.OnDeleteItemClicked
        If Orders.ShoppingCartItemController.DeleteItemFromCart(GetShoppingCartID(), Common.WebSetting.Setting.AffiliateID, intDrugID) Then
            BindData()
        End If
    End Sub

    Protected Sub oShoppingCart_OnEmptyShoppingCartClicked() Handles oShoppingCart.OnEmptyShoppingCartClicked
        If Orders.ShoppingCartItemController.EmptyShoppingCartByPatientID(GetShoppingCartID(), Common.WebSetting.Setting.AffiliateID) Then
            BindData()
        End If
    End Sub


    Protected Sub oShoppingCart_OnUpdateShoppingCartClicked(ByVal intDrugID As Integer, ByVal intQTYOrdered As Integer) Handles oShoppingCart.OnUpdateShoppingCartClicked
        Dim oItem As Orders.ShoppingCartItemInfo = Orders.ShoppingCartItemController.GetShoppingCartByDrugID(GetShoppingCartID(), Common.WebSetting.Setting.AffiliateID, intDrugID)
        oItem.QTYOrdered = intQTYOrdered
        Orders.ShoppingCartItemController.UpdateShoppingCart(oItem)
    End Sub
#End Region

#Region "Private Functions"
    Private Sub BindData()
        Dim oItems As Orders.ShoppingCartItemCollection = Orders.ShoppingCartItemController.GetShoppingCartByPatientID(GetShoppingCartID(), Common.WebSetting.Setting.AffiliateID)
        If oItems.Count > 0 Then
            Me.oShoppingCart.ShoppingCartItemDataSource = oItems
            Me.mvShoppingCart.ActiveViewIndex = 0
        Else
            'Me.MasterPageFile =""
            Me.mvShoppingCart.ActiveViewIndex = 1
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
#End Region

   
End Class
