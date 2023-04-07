Imports QSLib.Entities
Partial Class changepassword
    Inherits System.Web.UI.Page

    Protected Sub oPasswordForm_OnUpdateClicked(ByVal strPassword As String) Handles oPasswordForm.OnUpdateClicked
        If My.User.IsAuthenticated AndAlso Patients.PatientAccountController.UpdatePatientAccountPassword(Common.WebSetting.Setting.AffiliateID, My.User.Name, strPassword) Then
            Me.mvUpdatePassword.ActiveViewIndex = 1
        End If
    End Sub
End Class
