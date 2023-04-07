Imports QSLib.Entities
Partial Class WebUserControls_PaymentSummary
    Inherits System.Web.UI.UserControl
    Private oPayment As Orders.PaymentInfo

    Public Event OnChangePaymentClicked()

#Region "Properties"
    Public Property PaymentDataSource() As Orders.PaymentInfo
        Get
            Return Me.oPayment
        End Get
        Set(ByVal value As Orders.PaymentInfo)
            Me.oPayment = value
        End Set
    End Property
#End Region

#Region "Event Handlers"
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oPayment Is Nothing Then
            Me.lblMethod.Text = "Payment Method: " & Me.oPayment.PaymentMethod
            Select Case Me.oPayment.PaymentMethod
                Case "VISA", "MC"
                    Me.lblNumber.Text = "Credit Card Number: " & Me.oPayment.PaymentCardNum
                    Me.lblName.Text = "Name on Credit Card: " & Me.oPayment.PaymentNameOnCard
                    Me.lblDate.Text = "Expiry Date: " & Me.oPayment.PaymentExpiryDate.Month & "/" & Me.oPayment.PaymentExpiryDate.Year
                    Me.lblCVV2.Text = "CVV2: " & Me.oPayment.PaymentCardCVV2
                Case "AMEX", "DISCOVER"
                    Me.lblNumber.Text = "Credit Card Number: " & Me.oPayment.PaymentCardNum
                    Me.lblName.Text = "Name on Credit Card: " & Me.oPayment.PaymentNameOnCard
                    Me.lblDate.Text = "Expiry Date: " & Me.oPayment.PaymentExpiryDate.Month & "/" & Me.oPayment.PaymentExpiryDate.Year
            End Select
        End If
    End Sub
#End Region

    Protected Sub linkChangePayment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkChangePayment.Click
        RaiseEvent OnChangePaymentClicked()
    End Sub
End Class
