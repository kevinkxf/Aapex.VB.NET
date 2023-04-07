Imports QSLib.Entities
Partial Class WebUserControls_PaymentForm
    Inherits System.Web.UI.UserControl

    Public Event OnSubmitClicked(ByVal oPayment As Orders.PaymentInfo)

#Region "Events handlers"
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Me.ddlYear.Items.Count = 0 Then
            Me.ddlYear.Items.Add(New ListItem("Year", ""))
            Dim intYear As Integer = DateTime.Now.Year
            For i As Integer = intYear To intYear + 10
                Me.ddlYear.Items.Add(i)
            Next
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            Dim oPayment As New Orders.PaymentInfo()
            oPayment.PaymentMethod = Me.ddlPaymentMethod.SelectedValue
            If oPayment.PaymentMethod = "VISA" OrElse oPayment.PaymentMethod = "MC" Then
                oPayment.PaymentCardNum = GetCardNumber(Me.txtCard.Text)
                oPayment.PaymentCardCVV2 = Me.txtCVV2.Text
                oPayment.PaymentNameOnCard = Me.txtName.Text
                oPayment.PaymentExpiryDate = New DateTime(Me.ddlYear.SelectedValue, Me.ddlMonth.SelectedValue, 1)
            ElseIf oPayment.PaymentMethod = "AMEX" OrElse oPayment.PaymentMethod = "DISCOVER" Then
                oPayment.PaymentCardNum = GetCardNumber(Me.txtCard.Text)
                oPayment.PaymentNameOnCard = Me.txtName.Text
                oPayment.PaymentExpiryDate = New DateTime(Me.ddlYear.SelectedValue, Me.ddlMonth.SelectedValue, 1)
            End If
            RaiseEvent OnSubmitClicked(oPayment)
        End If
    End Sub

    Protected Sub validatorCard_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorCard.ServerValidate
        If Me.ddlPaymentMethod.SelectedValue = "MO" OrElse Me.ddlPaymentMethod.SelectedValue = "" OrElse Me.ddlPaymentMethod.SelectedValue = "WIRE" Then
            args.IsValid = True
        Else
            args.IsValid = VerifyByLuhn(GetCardNumber(Me.txtCard.Text))
        End If
    End Sub

    Protected Sub validatorCardLength_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorCardLength.ServerValidate
        If Me.ddlPaymentMethod.SelectedValue = "MO" OrElse Me.ddlPaymentMethod.SelectedValue = "" OrElse Me.ddlPaymentMethod.SelectedValue = "WIRE" Then
            args.IsValid = True
        Else
            args.IsValid = Not String.IsNullOrEmpty(Me.txtCard.Text)
        End If
    End Sub

    Protected Sub validatorCVV2_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorCVV2.ServerValidate
        If Me.ddlPaymentMethod.SelectedValue = "MO" OrElse Me.ddlPaymentMethod.SelectedValue = "" OrElse Me.ddlPaymentMethod.SelectedValue = "WIRE" OrElse Me.ddlPaymentMethod.SelectedValue = "AMEX" OrElse Me.ddlPaymentMethod.SelectedValue = "DISCOVER" Then
            args.IsValid = True
        Else
            args.IsValid = (Not String.IsNullOrEmpty(Me.txtCVV2.Text)) And Regex.IsMatch(Me.txtCVV2.Text, "^[0-9]{3}")
        End If
    End Sub

    Protected Sub validatorExpiryDate_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorExpiryDate.ServerValidate
        If Me.ddlPaymentMethod.SelectedValue = "MO" OrElse Me.ddlPaymentMethod.SelectedValue = "" OrElse Me.ddlPaymentMethod.SelectedValue = "WIRE" Then
            args.IsValid = True
        Else
            args.IsValid = (Not String.IsNullOrEmpty(Me.ddlMonth.SelectedValue)) And (Not String.IsNullOrEmpty(Me.ddlYear.SelectedValue))
        End If
    End Sub

    Protected Sub validatorMethod_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorMethod.ServerValidate
        args.IsValid = Not String.IsNullOrEmpty(Me.ddlPaymentMethod.SelectedValue)
    End Sub

    Protected Sub validatorName_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorName.ServerValidate
        If Me.ddlPaymentMethod.SelectedValue = "MO" OrElse Me.ddlPaymentMethod.SelectedValue = "" OrElse Me.ddlPaymentMethod.SelectedValue = "WIRE" Then
            args.IsValid = True
        Else
            args.IsValid = Not String.IsNullOrEmpty(Me.txtName.Text)
        End If
    End Sub
#End Region

#Region "Private Methods"
    Private Function GetCardNumber(ByVal strValue As String) As String
        'Dim strT As String = strValue.Replace("-", "")
        'Dim intNumber As Integer = 0
        'Integer.TryParse(strT, intNumber)
        Return strValue.Replace("-", "")
    End Function

    Private Function VerifyByLuhn(ByVal strNumber As String) As Boolean
        Dim length As Integer = strNumber.Length

        If length < 13 Then
            Return False
        End If
        Dim sum As Integer = 0
        Dim offset As Integer = length Mod 2
        Dim digits As Byte() = New System.Text.ASCIIEncoding().GetBytes(strNumber)

        For i As Integer = 0 To length - 1
            digits(i) -= 48
            If ((i + offset) Mod 2) = 0 Then
                digits(i) *= 2
            End If

            sum += IIf((digits(i) > 9), digits(i) - 9, digits(i))
        Next
        Return ((sum Mod 10) = 0)
    End Function
#End Region
End Class
