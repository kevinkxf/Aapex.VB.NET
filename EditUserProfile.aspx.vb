Imports QSLib.Entities
Partial Class EditUserProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If My.User.IsAuthenticated And Not IsPostBack Then
            Me.oEditForm.PatientDataSource = Patients.PatientController.GetPatientInfoByID(Session("PatientID"))
        End If
    End Sub

    Protected Sub oEditForm_OnUpdateClicked(ByVal oPatient As QSLib.Entities.Patients.PatientInfo) Handles oEditForm.OnUpdateClicked
        If My.User.IsAuthenticated Then
            If Patients.PatientController.UpdatePatient(oPatient) Then
                Me.divMessage.Visible = True
                Me.lblErrorMessage.Text = "Your profile is updated."
            End If
        End If

    End Sub
End Class
