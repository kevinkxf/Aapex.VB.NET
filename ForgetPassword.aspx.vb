Imports QSLib.Entities
Partial Class ForgetPassword
    Inherits System.Web.UI.Page

    Protected Sub oForm_OnGetPasswordByEmailClicked(ByVal strEmail As String, ByVal dateDoB As Date) Handles oForm.OnGetPasswordByEmailClicked
        If Page.IsValid Then
            Try
                Dim oAccount As Patients.PatientAccountInfo = Patients.PatientAccountController.GetPatientAccountInfoByEmailBirthDate(Common.WebSetting.Setting.AffiliateID, strEmail, dateDoB.Date)
                If Not oAccount Is Nothing Then

                    Me.MultiView1.ActiveViewIndex = 1
                Else
                    Me.MultiView1.ActiveViewIndex = 2
                End If
            Catch ex As Exception
                Me.MultiView1.ActiveViewIndex = 2
            End Try
        End If
    End Sub

    Protected Sub oForm_OnGetPasswordByUsernameClicked(ByVal strUsername As String) Handles oForm.OnGetPasswordByUsernameClicked
        If Page.IsValid Then
            Try
                Dim oAccount As Patients.PatientAccountInfo = Patients.PatientAccountController.GetPatientAccountInfoByName(strUsername, Common.WebSetting.Setting.AffiliateID)
                If Not oAccount Is Nothing Then
                    Dim oP As Patients.PatientInfo = Patients.PatientController.GetPatientInfoByID(oAccount.PatientID)
                    Common.EmailClient.GetInstance.SendForgetPasswordMail(oP.Email, oAccount.Username, oAccount.Password)
                    Me.MultiView1.ActiveViewIndex = 1
                Else
                    Me.MultiView1.ActiveViewIndex = 2
                End If
            Catch ex As Exception
                Me.MultiView1.ActiveViewIndex = 2
            End Try
        End If
    End Sub
End Class
