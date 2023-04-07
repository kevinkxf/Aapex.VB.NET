Imports QSLib.Entities
Imports System.Transactions
Imports System.Web.Security
Partial Class Registration
    Inherits System.Web.UI.Page

#Region "Event handlers"
    Protected Sub oUserForm_OnRegisterClicked(ByVal strUsername As String, ByVal strPassword As String, ByVal oPatient As QSLib.Entities.Patients.PatientInfo) Handles oUserForm.OnRegisterClicked
        Try
            Dim intID As Integer
            'oPatient.PaymentAddress = oPatient.ShippingAddress
            Using oTrans As New TransactionScope
                intID = Patients.PatientController.AddNewPatient(oPatient)
                If intID > 0 AndAlso Patients.PatientAccountController.AddNewPatientAccount(strUsername, strPassword, intID, Common.WebSetting.Setting.AffiliateID) Then
                    Me.MergeShoppingCart(intID)
                    oTrans.Complete()
                    Session("PatientID") = intID
                    FormsAuthentication.SetAuthCookie(strUsername, False)
                    'FormsAuthentication.RedirectFromLoginPage(strUsername, True)
                End If
            End Using
            '--Added by Kevin on Mar 23,2011---
            Dim intReturn = Users.IPAddressController.AddIpHistory(intID, ClsIP.GetClientIP(), "A", "AAPex,Registe," & ClsIP.GetCountryCodeFromIP(ClsIP.GetClientIP())) '(categoryName, categoryUrl, categoryId)
            If intReturn = -1 Then
                'Failed.Do nothing.
            Else
                'Successed. Still do nothing.:)
            End If
            'Redirect to previous page
            Dim strReturn As String = Session("ReturnUrl")
            If String.IsNullOrEmpty(strReturn) OrElse (Not String.IsNullOrEmpty(strReturn) AndAlso Not Regex.IsMatch(strReturn, Common.WebSetting.Setting.AuthorizedPage, RegexOptions.IgnoreCase)) Then
                Response.Redirect("~/myaccount.html", True)
            Else
                Response.Redirect(strReturn, True)
            End If
        Catch ex As Exception

        End Try
    End Sub
#End Region

#Region "Private Functions"
    ''' <summary>
    ''' Merge Shopping Items from anonymous to patient
    ''' </summary>
    ''' <param name="intPatientID"></param>
    ''' <remarks></remarks>
    Private Sub MergeShoppingCart(ByVal intPatientID As Integer)
        Try
            Dim intID As Integer
            If Not Request.Cookies("ShoppingCartID") Is Nothing AndAlso Integer.TryParse(Request.Cookies("ShoppingCartID").Value, intID) Then
                Orders.ShoppingCartItemController.SwapShoppingCart(intID, Common.WebSetting.Setting.AffiliateID, intPatientID)
                Response.Cookies("ShoppingCartID").Expires = Date.Now.AddDays(-1)
            End If
        Catch ex As Exception

        End Try
    End Sub
#End Region


End Class
