Imports QSLib.Entities
Imports QSLib.Providers.LogProvider

Partial Class Checkout
    Inherits System.Web.UI.Page

#Region "Event Handlers"
    Protected Sub oAddressForm_OnAddAddressClicked(ByVal oAddress As QSLib.Entities.Patients.AddressInfo) Handles oAddressForm.OnAddAddressClicked
        Try
            If My.User.IsAuthenticated Then
                oAddress.PatientID = Session("PatientID")
                Dim strID As String = ViewState("EditAddressID")
                Dim intID As Integer
                If Not Integer.TryParse(strID, intID) Then
                    If Patients.AddressController.AddAddress(oAddress) Then
                        BindAddressList()
                    End If
                Else
                    If Patients.AddressController.UpdateAddressByID(intID, oAddress) Then
                        ViewState.Remove("EditAddressID")
                        BindAddressList()
                    End If
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oItems As Orders.ShoppingCartItemCollection = Orders.ShoppingCartItemController.GetShoppingCartByPatientID(Session("PatientID"), Common.WebSetting.Setting.AffiliateID)
        If oItems Is Nothing OrElse oItems.Count = 0 Then
            Response.Redirect("~/Searchdrug.html", True)
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'Dim intID As Integer = Session("PatientID")
        Try
            If Me.mvCheckout.ActiveViewIndex = 0 Then
                BindAddressList()
            ElseIf Me.mvCheckout.ActiveViewIndex = 1 Then
                ShowAddress()
            ElseIf Me.mvCheckout.ActiveViewIndex = 2 Then
                ShowSummary()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub oAddressList_OnDeleteClicked(ByVal intID As Integer) Handles oAddressList.OnDeleteClicked
        If Patients.AddressController.DeleteAddressByID(intID) Then
            BindAddressList()
        End If
    End Sub

    Protected Sub oAddressList_OnEditClicked(ByVal intID As Integer) Handles oAddressList.OnEditClicked
        ViewState.Add("EditAddressID", intID)
        Me.oAddressForm.EditForm = True
        Me.oAddressForm.Title = "Edit Address"
        Me.oAddressForm.AddressDataSource = Patients.AddressController.GetAddressByID(intID)
    End Sub

    Protected Sub oAddressList_OnUseClicked(ByVal intID As Integer) Handles oAddressList.OnUseClicked
        Dim strType As String = ViewState("AddressType")
        If strType = "Billing" Then
            Me.oBillingAddress.AddressDataSource = Patients.AddressController.GetAddressByID(intID)
            ViewState("BillingAddressID") = intID
        End If
        If strType = "Shipping" Then
            Me.oShippingAddress.AddressDataSource = Patients.AddressController.GetAddressByID(intID)
            ViewState("ShippingAddressID") = intID
        End If
        Me.mvCheckout.ActiveViewIndex = 1
    End Sub

    'The client wants to change the billing address
    Protected Sub oBillingAddress_OnChangeClicked() Handles oBillingAddress.OnChangeClicked
        ViewState("AddressType") = "Billing"
        Me.mvCheckout.ActiveViewIndex = 0
    End Sub

    'The client wants to change the shipping address
    Protected Sub oShippingAddress_OnChangeClicked() Handles oShippingAddress.OnChangeClicked
        ViewState("AddressType") = "Shipping"
        Me.mvCheckout.ActiveViewIndex = 0
    End Sub

    Protected Sub oBillingAddressSummary_OnChangeClicked() Handles oBillingAddressSummary.OnChangeClicked
        ViewState("AddressType") = "Billing"
        Me.mvCheckout.ActiveViewIndex = 0
    End Sub

    Protected Sub oShippingAddressSummary_OnChangeClicked() Handles oShippingAddressSummary.OnChangeClicked
        ViewState("AddressType") = "Shipping"
        Me.mvCheckout.ActiveViewIndex = 0
    End Sub

    'The client submitted the payment
    Protected Sub oPaymentForm_OnSubmitClicked(ByVal oPayment As QSLib.Entities.Orders.PaymentInfo) Handles oPaymentForm.OnSubmitClicked
        ViewState("Payment") = oPayment
        mvCheckout.ActiveViewIndex = 2
    End Sub

    'Submit the order to database
    Protected Sub btnPurchase_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnPurchase.Click
        Dim intOrderId As Integer = SubmitOrder()
        If intOrderId > 0 AndAlso Orders.ShoppingCartItemController.EmptyShoppingCartByPatientID(Session("PatientID"), Common.WebSetting.Setting.AffiliateID) Then
            Me.mvCheckout.ActiveViewIndex = 3
            Me.linkOrderID.Text = "AAPEX-" & intOrderId.ToString.PadLeft(6, "0")
            Me.linkOrderID.NavigateUrl = String.Format("Order_{0}_Detail.html", intOrderId)
            Dim strOrderID(0) As String
            strOrderID(0) = intOrderId
            Dim oPatient As Patients.PatientInfo = Patients.PatientController.GetPatientInfoByID(Session("PatientID"))
            If Not oPatient Is Nothing Then
                Common.EmailClient.GetInstance.SendOrderConfirmationEmail(oPatient.Email, oPatient.FirstName & " " & oPatient.LastName, strOrderID)
            End If
            '--Added by Kevin on Mar 23,2011---
            Dim intReturn = Users.IPAddressController.AddIpHistory(Session("PatientID"), ClsIP.GetClientIP(), "A", "AAPex,Send Order," & ClsIP.GetCountryCodeFromIP(ClsIP.GetClientIP()) & ",OrderId:" & intOrderId) '(categoryName, categoryUrl, categoryId)
            If intReturn = -1 Then
                'Failed.Do nothing.
            Else
                'Successed. Still do nothing.:)
            End If
        Else
            LoggerManager.LogError("Failed to check out")
        End If
    End Sub

    'Go back to previous view
    Protected Sub btnGoback_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnGoback.Click
        mvCheckout.ActiveViewIndex = 1
    End Sub

    'Go back to payment
    Protected Sub oPaymentSummary_OnChangePaymentClicked() Handles oPaymentSummary.OnChangePaymentClicked
        mvCheckout.ActiveViewIndex = 1
    End Sub
#End Region

#Region "Private Methods"
    Private Sub BindAddressList()
        If My.User.IsAuthenticated Then
            Me.oAddressList.AddressDataSource = Patients.AddressController.GetAddressByPatientID(Session("PatientID"))
        End If
    End Sub

    Private Sub ShowSummary()
        If My.User.IsAuthenticated Then
            Dim oCart As Orders.ShoppingCartItemCollection = Orders.ShoppingCartItemController.GetShoppingCartByPatientID(Session("PatientID"), Common.WebSetting.Setting.AffiliateID)
            If oCart Is Nothing OrElse oCart.Count = 0 Then
                Response.Redirect("~/ShoppingCart.html", True)
            End If
            Me.oSummary.ShoppingCartItemDataSource = oCart
            Me.oPaymentSummary.PaymentDataSource = ViewState("Payment")
            Dim strBillingID As String = ViewState("BillingAddressID")
            Dim strShippingID As String = ViewState("ShippingAddressID")
            Dim oPatient As Patients.PatientInfo = Patients.PatientController.GetPatientInfoByID(Session("PatientID"))
            Dim intBillingID As Integer
            Dim intShippingID As Integer
            If Integer.TryParse(strBillingID, intBillingID) Then
                Me.oBillingAddressSummary.AddressDataSource = Patients.AddressController.GetAddressByID(intBillingID)
            Else
                Me.oBillingAddressSummary.AddressDataSource = oPatient.PaymentAddress
            End If

            If Integer.TryParse(strShippingID, intShippingID) Then
                Me.oShippingAddressSummary.AddressDataSource = Patients.AddressController.GetAddressByID(intShippingID)
            Else
                Me.oShippingAddressSummary.AddressDataSource = oPatient.ShippingAddress
            End If
        End If
    End Sub

    Private Sub ShowAddress()
        If My.User.IsAuthenticated Then
            Dim strBillingID As String = ViewState("BillingAddressID")
            Dim strShippingID As String = ViewState("ShippingAddressID")
            Dim oPatient As Patients.PatientInfo = Patients.PatientController.GetPatientInfoByID(Session("PatientID"))
            Dim intBillingID As Integer
            Dim intShippingID As Integer
            If Integer.TryParse(strBillingID, intBillingID) Then
                Me.oBillingAddress.AddressDataSource = Patients.AddressController.GetAddressByID(intBillingID)
            Else
                Me.oBillingAddress.AddressDataSource = oPatient.PaymentAddress
            End If

            If Integer.TryParse(strShippingID, intShippingID) Then
                Me.oShippingAddress.AddressDataSource = Patients.AddressController.GetAddressByID(intShippingID)
            Else
                Me.oShippingAddress.AddressDataSource = oPatient.ShippingAddress
            End If
        End If
    End Sub

    ''' <summary>
    ''' Methods used in order submission.
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function SubmitOrder() As Integer
        SubmitOrder = 0
        Dim oCart As Orders.ShoppingCartItemCollection = Orders.ShoppingCartItemController.GetShoppingCartByPatientID(Session("PatientID"), Common.WebSetting.Setting.AffiliateID)
        If oCart Is Nothing OrElse oCart.Count = 0 Then
            Response.Redirect("~/ShoppingCart.html", True)
        End If
        Dim oPatient As Patients.PatientInfo = Patients.PatientController.GetPatientInfoByID(Session("PatientID"))
        Dim oPayment As Orders.PaymentInfo = ViewState("Payment")
        Dim strBillingID As String = ViewState("BillingAddressID")
        Dim strShippingID As String = ViewState("ShippingAddressID")
        Dim intBillingID As Integer
        Dim intShippingID As Integer
        If Not oPatient Is Nothing AndAlso Not oPayment Is Nothing AndAlso Not oCart Is Nothing AndAlso oCart.Count > 0 Then
            If Integer.TryParse(strBillingID, intBillingID) Then
                oPatient.PaymentAddress = Patients.AddressController.GetAddressByID(intBillingID)
            End If
            If Integer.TryParse(strShippingID, intShippingID) Then
                oPatient.ShippingAddress = Patients.AddressController.GetAddressByID(intShippingID)
            End If

            If Not oPatient.ShippingAddress Is Nothing AndAlso Not oPatient.PaymentAddress Is Nothing Then
                Dim oOrder As New Orders.WebOrderInfo()
                oOrder.PatientInfo = oPatient
                oOrder.PaymentInfo = oPayment
                oOrder.AddressForPickup = oPatient.ShippingAddress
                oOrder.AdditionalCharges = 0
                oOrder.AgentCommissionFlat = 0
                oOrder.AgentCommissionPer = 0
                oOrder.ApplicableDiscounts = 0
                oOrder.ConsentSendMethod = "Internet"
                oOrder.CreatedBy = Common.WebSetting.Setting.WebSiteName
                oOrder.FamilyOrder = False
                oOrder.Monograph = False
                oOrder.PatientType = ""
                oOrder.PaymentReceived = False
                oOrder.PaymentSpecialInstructions = ""
                oOrder.PharmacyID = 0
                oOrder.PicknPackID = 0
                oOrder.PreOrderID = 0
                oOrder.PrescriptionSendMethod = ""
                oOrder.ShippingCharges = Common.WebSetting.Setting.DefaultShippingFee
                oOrder.ShippingType = "EXPRESS"
                oOrder.SpecialOrderingInstructions = ""
                oOrder.Status = "PEND"
                oOrder.StatusReason = ""
                Using oTransaction As New Transactions.TransactionScope()
                    SubmitOrder = Orders.WebOrderController.AddOrder(oOrder)
                    Dim intOrderID As Integer = SubmitOrder
                    If SubmitOrder > 0 Then
                        For Each oItem As Orders.ShoppingCartItemInfo In oCart
                            Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, oItem.DrugID)
                            If Not oDrug Is Nothing AndAlso _
                                    Orders.WebOrderedDrugController.AddOrderedDrug(SubmitOrder, _
                                                                                    oDrug.ID, _
                                                                                    oDrug.Name, _
                                                                                    oDrug.Strength, _
                                                                                    oDrug.Quantity, _
                                                                                    oDrug.Units, _
                                                                                    oItem.QTYOrdered, _
                                                                                    oDrug.Origin, _
                                                                                    oDrug.Type = "G", _
                                                                                    Common.Utilies.GetPriceMatchedPrice(oDrug.Price, oItem.PriceBeat, oItem.URL), _
                                                                                    oDrug.BasePrice, _
                                                                                    oDrug.RXCost, _
                                                                                    "", _
                                                                                    "New RX", _
                                                                                    oDrug.DrugGroupID, _
                                                                                    0, oDrug.Type, oDrug.ProductSKU, oDrug.ProductName, oDrug.ProductID) > 0 Then
                                'Successfully submit ordered drugs
                                If Not String.IsNullOrEmpty(oItem.URL) Then
                                    If Not Orders.PriceMatchController.AddPriceMatch(intOrderID, oItem.DrugID, oDrug.Price, oItem.PriceBeat, oItem.URL, 10) Then
                                        'Can't insert price match
                                        SubmitOrder = 0
                                        Exit Function
                                    End If
                                End If

                            Else
                                SubmitOrder = 0
                                Exit Function
                            End If
                        Next
                    End If
                    oTransaction.Complete()
                End Using
            End If
        End If
    End Function
#End Region
End Class
