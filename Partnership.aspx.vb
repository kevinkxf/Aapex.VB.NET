
Partial Class Partnership
    Inherits System.Web.UI.Page

    Protected Sub oForm_OnSubmitClicked(ByVal strTo As String, ByVal strEmailBody As String) Handles oForm.OnSubmitClicked
        Try
            If Common.EmailClient.GetInstance().SendEmail(strTo, Common.WebSetting.Setting.PartnershipEmail, "Partnership Request", strEmailBody, True) Then
                Me.mvPartnership.ActiveViewIndex = 1
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
