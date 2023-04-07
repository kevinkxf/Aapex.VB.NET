
Partial Class WebUserControls_ChangePasswordForm
    Inherits System.Web.UI.UserControl

    Public Event OnUpdateClicked(ByVal strPassword As String)

    Protected Sub validatorPassword2_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorPassword2.ServerValidate
        args.IsValid = (Me.txtPassword1.Text = Me.txtPassword2.Text)
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            RaiseEvent OnUpdateClicked(txtPassword1.Text)
        End If
    End Sub
End Class
