Imports QSLib.Entities
Partial Class WebUserControls_SigninForm
    Inherits System.Web.UI.UserControl

    Public Event OnLoginClicked(ByVal strUsername As String)

#Region "Event Handler"
    Protected Sub validatorLogin_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorLogin.ServerValidate
        If Me.rvPassword.IsValid AndAlso Me.rvUsername.IsValid Then
            args.IsValid = Patients.PatientAccountController.AuthenticateUser(Me.txtUsername.Text, Me.txtPassword.Text, Common.WebSetting.Setting.AffiliateID)
        End If
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnLogin.Click
        If Me.Page.IsValid Then
            RaiseEvent OnLoginClicked(Me.txtUsername.Text)
        End If
    End Sub
    
#End Region
End Class
